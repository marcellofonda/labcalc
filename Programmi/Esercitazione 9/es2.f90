module funzioni
contains

function derivata(x) result(res)
 real, intent(in) :: x
 real :: res
 res = 2 * x
end function

function funzione1(x,z) result(res)
	real,intent(in):: x,z
	real :: res
	if(z<0) then
		res=1/(z-z)
	else
		res= x**2-z
	end if
end function

subroutine radice(z, delta, res)
	real, intent(in) :: z, delta
	real, intent(out) :: res
	real :: deriv, x, fx, x1
	integer :: i, trovato
	trovato=0
	
	x=z
	
	do i=1,10000
		deriv=derivata(x)
		fx=funzione1(x,z)
		if(fx==0) then
			res=x
			trovato=1
			print*, "La soluzione e' l'input stesso"
			EXIT
		end if
		x1=x-(fx/deriv)
		
		if(abs(x-x1)<delta .or. funzione1(x1,z)==0) then
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
		res=1/(z-z)
	end if
end subroutine

end module funzioni

program a
use funzioni
implicit none

real :: x, radix, delta
real,dimension(4) :: rad

read*, x, delta
call radice(x,delta,radix)
call radice(81.,.1,rad(1))
call radice(81.,.01,rad(2))
call radice(0.,.1,rad(3))
call radice(-1.,.1,rad(4))
print*, "La radice di ",x, " e' ",radix
print*, rad

end program a