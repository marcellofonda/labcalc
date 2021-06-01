module prec 
implicit none
   integer,parameter :: rk=selected_real_kind(12)
end module prec

module ieee_test
 use prec
 implicit none

contains

 function is_normal(x) result(ans)
   real(kind=rk),intent(in) :: x
   logical :: ans
   ans=.true.
   if(abs(x)>huge(x)) ans=.false.
   if(x/=x) ans=.false.
 end function is_normal

end module ieee_test


module funzioni
use ieee_test
implicit none

contains

recursive subroutine prima(x,i)
real(kind=rk),intent(in) :: x
integer,intent(in)::i
write(1,*) i, x, (-3* x**2)/4
if(i<100 .and. is_normal(x)) then
	call prima (((2-(x**3))/4),i+1)
else
	print*,i, x, (-3* x**2)/4
end if
end subroutine prima

subroutine seconda(x,i)
real(kind=rk),intent(in) :: x
integer,intent(in)::i
write(2,*) i, x, 4*(x-1)/x**3

if(i<100 .and. is_normal(x)) then
	call prima (((2-4*x)/x**2),i+1)
else
	print*,i, x, 4*(x-1)/x**3
end if
end subroutine seconda

subroutine terza(x,i)
real(kind=rk),intent(in) :: x
integer,intent(in)::i
write(3,*) i, x, -3*(1+x**2)

if(i<100 .and. is_normal(x)) then
	call prima (2- 3*x - x**3,i+1)
else 
	print*,i, x, -3*(1+x**2)
end if
end subroutine terza

end module funzioni

program acca
use funzioni
implicit none

real(rk) :: x
integer::i

read*, x

call prima(x,0)
call seconda(x,0)
call terza(x,0)
end program acca