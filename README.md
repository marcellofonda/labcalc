# README #

### A cosa serve questo repository? ###

* Ciao! In questo repository cerco di mettere tutti i programmi che vediamo a lezione e durante le esercitazioni. Dai pure un'occhiata in giro e non aver paura di cliccare da nessuna parte: solo io posso modificare direttamente i file, quindi non puoi far danni. (Per sapere come modificare veramente le cose, vedi sotto).
* Ultimo aggiornamento: 25/04/2021 (L'esercitazione 3 verrà aggiunta alla fine della settimana)

### Come navigo nel sito? ###

* Nella pagina iniziale, sopra il Readme, si vedono due cartelle e un file: `.github/ISSUE_TEMPLATE` (da ignorare), `Programmi` e `README.md`. Cliccare su uno di questi nomi per vederne il contenuto.
* A fianco ai nomi c'è una colonna con scritte strane: sono i riassunti dell'ultima commit che ha modificato quel file (per info leggere la _sezione Come funzionano GIT e GitHub?_). Ignoratela pure e non cliccateci se non per curiosità o se sapete cosa state facendo.
* `README.md` non è altro che questo file. A meno che non lo vogliate leggere meno leggibile, ignoratelo. La roba interessante sta nella cartella `Programmi`.
### Come posso contribuire? ###

* Se sapete come funziona GIT sapete come fare: clonate il repository, giocateci come vi pare e fate una pull request, altrimenti leggete avanti :)
* La gestione delle modifiche ai file di questo repository avviene attraverso il sistema GIT: per più informazioni, leggere la sezione sotto.
* Per fare qualsiasi modifica occorre un account GitHub. La creazione di un nuovo account è molto rapida e si fa cliccando in alto a destra su `Register`.
* Per modificare un file, navigare fino al file stesso, cliccarci sopra e cliccare sulla matita (a destra delle scritte `Raw` e `Blame`).
* Per aggiungere un file, 
* Una volta terminata la modifica o aggiunta che sia, scendere in fondo e compilare i due campi sopra il pulsante verde: dare un breve riassunto delle modifiche (poche parole) e una descrizione più dettagliata (errori corretti, funzionalità aggiunte, ecc.)
* Potete modificare più file in successione e fare più commit. Quando siete soddisfatti fate una _Pull request_: Continuate a premere sui bottoni grandi e verdi e compilate i campi con delle descrizioni di cosa avete fatto, più o meno pertinenti, cercate solo di non confondermi troppo.
* Se tutto è andato a buon fine dovrebbe essere comparsa una Pull request nella sezione omonima della barra orizzontale. A breve io darò un'occhiata e confermerò le modifiche. Grazie del contributo prezioso! :)
### Come funzionano GIT e GitHub? ###
* Il sistema GIT serve a tener traccia delle varie versioni di un progetto (repository). A questo scopo, una versione viene salvata come l'insieme delle differenze (diff) tra la versione stessa e la precedente.
* GitHub è un sito che permette di salvare e interagire con un repository GIT.
* Nel sistema GIT differenze tra una versione e la successiva vengono raggruppate in _commit_.
* Le commit sono ordinate (Tutte le commit tranne quella iniziale hanno una commit precedente)
* Tutte le commit precedenti all'ultima versione formano un ramo di sviluppo (branch). La particolarità di GIT è che si può modificare anche a partire da una commit che non sia l'ultima, perciò si possono avere più rami di sviluppo, ossia due versioni finali indipendenti. 
* In ogni momento si può scegliere da che ramo partire per effettuare modifiche. Il ramo principale si chiama `master`. Per scegliere il ramo dal sito GitHub c'è un menu a comparsa nella pagina principale: cliccate sulla scritta `master` in alto a sinistra. 
* Due rami possono essere uniti (merge): le modifiche vengono applicate tutte insieme e si ottiene una versione finale che unisce le caratteristiche delle cime dei due rami. In caso di conflitti tra le modifiche, è necessaria una procedura più articolata. In caso scrivetemi.
* Nota: un nuovo ramo può essere creato anche a partire dall'ultima commit: la divisione apparirà evidente dopo la prossima commit sul ramo di partenza.

### Chi sta dietro a tutto ciò? ###

* Sono Marcello Fonda, studente di Fisica. Per qualsiasi cosa scrivetemi alla mail universitaria o fermatemi in classe:
* marcello.fonda@studenti.units.it


