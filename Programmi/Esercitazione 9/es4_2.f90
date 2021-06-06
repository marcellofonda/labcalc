module funzioni
contains

function seno(x,z) result(res)
	real, intent(in) :: x,z
	real :: res
	res = x-sin(z)
end function

function coseno(x) result(res)
	real, intent(in) :: x
	real :: res
	res=cos(x)
end function

function derivata(x) result(res)
 real, intent(in) :: x
 real :: res
 res = 2 * x
end function

function funzione1(x,z) result(res)
	real,intent(in):: x,z
	real :: res
	if(z<0) then
		res=1/(z-z) !Se cerchi di calcolare radici di negativi restituisci infinito
	else
		res= x**2-z
	end if
end function

subroutine radice(z, delta, res, f, fprimo)
	real, intent(in) :: z, delta
	real, intent(out) :: res
	real :: deriv, x, fx, x1
	integer :: i, trovato
	
	interface
		function f(x,z) result(risult)
			real,intent(in):: x,z
			real :: risult	!Devo dare un nome diverso al risultato, altrimenti confligge con res della subroutine
		end function f
		function fprimo(x) result(res)
			real, intent(in) :: x
			real :: res
		end function fprimo
	end interface
	
	trovato=0
	
	x=z
	
	do i=1,10000
		deriv=fprimo(x)
		fx=f(x,z)
		if(fx==0) then
			res=x
			trovato=1
			print*, "La soluzione e' l'input stesso"
			EXIT
		end if
		x1=x-(fx/deriv)
		
		if(abs(x-x1)<delta .or. f(x1,z)==0) then
			print*, "Dopo ",i," passi ho trovato la soluzione:",x1
			res=x1
			trovato=1
			EXIT
		else
			x=x1
		end if
	end do
	if(trovato==0) then
		print*, "Mi dispiace, non riesco a trovare zeri."
		res=1/(z-z) !Se non trovi niente restituisci infinito
	end if
end subroutine

end module funzioni

program a
use funzioni
implicit none

real :: x, radix, delta
real,dimension(5) :: rad

read*, x, delta
call radice(x,delta,radix, funzione1, derivata)
call radice(81.,.1,rad(1), funzione1, derivata)
call radice(81.,.01,rad(2),funzione1, derivata)
call radice(0.,.1,rad(3), funzione1, derivata)
call radice(-1.,.1,rad(4), funzione1,derivata)
call radice(acos(sqrt(2.)/2),.0001, rad(5), seno, coseno)
!call radice(0.,.01, rad(6), coseno, -seno)
print*, "La radice di ",x, " e' ",radix
print*, rad

end program a