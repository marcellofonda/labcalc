program vettori

integer,parameter	:: N=2
real,dimension(N)	:: a,b
real				:: scal1=0, modaa1=0, modbb1=0
real				:: scal2,modaa2,modbb2 
real				:: scal3, modaa3, modbb3
real				:: moduloa,modulob
integer				:: i
print*, "a? "
read*, a(1:N)
print*, "b? "
read*, b(1:N)

do i=1,N
	scal1=scal1+a(i)*b(i)
	modaa1=modaa1+a(i)**2
	modbb1=modbb1+b(i)**2
end do

scal2 = sum(a*b)
modaa2 = sum(a**2)
modbb2 = sum(b**2)

scal3 = dot_product(a,b)
modaa3 = dot_product(a,a)
modbb3 = dot_product(b,b)

print*, "Modulo^2 di a"
print*, modaa1, modaa2, modaa3
print*, "Modulo^2 di b"
print*, modbb1, modbb2, modbb3
print*, "Prodotto scalare"
print*, scal1,scal2,scal3

moduloa=sqrt(modaa3)
modulob=sqrt(modbb3)

print*, "Modulo di a e b"
print*, moduloa, modulob

print*, "Angolo"
print*, acos(scal3/(moduloa*modulob))

end program vettori