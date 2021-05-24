module geom
implicit none

type :: punto
    real ::x,y
end type punto

type :: triangolo
    type(punto) :: vertice_A
    type(punto) :: vertice_B
    type(punto) :: vertice_C
end type triangolo
 
contains

function sum_points(p,q) result(r)
type(punto), intent(in) :: p,q
type(punto)             :: r
r%x = p%x + q%x
r%y = p%y + q%y
end function sum_points

function invert(p) result(r)
type(punto), intent(in) :: p
type(punto) :: r
r%x = -p%x
r%y = -p%y
end function invert

function scala(p,k) result(res)
type(punto),intent(in)		:: p
real,intent(in)				:: k
type(punto)					:: res

res=punto(p%x*k,p%y*k)
end function scala

subroutine stampa(t)
 type(triangolo),intent(in)	:: t
 write(20,*) t%vertice_A
 write(20,*) t%vertice_B
 write(20,*) t%vertice_C
 write(20,*) t%vertice_A
end subroutine stampa
end module geom


program piano
use geom
implicit none
type(punto) :: A,B,C
type(triangolo) :: T1, T2, T3

print*,'coordinate 2D primo vertice'
read*,A
print*,'coordinate 2D secondo vertice'
read*,B
print*,'coordinate 2D terzo vertice'
read*,C
T1 = triangolo(A,B,C)  ! il nome del tipo dati "costruisce" una variabile 
                       ! dello stesso tipo a partire dai 3 campi  
print*,' vertice A: ',T1%vertice_A
print*,' vertice B: ',T1%vertice_B
print*,' vertice C: ',T1%vertice_C

T2%vertice_A = invert(T1%vertice_A)
T2%vertice_B = invert(T1%vertice_B)
T2%vertice_C = invert(T1%vertice_C)

T3=triangolo(scala(T2%vertice_A,.5),scala(T2%vertice_B,.5),scala(T2%vertice_C,.5))
print*,'coppie di coordinate dei vertici del triangolo T2', T2

call stampa(T2)
write(20,*)
write(20,*)
call stampa(T3)

end program piano