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
