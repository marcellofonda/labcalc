program esempio2

integer :: ia,ib,ic
real    :: rx,ry,rz

print*,' ia, rx ?' !oh yes
read*, ia, rx
ry = ia + rx ! per sommare un intero e un reale converte prima l'intero in reale
ib = ia + rx ! per salvare il risultato della somma, la parte 
print*, ry, ib
rz = ia/ib ! la divisione è tra interi, quindi il risultato è un intero, che poi viene convertito
print*,'rz ',rz


end program esempio2
