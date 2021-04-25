program fattoriali
	integer(8) :: n, fattoriale, i
	fattoriale = 1
	
	print*, "Di che numero si vuol sapere il fattoriale?"
	read*, n
	
	do i=1,n
		fattoriale = fattoriale * i
	end do
	print*, fattoriale
end program