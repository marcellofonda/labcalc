program grafico
implicit none

integer :: n, contatore
real	:: passo, x,y

n=1000
passo=3.0/n
x=-1.5
contatore = 0
print*,exp(1.0)

!Il metodo che ho usato non e' quello suggerito dal professore. Invece di
!calcolare ogni x con una formula, la faccio partire dal valore piu' basso e 
!sommo l'ampiezza del singolo intervallo finche' non supero il valore massimo.
!A quel punto, metto in grafico anche il valore massimo e controllo di avere un
!numero corretto di intervalli.
do
	if (x>1.5) exit
	contatore = contatore + 1
	write(1,*) x, exp(-4*(x**2))*sin(10*x)
	x= x+passo
end do
write(1,*)1.5, exp(-4*(1.5**2))*sin(15.)
if(contatore==n) then
	print*, 'Operazione completata, nessun errore.'
else
	print*, 'ERRORE: il numero effettivo di intervalli non è quello richiesto.'
end if
end program