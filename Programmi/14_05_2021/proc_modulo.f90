module prec
implicit none
integer,parameter   :: rk=selected_real_kind(8) ! Questa variabile, essendo definita qui, è disponibile a tutto il modulo e anche al program
end module prec


module procedure                                !Questo modulo contiene tutte le procedure
use prec
implicit none                                   !Se questo e' scritto all'inizio vale per tutte le funzioni e subroutine

real(rk),parameter  :: pi_g = acos(-1.0_rk)     ! Questa variabile, essendo definita qui, è disponibile a tutto il modulo e anche al program

contains
    function f1(x) result(res)
        real(rk),intent(in) :: x                ! x e' l'argomento, di tipo real. L'attributo intent(in) specifica che è un argomento, non modificabile all'esterno
        real(rk)            :: res              ! res è il risultato, come dichiarato sopra
        
        res = exp(-x**2)*(1+x)
    end function f1
    
    subroutine sub1(x,y)
        real(rk),intent(in) :: x                ! x, come prima, e' l'argomento in ingresso 
        real(rk),intent(out):: y                ! y e' il valore di uscita: viene modificata la variabile stessa che mettiamo in parentesi nel "call"
        
        y = exp(-x**2)*(1+x)
    end subroutine sub1
end module procedure
