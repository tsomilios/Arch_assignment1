# Arch_assinfnment1

**Ερωτήματα πρώτου μέρους**

1. Από το αρχείο **/gem5/configs/example/arm/starter_se.py** βρίσκω ότι:
- ΤύποςCPU: AtomicSimpleCPU, MinorCPU, HPI (χρησιμοποιούμε  Minor)
- Μνήμη  L1, L2 cache 
- voltage domain = 3.3V
- clk_domain = 1GHz
- cpu. cluster.voltage_domain = 1.2V
- cpu.cluster.clk_domain = 4GHz
- mem_mode = timing
- mem-size default=2Gb
- membus = SystemXBar()
- num-cores default=1

2. α.Από το αρχείο που δημιουργήθηκε από την εντολή `./build/ARM/gem5.opt -d hello_new configs/example/arm/starter_se.py  --cpu=minor tests/test-progs/hello/bin/arm/linux/hello`
  Και ανοίγοντας το αρχείο **gem5/hello_new/config.ini** βρίσκω ότι :

- Line 65: type=MinorCPU
- Line 1652: voltage=3.3
- Line 44: clock=1000		(δηλαδή 1/1000ticks = 1/[10^(-9)] = 1GHz)  
- Line 1339: voltage=1.2
- Line 58: clock=250		(δηλαδή 1/250ticks = 4/[10^(-9)] = 4GHz)
- Line 20: mem_mode=timing
- Line 1610: type=CoherentXBar
- Line 113: numThreads=1

2. β.Από το ίδιο directory με το 2α αλλά από το αρχείο **gem5/hello_new/stats.txt** έχω:

- Line 14 5028 #number of instructions committed
- Line 77 5834 #total committed instructions

2. c.Από το ίδιο αρχείο έχω:

- Line 622: 7884 number of tag accesses
- Line 623: 7884 number of data accesses

3. Μερικά μοντέλα in-order CPUs που χρησιμοποιεί ο gem5 είναι τα εξής: 

- **AtomicSimpleCPU**: Αυτό το μοντέλο χρησιμοποιεί Atomic memory access δηλαδή εκπληρώνει ένα transaction σε ένα μόνο κάλεσμα συνάρτησης. Αυτός ο τύπος memory access μοντελοποιεί τις αλλαγές κατάστασης και υπολογίζει τον κατά προσέγγιση λανθάνοντα χρόνο γρήγορα, χωρίς καθυστερήσεις, πράγμα που το καθιστά κατάλληλο για loosely timed προσομοιώσεις (fast-forwarding) ή cache warming. Έτσι, ο AtomicSimpleCPU εκτελεί όλες τις λειτουργίες για μια εντολή σε κάθε CPU tick() και μπορεί να πάρει μια γενική εκτίμηση του συνολικού χρόνου προσπέλασης στην cache υπολογίζοντας το latency από τις atomic προσπελάσεις.

- **TimingSimpleCPU**: Αυτό το μοντέλο χρησιμοποιεί Timing memory access. Αυτό σημαίνει ότι περιμένει μέχρι να επιστρέψει η προσπέλαση στη μνήμη πριν συνεχίσει. Παρόλα αυτά το TimingSimpleCPU είναι επίσης ένα fast-to-run μοντέλο, δεδομένου ότι απλοποιεί ορισμένες πτυχές όπως το pipelining, πράγμα που σημαίνει ότι μόνο μία εντολή επεξεργάζεται κάθε στιγμή. Κάθε αριθμητική εντολή εκτελείται από το TimingSimpleCPU σε έναν μόνο κύκλο, ενώ οι προσπελάσεις στη μνήμη απαιτούν πολλαπλούς κύκλους.

- **MinorCPU**: Το μοντέλο αυτό αποτελεί ένα ευέλικτο μοντέλο in-order CPU που αναπτύχθηκε αρχικά για να υποστηρίζει το Arm ISA, ενώ υποστηρίζει και άλλα ISAs. Το MinorCPU έχει fixed four-stage in-order execution pipeline, ενώ διαθέτει ρυθμιζόμενες δομές δεδομένων και συμπεριφορά εκτέλεσης. Επομένως μπορεί να ρυθμιστεί σε επίπεδο μικρό-αρχιτεκτονικής για να μοντελοποιήσει συγκεκριμένο επεξεργαστή. Το four-stage pipeline περιλαμβάνει fetching lines, decomposition into macro-ops, decomposition of macro-ops into micro-ops και execute.

- **High-Performance In-order (HPI) CPU**: Το μοντέλο αυτό είναι βασισμένο στην αρχιτεκτονική Arm και το ονομάζουμε HPI. To HPI CPU timing model ρυθμίζεται για να αντιπροσωπεύει μια μοντέρνα in-order Armv8-A εφαρμογή. Το pipeline του HPI CPU χρησιμοποιεί το ίδιο four-stage μοντέλο όπως ο MinorCPU που αναφέραμε προηγουμένως.

