program pallino

implicit none
integer, parameter :: ik = selected_real_kind(33)
integer :: i,N
real(kind=ik) :: pi, x, y, a, b

print*, "Inserire numero di punti:"
read*, N

a=0._ik
b=0.001_ik
pi = acos(-1.0_ik)

do i = 1,N
	x= a + i*(b-a)/N
	y = sqrt(2/pi/x)*((3/x**2-1)*sin(x)-3/x*cos(x))
	write(1,*)x,y
end do

end program