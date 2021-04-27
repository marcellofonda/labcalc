program ingenuity
integer, parameter :: tipo=selected_real_kind(6)
real(tipo) :: x,cavia=1._tipo

do
	!print*, cavia
	x=cavia/2
	if(x==0._tipo) then
		print*, cavia
		exit
	end if
	cavia = x
end do
end program