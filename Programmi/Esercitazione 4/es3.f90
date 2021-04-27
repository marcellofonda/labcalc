program insomma
integer :: N, i, j
real :: somma1=0, somma2=0, ln, gamma=0.577215664901532860606512090082402431042159335939923598805767234884867726777664670937
                        
do j=1,100
	N=j*10000
	do i=1,N
		somma1 = somma1 + 1./i
		somma2 = somma2 + 1./(N-i+1)
	end do
	ln=log(real(N)) + gamma 	!La sommatoria ha lo stesso andamento asintotico dell'integrale
								!da 1 a N. La differenza tra le due tende a un valore costante gamma.
								!L'integrale vale il logaritmo naturale di N
	print*, "I due risultati sono, per N=", N
	print*,somma1, somma2
	print*, "e differiscono di", somma1-somma2
	print*, "L'approssimazione con il logaritmo da':", ln
	print*, "Quindi il piu' accurato dovrebbe essere dato dal"
	if(abs(somma1-ln)>abs(somma2-ln)) then
		print*, "secondo: ", somma2
	else
		print*, "primo: ", somma1	
	end if
	somma1=0.
	somma2=0.
end do
end program