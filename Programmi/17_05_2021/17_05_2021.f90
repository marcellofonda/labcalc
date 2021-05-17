module fattoriali

contains

!Implementazione ricorsiva del fattoriale
recursive function nfat(N) result(res)
    integer,intent(in)  :: N
    integer             :: res
    if(n==0) then
        res=1
    else
        res=N * nfat(N-1)
    end if
end function nfat

!Implementazione iterativa del fattoriale
function iterfat(N) result(res)
    integer,intent(in)  :: N
    integer             :: res=1
    
    do i=1,N
        res=res*i
    end do
end function

end module fattoriali
