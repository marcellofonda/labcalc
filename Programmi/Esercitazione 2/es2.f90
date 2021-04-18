program sommatoria
implicit none

integer :: somma=0, j, n, sommacalcolata, sommameglio, i, k

read*,n

!Calcolo la somma dei primi n quadrati tramite ciclo
do j = 1,n
   somma = somma + j**2
end do

!Calcolo la somma dei primi n quadrati tramite la formula
sommacalcolata= n*(n+1)*(2*n+1)/6

!La seguente procedura sfrutta il fatto che la formula precedente restituisce
!sempre un numero intero, quindi almeno uno dei fattori al numeratore sia divisibile
!per 2 e almeno uno sia divisibile per 3. Prima di moltiplicare, quindi, si può
!dividere per 2 e per 3 rispettivamente, tra n, n+1 e 2n+1, quelli che siano
!divisibili per uno di questi numeri. In questo modo si evita un risultato 
!intermedio troppo grande e la formula risulta efficace anche per numeri grandi,
!come il ciclo.
if(2*(n/2)==n)then !se n è divisibile per 2 dividilo per 2
	i=n/2
	j=n+1
else !altrimenti dividi n+1 per 2 (2n+1 è sempre dispari)
	i=n
	j=(n+1)/2
end if

if (3*(n/3)==n) then !se n è divisibile per 3
	i=i/3
	k=2*n+1	
else if (n-3*(n/3)==2) then !se n+1 è divisibile per 3 (n/3 ha resto 2)
	j=j/3
	k=2*n+1
else
	k=(2*n+1)/3
end if

sommameglio=i*j*k

print*, somma, sommacalcolata, sommameglio
!somma e sommameglio danno valori corretti per n<1861. sommacalcolata funziona solo
!per n<1024.
end program