program esempio
implicit none
integer :: a,b,c,i,j

read*, a, b

! if then else, necessita di then e end if. Può eseguire più istruzioni.
if (a==0 .and. b==0) then 
    print*, '0/0 NON SI FA'
else if (b==0) then
    print*, 'NON SI DIVIDE PER ZERO !!!!'
else
    c = a / b
    print*, c
end if

! if logico, esegue una sola istruzione in modo condizionato. Sintassi più semplice.
if(a==5)print*,'a vale 5'

! Esegui con i che va da 1 a 10 ogni 2. Se non è specificato, l'incremento vale 1
do i = 1, 10, 2 
    print*,i,i**2 ! Stampa un numero e il suo quadrato
end do

!visualizzare il valore di i dopo il ciclo ci aiuta a capire come funziona il ciclo stesso.
print*, 'i dopo ciclo do ',i

do
    read*, a
    if(a<0) exit
    print*,a,a**3+c
end do

esterno: do i=1,4
interno:     do j=1,4
                !passo al valore successivo di i il caso in cui i==j
                !se non fosse specificato, cycle farebbe riferimento al ciclo interno
                if(i==j) cycle esterno
                print*,i,j
             end do interno
         end do esterno

print *, ' the end'

end program esempio