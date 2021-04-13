program secondo_grado
  
      implicit none ! l' istruzione precedente obbliga a definire esplicitamente il tipo di ogni variabile
  
      real    :: a,b,c            ! i coefficienti reali dell' equazione
                                  ! a x**2 + b x + c = 0

      real :: discr,xp,xm         ! discriminante e soluzioni corrispondenti
                                  ! alle due scelte del segno davanti la
                                  ! radice quadrata

      read*, a,b,c                ! i coefficienti vengono letti da tastiera

      
      discr = b**2 - 4*a*c
      
      if (a==0) then 			   !Se a=0, l'equazione non e' di secondo grado
      	  print*, "L'equazione data non e' di secondo grado"
      	  if (b==0) then		   !Se a=0 e b=0, non e' neanche un'equazione
      	  	  if (c==0) then	   !Se a=0,b=0,c=0, si ha l'identita' 0=0
      	  	  	  print*, "Qualsiasi x e' soluzione"
      	  	  else 				   !Se a=0,b=0,c!=0 si ha l'eq c=0, contraddittoria
      	  	  	  print*, "ERRORE: Non esistono soluzioni reali all'equazione data"
      	  	  end if
      	  else					   !Se a=0,b!=0 si ha un'equazione di primo grado con una sol.
      	  	  print*, -c/b
      	  end if
      else if (discr < 0) then	   !Se a!=0 e discr < 0 non esistono comunque sol.
      	  print*, "ERRORE: Non esistono soluzioni reali all'equazione data"
      else						   !Se a!=0 e discr >=0 si possono calcolare le due radici reali
      	  xp = ( -b + sqrt(discr) )/(2*a)
      	  xm = ( -b - sqrt(discr) )/(2*a)
      	  print*,xp,xm            ! le due radici vengono scritte sullo schermo come reali
      end if

end program secondo_grado