3. α.Εκτελώντας το πρόγραμμα **gem5/myprogam/myprog_arm** (το οποίο βρίσκει από 3 αριθμούς τον μεγαλύτερο) με την εντολή 

    Για MinorCPU

    `./build/ARM/gem5.opt -d c_prog_minor configs/example/se.py --cpu=MinorCPU –-caches -c /myprogram/myprog_arm`  παίρνω από **/gem5/c_prog_minor/stats.txt**

    Για TimingSimpleCPU

    `./build/ARM/gem5.opt -d c_prog_time configs/example/se.py --cpu=TimingSimpleCPU -–caches -c /myprogram/myprog_arm`  παίρνω από **/gem5/c_prog_time/stats.txt**

- MinorCPU
  
  Line 12:	sim_seconds	0.000033	# Number of seconds simulated
  
- TimingSimpleCPU
  
  Line 12:	sim_seconds	0.000042	# Number of seconds simulated
  
  ![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Untitled%20Diagram-Minor%20vs%20Timing.png)
  
3. β.Ο χρόνος στην περίπτωση του TimingSimpleCPU είναι μεγαλύτερος από την περίπτωση του MinorCPU. Αυτό συμβαίνει διότι στην περίπτωση του TimingSimpleCPU περιμένει την προσπέλαση μνήμης να τελειώσει πριν συνεχίσει ενώ δεν υποστηρίζει pipeline. Από την άλλη, το MinorCPU έχει pipeline τεσσάρων σταδίων. Επίσης, παρατηρούμε ότι οι κύκλοι που προσομοιώθηκαν στην περίπτωση του MinorCPU είναι 113218 ενώ στον TimingSimpleCPU είναι 165590. Αυτό συμβαίνει γιατί όπως αναφέραμε στην περίπτωση του Timing memory access απαιτούνται πολλαπλοί κύκλοι.

3. γ.1.Αλλάζοντας πρώτα την συχνότητα του επεξεργαστή από τα 1Ghz στα 500Mhz 

    Για MinorCPU με την εντολή 
    
    `./build/ARM/gem5.opt -d c_prog_minor_clock50 configs/example/se.py --cpu=MinorCPU *–-sys-clock500000000*  –-caches -c /myprogram/myprog_arm` παίρνω από **/gem5/c_prog_minor_clock50/stats.txt**

    Για TimingSimpleCPU με την εντολή

    `./build/ARM/gem5.opt -d c_prog_time_clock50 configs/example/se.py --cpu= TimingSimpleCPU CPU *–-sys-clock500000000*  –-caches -c /myprogram/myprog_arm`  παίρνω από **/gem5/c_prog_time_clock50/stats.txt**

- MinorCPU
  
  Line 12:	sim_seconds	0.000039	# Number of seconds simulated
  
- TimingSimpleCPU
  
  Line 12:	sim_seconds	0.000048	# Number of seconds simulated
  
  ![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Untitled%20Diagram-minor%20vs%20timing%20cpu.png)
  
  Όπως βλέπουμε οι χρόνοι εκτέλεσης αυξήθηκαν πράγμα λογικό αφού μειώσαμε τη συχνότητα από 1GHz που ήταν προηγουμένως.
  
3. γ.2Τώρα αλλάζοντας την τεχνολογία μνήμης σε DDR3_2133_8x8

    Για MinorCPU με την εντολή 

    `./build/ARM/gem5.opt -d c_prog_minor_ram configs/example/se.py --cpu=MinorCPU *–-mem-type=DDR3_2133_8x8*  -–caches -c /myprogram/myprog_arm`  παίρνω από **/gem5/c_prog_minor_ram/stats.txt**
    
    Για TimingSimpleCPU με την εντολή

    `./build/ARM/gem5.opt -d c_prog_time_ram configs/example/se.py --cpu= TimingSimpleCPU CPU *-–mem-type=DDR3_2133_8x8*  -–caches -c /myprogram/myprog_arm`  παίρνω από **/gem5/c_prog_time_ram/stats.txt**

- MinorCPU
  
  Line 12:	sim_seconds	0.000032	# Number of seconds simulated
  
- TimingSimpleCPU
  
  Line 12:	sim_seconds	0.000041	# Number of seconds simulated
  
  ![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Untitled%20Diagram-Minor%20vs%20Timing%20ram.png)
  
  Παρατηρούμε ότι μειώθηκαν οι χρόνοι εκτέλεσης από την αρχική μας περίπτωση. Αυτό είναι λογικό αφού αρχικά είχαμε DDR3_1600_8x8 : (1.6 x 8 x 8 / 8 = 12.8 GBps) και τώρα DDR3_2133_8x8 : (2.133 x 8 x 8 / 8 = 17.0 GBps).

