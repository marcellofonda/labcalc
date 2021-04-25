program media
  implicit none
  real :: aver,x,varianza
  integer :: i,N                                                  

  print*," N= ?"
  read*,N
  print*," immetti i dati uno alla volta"

  if(N>=0)then
	aver=0.0
	varianza=0.0
	do i=1,N                                            
  	   read*,x
  	   aver = aver + x
  	   varianza = varianza + x**2
    end do
  	aver = aver/N
  	varianza = varianza/N - aver**2
  	print*," media di ",N," dati : ",aver
  	print*," varianza di ",N," dati : ",varianza
   else
   	   print*," Non posso avere un numero negativo di dati!"
   end if
end program media 