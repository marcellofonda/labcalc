 program harm
 implicit none

 real    :: massa=1.0! valori di default per massa e cost. elastica
 real    :: dt
 real,dimension(2)   :: pos,vel,vel_parziale,f,kappa=[1.0, 2.0],ekin,epot
 integer :: nstep,it
 write(unit=*,fmt="(a)",advance="no")"delta t : "   ! il formato (a) chiede che il dato sia trattato come 
 read*,dt                                           ! caratteri e advance="no"  sopprime l'  inserimento del 
 write(unit=*,fmt="(a)",advance="no")"n.step: "     ! caratter "a capo"  alla fine della linea per cui 
 read*,nstep                                        ! la prossima operazione di lettura/scrittura inziera'
 write(unit=*,fmt="(a)",advance="no")"massa: "      ! sula stessa riga di schermo di quella corrente
 read*,massa
 write(unit=*,fmt="(a)",advance="no")"kappa: "
 read*,kappa(1:2)
 write(unit=*,fmt="(a)",advance="no")"pos(0): "
 read*,pos(1:2)
 write(unit=*,fmt="(a)",advance="no")"vel(0): "
 read*,vel(1:2)

 it=0        ! step 0 : valori iniziali
 write(unit=1,fmt=*)it,it*dt,pos,vel
 epot =  0.5 * kappa * pos**2
 f    = - kappa * pos
 ekin =  0.5 * massa * vel**2
 write(unit=2,fmt=*)it,dt*it,sum(ekin),sum(epot),sum(ekin+epot)

 do it = 1,nstep
    pos = pos + vel * dt + 0.5* f/massa * dt**2
    vel_parziale = vel + 0.5 * dt * f/massa                !  prima parte della formula per le velocita'
    f    = - kappa * pos
    epot =  0.5 * kappa * pos**2
    vel = vel_parziale + 0.5 * dt * f/massa                !  la formula per le velocita' viene completata qui
    write(unit=1,fmt=*)it,it*dt,pos,vel
    ekin = 0.5 * massa * vel**2
    write(unit=2,fmt=*)it,it*dt,sum(ekin),sum(epot),sum(ekin+epot)
 end do
 end program harm
