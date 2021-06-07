module funzioni
use tipi
implicit none
contains
function f(x) result(res)
	real(rk), intent(in)	:: x
	real(rk)				:: res
	
	res=sqrt(x**3)
end function f
end module funzioni


program carramba
use integrazione
use funzioni
implicit none

real(rk)	:: integrale
integer	:: N, i

do i=5,25000
	N=2*i
	call integrale_simp(f, 0._rk,1._rk,N,integrale)
	write(1,*) log(real(N,rk)), log(abs(integrale_trap(f,0._rk,1._rk,N)-0.4_rk))
	write(2,*) log(real(N,rk)), log(abs(integrale-0.4_rk))
end do

end program