module funzioni
implicit none
contains

function funzione(x,z) result(res)
	real,intent(in):: x,z
	real :: res
	res= x**2-z
end function

subroutine radice(a0,b0,z,delta,res)
	real,intent(in) :: a0,b0,z,delta
	real,intent(out) :: res
	real :: x, a, b, c, fa, fb, fc
	integer :: i, trovato
	trovato=0
	
	if(z<0 .or. b<0 .or. a>b) then
		print*, "Errore! Si sta cercando di calcolare la radice di numeri negativi, oppure l'intervallo e' mal definito"
	else
		if(a0<0) then
			a=0
		else
			a=a0
		end if
		b=b0
		fa=funzione(a,z)
		fb=funzione(b,z)
		if(fa*fb>0) then
			print*, "Mi dispiace, non so trovare zeri in questo intervallo." 
			res=1/(z-z)
		elseif (fa==0) then
			print*, "Fortunello, x=a, con a=", a, "e' gia' soluzione!"
			res=a
		elseif (fb==0) then
			print*, "Fortunello, x=b, con b=", b, "e' gia' soluzione!"
			res=b
		else
			do i=1,10000
				c=(a+b)/2
				
				fc=funzione(c,z)
				print*, "c =", c, "fc=",fc
				if (b-a < delta .or. fc==0) then
					print*, "Dopo ",i," passi ho trovato la soluzione per x=",c
					res=c
					trovato=1
					EXIT
				else if(fa*fc<0) then
					b=c
					fb=fc
				else
					a=c
					fa=fc 
				end if
			end do
			if(trovato==0) then
				print*, "Non ho trovato niente, mi dispiace, cerca altrove"
				res=1/(z-z)
			end if
		end if
	end if
end subroutine

end module

program ciao
use funzioni
implicit none
real :: a,b,c

call radice(a0=0.,b0=12.,z=81.,delta=.1,res=a)
call radice(-4.,7.,81.,.1,b)
call radice(7.,12.,81.,.0001,c)

print*, a, b, c

end program