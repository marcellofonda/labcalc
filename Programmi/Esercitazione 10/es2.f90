module funzioni
use tipi
implicit none
contains
function f(x) result(res)
 real(rk),intent(in) :: x
 real(rk)			:: res
 res = exp(-x**2)
end function
end module

program aa
use integrazione
use funzioni
implicit none
real(rk):: i1,i2,epsilon=0.0001
integer::i

i1=integrale_trap(f,0._rk,25._rk,1000000)
do i=1,10000000
	
	i2=integrale_trap(f,0._rk,real(25+i, rk),1000000+i*10)

	if(i1-i2 < epsilon) exit
	
	i1=i2
end do

print*, i1*2

end program