program esempio
implicit none
integer :: a,b,c,i

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

do
    read*, a
    if(a<0) exit
    print*,a,a**3+c
end do

print *, 'the end'

end program esempio