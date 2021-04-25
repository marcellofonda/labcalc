program taylor
	integer(8) :: nmax, n, fattoriale
	real(16)	:: x, esp1, esp2, esp3, esp4,esp1a, esp2a, esp3a, esp4a
	print*,"Di che grado dev'essere il polinomio di Taylor?"
	read*, nmax
	fattoriale =1
	esp1 =0
	esp2 =0
	esp3 =0
	esp4 =0
	esp1a =0
	esp2a =0
	esp3a =0
	esp4a =0
	do n=0,nmax
	 if (n>0) fattoriale = fattoriale * n
	 !print*, fattoriale, esp1,esp2,esp3,esp4,
	 esp1 = esp1 + (-0.1)**n / fattoriale
	 esp2 = esp2 + (-1.)**n / fattoriale
	 esp3 = esp3 + (-10.)**n / fattoriale
	 esp4 = esp4 + (-100.)**n / fattoriale
	 
	 esp1a = esp1a + (0.1)**n / fattoriale
	 esp2a = esp2a + (1.)**n / fattoriale
	 esp3a = esp3a + (10.)**n / fattoriale
	 esp4a = esp4a + (100.)**n / fattoriale
	end do
	esp1a = 1/esp1a
	esp2a = 1/esp2a
	esp3a = 1/esp3a
	esp4a = 1/esp4a
	
	print*, "Stampo i valori di e^{-x} ottenuti in tre modi diversi per i 4 valori di x:"
	print*, "x.....Serie......Funzione EXP(-x)......1/serie"
	print*, 0.1,esp1,EXP(-0.1),esp1a
	print*, 1,esp2,EXP(-1.),esp2a
	print*, 10,esp3,EXP(-10.),esp3a
	print*, 100,esp4,EXP(-100.),esp4a
end program