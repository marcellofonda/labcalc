module funzioni
implicit none
contains
function pesata(valori,pesi,N) result(res)
	integer,intent(in)				:: N
	real,dimension(N),intent(in)	:: valori,pesi
	real							:: res
	
	res = sum(valori*pesi)/sum(pesi)
end function
end module funzioni



program mediapesata
use funzioni

integer	:: N,i
real,dimension(:),allocatable	:: valori, pesi

print*, "Di quanti elementi vuoi calcolare la media pesata?"
read*, N
allocate(valori(N),pesi(N))

do i=1,N
	print*, "Inserisci l'elemento numero",i,"con il rispettivo peso:"
	read*, valori(i),pesi(i)
end do

print*, "La media pesata e':", pesata(valori,pesi,N)
end program mediapesata