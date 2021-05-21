module subrout

contains

subroutine check(x,y)
	real,intent(inout) :: x,y
	real				:: temp
	if(x>y) then
		temp=x
		x=y
		y=temp
	end if
end subroutine

subroutine sort(a)
	real,dimension(:),intent(inout) :: a
	
	integer :: i,j, N
	real :: temp
	
	N=size(a)
	do i=1,N
		do j=1,(N-1)
			call check(a(j),a(j+1))
		end do
	end do
	
end subroutine

end module subrout


program bubblesort
use subrout
implicit none
real,dimension(:),allocatable	:: a
integer						:: N

read*, N
allocate(a(N))
read*, a
print*, a
call sort(a)
print*, a


end program bubblesort