module abc
    implicit none
    
    intrinsic sin               ! mantiene il significato usuale per argomenti per cui
                                ! la funzione intrinseca e' definita
    interface sin               ! estende il dominio della funzione intrinseca
        module procedure sini   ! procedure e' il nome generico che Fortran da' ai sottoprogrammi
    end interface sin

contains
    elemental function sini(i) result(res)
        integer,intent(in):: i
        real :: res
        res=sin(real(i))
    end function sini
end module abc
