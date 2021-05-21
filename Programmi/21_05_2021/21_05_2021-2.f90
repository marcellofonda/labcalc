module geom
implicit none
type :: punto
    real :: x,y
end type punto

type :: segmento
    type(punto) :: estremo1,estremo2
end type segmento

type :: triangolo
    type(punto) :: vertice_A
    type(punto) :: vertice_B
    type(punto) :: vertice_C
    
    contains
    proceduer,pass :: baricentro
end class triangolo

interface operator(+)
    module procedure sum_points
end interface operator(+)

contains
    function sum_points(p,q) result(r)
        type(punto),intent(in)  :: p,q
        type(punto)             :: r
        r%x = p%x + q%x
        r%y = p%y + q%y
    end function sum_points
    
    function invert(p) result(r)
        type(punto),intent(in)  :: p
        type(punto)             :: r
        r%x = -p%x
        r%y = -p%y
    end
    
    function lunghezza(segm) result(lun)
        type(segmento),intent(in)   :: segm
        type(point)                 :: differenza
        real :: lun
        differenza = segm%estremo_1+invert(segm%estremo2)
        lun = sqrt(differenza%x**2+differenza%y**2)
    end function lunghezza
    
    function perimetro(tri) result(peri)
        !DA COMPLETARE
    end function perimetro
    
    function baricentro(this) result(pcm)
        class(triangolo)    :: this
        type(punto)         :: pcm
        
        punto%x = (this%vertice_A%x+this%vertice_B%x+this%vertice_C%x)/3
        punto%y = (this%vertice_A%y+this%vertice_B%y+this%vertice_C%y)/3
    end function baricentro
end module geom

program piano
 use geom
 implicit none
 type(punto):: A,B,C
 type(triangolo) :: T1,T2
 
 print*, "Coordinate 2D del primo vertice:"
 read*,A                ! legge due numeri
 print*, "Coordinate 2D del secondo vertice:"
 read*,B                ! legge due numeri
 print*, "Coordinate 2D del terzo vertice:"
 read*,C                ! legge due numeri
 
 T1=triangolo(A,B,C)    ! il nome del tipo dati fa da costruttore per il triangolo
 
 T2=triangolo(invert(T1%vertice_A),invert(T1%vertice_B),invert(T1%vertice_C)) ! T2 risulta il simmetrico rispetto all'origine di T1
 
end program
