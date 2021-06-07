module funzioni
 use tipi
 implicit none
 contains
 
  function f1(x) result(res)
  	real(rk),intent(in)	:: x
  	real(rk)				:: res
  	res = x**4
  end function f1
  
end module funzioni

program patate
use integrazione
use funzioni
implicit none
integer::N
real(rk)::I

print*,"Quanti punti si vuole considerare?"
read*,N
call integrale_simp(f1,0._rk,1._rk,100,I)
print*, integrale_trap(f1,0._rk,1._rk,100), I
end program patate