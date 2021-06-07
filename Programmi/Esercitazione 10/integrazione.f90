module tipi
	implicit none
	integer,parameter	:: rk=selected_real_kind(16)
end module



module integrazione
 use tipi
 implicit none
 contains
 
  function integrale_trap(f, a, b, N) result(res)
  	real(rk),intent(in)		:: a, b
  	real(rk)					:: h, res
  	integer,intent(in)		:: N
  	integer					:: i
  	
  	interface
  		function f(x) result(risultato)
  			use tipi
  			real(rk),intent(in)	:: x
  			real(rk)				:: risultato
  		end function f
  	end interface
  	
  	h=(b-a)/N
  	
  	res=(f(a)+f(b))/2
  	
  	do i=1,N-1
  		res=res + f(a + i*h)
  	end do
  	
  	res= res*h
  end function
 
  subroutine integrale_simp(f, a, b, N, res)
  	real(rk),intent(in)	:: a, b
  	real(rk),intent(out)	:: res
  	real(rk)					:: h
  	integer,intent(in)		:: N
  	integer					:: i
  	interface
  		function f(x) result(risultato)
  			use tipi
  			real(rk),intent(in)	:: x
  			real(rk)				:: risultato
  		end function f
  	end interface
  	if(modulo(N,2)==0) then
  	h=(b-a)/N
  	
  	res=f(a)+f(b)
  	
  	do i=1,N-1
  		res = res + 2*(1+modulo(i,2))*f(a+i*h)
  	end do
  	
  	res=res*h/3
  	
  	else
  		print*, "Con N dispari non si puo' usare Cavalieri-Simpson!"
  	end if
  end subroutine
  	
end module integrazione
