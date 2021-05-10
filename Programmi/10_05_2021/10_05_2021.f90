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



program usaproc
use procedure, pi=>pi_g                         ! Questa riga specifica che usiamo il modulo procedure. Siccome procedure usa prec, prec viene automaticamente aggiunto.
implicit none                                   ! Il parametro pi_g del modulo viene importato come pi. Altrimenti sarebbe in conflitto con il pi_g definito nel program.

real(rk),parameter  :: pi_g = acos(-1.0_rk)     ! Questa riga darebbe errore senza la precauzione di importare pi_g come pi dal modulo.

real(rk)    :: p,g,r

read*, p                                        ! p è il punto in cui vogliamo valutare la funzione, leggiamolo da tastiera

r = f1(p)
print*, r, f1(p)                                ! Notare che print e write accettano una lista di espressioni da scrivere, cioè
                                                ! una costante letterale, una variabile o una funzione valutata in un punto

call sub1(p, g)                                 ! Fa la stessa identica cosa, ma salva il risultato in g
print*, g, pi_g
end program usaproc
