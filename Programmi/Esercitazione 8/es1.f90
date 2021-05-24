module funzioni
implicit none
contains
recursive function euclide(a,b) result(res)
 integer,intent(in)	:: a,b
 integer				:: res
if(a*b==0) then
	res=max(a,b)
else
	res=euclide(b,mod(a,b))
end if
end function euclide
end module funzioni

program prog
use funzioni
implicit none


integer	:: a,b
print*,"a?"
read*, a
print*,"b?"
read*, b

print*, "Il MCD tra a e b e'", euclide(a,b)


end program prog