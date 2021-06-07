program harm
 implicit none

 real    :: lunghezza=10.0,g=10.0 ! valori di default per lunghezza e cost. elastica
 real    :: dt=0.001,ekin,epot
 real    :: pos,vel=0.,vel_parziale,f
 integer :: nstep=10000,it,o=0
 write(unit=*,fmt="(a)",advance="no")"delta t : "   ! il formato (a) chiede che il dato sia trattato come 
 !read*,dt                                           ! caratteri e advance="no"  sopprime l'  inserimento del 
 write(unit=*,fmt="(a)",advance="no")"n.step: "     ! caratter "a capo"  alla fine della linea per cui 
 !read*,nstep                                        ! la prossima operazione di lettura/scrittura inziera'
 write(unit=*,fmt="(a)",advance="no")"lunghezza: "      ! sula stessa riga di schermo di quella corrente
 !read*,lunghezza
 write(unit=*,fmt="(a)",advance="no")"g: "
 !read*,g
 write(unit=*,fmt="(a)",advance="no")"pos(0): "
 read*,pos
 write(unit=*,fmt="(a)",advance="no")"vel(0): "
 !read*,vel

 it=0        ! step 0 : valori iniziali
 write(unit=1,fmt=*)it,it*dt,pos,vel
 epot =  0.25 * g * pos**4
 f    = - g * pos**3
 ekin =  0.5 * lunghezza * vel**2
 write(unit=2,fmt=*)it,dt*it,ekin,epot,ekin+epot

 do it = 1,nstep
 	if (vel <= 0 .and. pos<0.1 .and. o<1) then
 		o=1
 		print*, it*dt
 	end if
    pos = pos + vel * dt + 0.5* f/lunghezza * dt**2
    vel_parziale = vel + 0.5 * dt * f/lunghezza                !  prima parte della formula per le velocita'
    f    = - g * pos**3
    epot =  0.25 * g * pos**4
    vel = vel_parziale + 0.5 * dt * f/lunghezza                !  la formula per le velocita' viene completata qui
    write(unit=1,fmt=*)it,it*dt,pos,vel
    ekin = 0.5 * lunghezza * vel**2
    write(unit=2,fmt=*)it,it*dt,ekin,epot,ekin+epot
 end do
 end program harm