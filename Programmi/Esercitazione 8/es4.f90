module gravitazione
implicit none
integer,parameter :: kr=selected_real_kind(15), nbody=2
real(kind=kr),parameter :: G=6.673E-11_kr  			! costante di gravitazione universale in unita' SI
real(kind=kr),dimension(nbody) :: mass=[1.989E30_kr, 5.90E24_kr]

contains
  subroutine interazione(pos,f,epot)
   real(kind=kr), intent(in), dimension(:,:) :: pos
   real(kind=kr), intent(out) :: epot
   real(kind=kr), intent(out), dimension(:,:) :: f
   real(kind=kr), dimension(size(pos,1)) :: posij
   real(kind=kr) :: rij
   integer ::i,j
   epot = 0
   f    = 0
   do i=1,nbody
      do j=1,nbody
         if( i==j ) cycle
         posij(:)  = pos(:,j)-pos(:,i)
         rij=sqrt( dot_product(posij,posij) )
         epot   = epot   -(G*mass(i)*mass(j))/rij
         f(:,i) = f(:,i) +(G*mass(i)*mass(j)) * posij(:)/rij**3
      end do
   end do
   epot = epot/2    									! divisione per 2 perche' tutti i contributi di
                    									! ciascuna coppia sono stati contati due volte: (i,j) e (j,i)                                                            

  end subroutine interazione
end module gravitazione


program kepler
use gravitazione, massa=>mass
implicit none

real(kind=kr),dimension(3,nbody)	:: pos,vel,f
 real(kind=kr)						:: dt,epot,ekin, afelio=152.1e9_kr, perielio=-147070880894.44318_kr, ellittico, ellittico1,ellittico2
 integer :: nstep,it
 logical :: perieliodaleggere=.true.
 
 dt=86400.
 nstep=4000
 
 pos(:,1)=[0._kr,0._kr,0._kr]
 pos(:,2)=[afelio,0._kr,0._kr]
 
 vel=0.												! supponiamo velocità inizialmente nulla per il Sole. Questo genererà                         
 vel(2,2)=29.29e3_kr									! dei moti curiosi per il Sole stesso. Curiosi ma corretti.

 it=0        										! step 0 : valori iniziali
 write(unit=1,fmt=*)it,it*dt,pos,vel
 call interazione(pos,f,epot)
 ekin = 0.5 * SUM(spread(massa,1,3) * vel**2)

 ellittico1=sqrt((pos(1,2)-pos(1,1))**2 + (pos(2,2)-pos(2,1))**2)
 ellittico2=sqrt((pos(1,2)-(afelio+perielio)-pos(1,1))**2+(pos(2,2)-pos(2,1))**2)
 ellittico=ellittico1+ellittico2
 
 write(unit=2,fmt=*)it,dt*it,ellittico,ellittico1,ellittico2,afelio-perielio,ekin,epot,ekin+epot

 do it = 1,nstep
    pos = pos + vel * dt + 0.5* f/spread(massa,1,3) * dt**2
    !pos(:,2) = pos(:,2) - pos(:,1)
    !pos(:,1)=[0._kr,0._kr,0._kr]
    vel = vel + 0.5 * dt * f/spread(massa,1,3)		!  prima parte della formula per le velocita'
    
    ellittico1=sqrt((pos(1,2)-pos(1,1))**2 + (pos(2,2)-pos(2,1))**2)
    ellittico2=sqrt((pos(1,2)-(afelio+perielio)-pos(1,1))**2+(pos(2,2)-pos(2,1))**2)
    ellittico=ellittico1+ellittico2
    !print*, ellittico
    call interazione(pos,f,epot)
    
    vel = vel + 0.5 * dt * f/spread(massa,1,3)		!  la formula per le velocita' viene completata qui
    
    write(unit=1,fmt=*)it,it*dt,pos(:,1)*0,pos(:,2)-pos(:,1),vel
    ekin = 0.5 * SUM(spread(massa,1,3) * vel**2)
    write(unit=2,fmt=*)it,it*dt,ellittico,ellittico1,ellittico2,afelio-perielio,ekin,epot,ekin+epot
    
    
    
    
    !if(pos(2,2)<=0 .and. perieliodaleggere) then		! queste righe sono servite a determinare la distanza
    	!	print*, pos(1,2)								! terra-sole al perielio.
    	!	perieliodaleggere=.false.
    !end if
 end do

end program