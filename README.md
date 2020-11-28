# Αρχιτεκτονική Υπολογιστών
### Ομάδα 19
#### Κουργιαντάκης Γεώργιος (8592) - Τσομλεκτσόγλου Βασίλειος (8259)


### Ερώτημα 1  
Οι βασικές παράμετροι που δίνονται απο το _starter_se.py_ αρχείο είναι οι εξής:
Τυπος __CPU__: 
* AtomicSimpleCPU,
* MinorCPU,
* hpi.  
Σύμφωνα με την εντολή , εμείς χρησιμοποιήσαμε το MinorCPU.

__Cache__:  
L1 L2 cache με fixed cache line size στα 64 bytes  
η L1 private και η L2 shared

Στα __χαρακτηριστικά__ του συστήματος του παραδείγματος δίνονται:  
* voltage_domain= 3.3 V
* clk_domain= 1GHz
* cpu.cluster.voltage_domain =1.2 V
* cpu.cluster.clk_domain = 4GHz
* num-cores default = 1
* membus = SystemXBar()
* Memory type = DDR3_1600_8x8
* mem-channels = 2
* mem-size default = 2Gb


### Ερώτημα 2  
_a_)  
Σύμφωνα με την αναζήτηση στο αρχείο [hello_new/config.ini](https://github.com/tsomilios/Arch_assignment1/blob/readme/hello_new/config.ini) μπορούμε να επιβεβαιώσουμε πως τα παρακάτω χαρακτηριστικά είναι τα :  

- Line 65: type=MinorCPU
- Line 1652: system voltage=3.3
- Line 44: clock=1000 (δηλαδή 1/1000ticks = 1/[10^(-9)] = 1GHz)
- Line 1339: cluster voltage=1.2
- Line 58: clock=250		(δηλαδή 1/250ticks = 4/[10^(-9)] = 4GHz)
- Line 20: mem_mode=timing
- Line 1610: type=CoherentXBar
- Line 113: numThreads=1 

_b_)  
Σύμφωνα με την αναζήτηση στο αρχείο [hello_new/stats.txt](https://github.com/tsomilios/Arch_assignment1/blob/readme/hello_new/stats.txt) για τον αριθμό εντολών  παρατηρούμε πως:

- Line 14 5028 #number of instructions committed
- Line 77 5834 #total committed instructions

_c_)  
Από το ίδιο αρχείο για τους αριθμούς προσπελάσεων δίνεται:

- Line 622: 7884 number of tag accesses
- Line 623: 7884 number of data accesses

### Ερώτημα 3  
Μερικά μοντέλα in-order CPUs που χρησιμοποιεί ο gem5 είναι τα εξής: 

- **AtomicSimpleCPU**: Αυτό το μοντέλο χρησιμοποιεί Atomic memory access δηλαδή εκπληρώνει ένα transaction σε ένα μόνο κάλεσμα συνάρτησης. Αυτός ο τύπος memory access μοντελοποιεί τις αλλαγές κατάστασης και υπολογίζει τον κατά προσέγγιση λανθάνοντα χρόνο γρήγορα, χωρίς καθυστερήσεις, πράγμα που το καθιστά κατάλληλο για loosely timed προσομοιώσεις (fast-forwarding) ή cache warming. Έτσι, ο AtomicSimpleCPU εκτελεί όλες τις λειτουργίες για μια εντολή σε κάθε CPU tick() και μπορεί να πάρει μια γενική εκτίμηση του συνολικού χρόνου προσπέλασης στην cache υπολογίζοντας το latency από τις atomic προσπελάσεις.

- **TimingSimpleCPU**: Αυτό το μοντέλο χρησιμοποιεί Timing memory access. Αυτό σημαίνει ότι περιμένει μέχρι να επιστρέψει η προσπέλαση στη μνήμη πριν συνεχίσει. Παρόλα αυτά το TimingSimpleCPU είναι επίσης ένα fast-to-run μοντέλο, δεδομένου ότι απλοποιεί ορισμένες πτυχές όπως το pipelining, πράγμα που σημαίνει ότι μόνο μία εντολή επεξεργάζεται κάθε στιγμή. Κάθε αριθμητική εντολή εκτελείται από το TimingSimpleCPU σε έναν μόνο κύκλο, ενώ οι προσπελάσεις στη μνήμη απαιτούν πολλαπλούς κύκλους.

- **MinorCPU**: Το μοντέλο αυτό αποτελεί ένα ευέλικτο μοντέλο in-order CPU που αναπτύχθηκε αρχικά για να υποστηρίζει το Arm ISA, ενώ υποστηρίζει και άλλα ISAs. Το MinorCPU έχει fixed four-stage in-order execution pipeline, ενώ διαθέτει ρυθμιζόμενες δομές δεδομένων και συμπεριφορά εκτέλεσης. Επομένως μπορεί να ρυθμιστεί σε επίπεδο μικρό-αρχιτεκτονικής για να μοντελοποιήσει συγκεκριμένο επεξεργαστή. Το four-stage pipeline περιλαμβάνει fetching lines, decomposition into macro-ops, decomposition of macro-ops into micro-ops και execute.

- **High-Performance In-order (HPI) CPU**: Το μοντέλο αυτό είναι βασισμένο στην αρχιτεκτονική Arm και το ονομάζουμε HPI. To HPI CPU timing model ρυθμίζεται για να αντιπροσωπεύει μια μοντέρνα in-order Armv8-A εφαρμογή. Το pipeline του HPI CPU χρησιμοποιεί το ίδιο four-stage μοντέλο όπως ο MinorCPU που αναφέραμε προηγουμένως.

_a_)  
Εκτελώντας ένα απλό πρόγραμμα [gem5/myprogam/myprog_arm**](https://github.com/tsomilios/Arch_assignment1/blob/readme/myprogram/myprog.c) το οποίο βρίσκει από 3 αριθμούς τον μεγαλύτερο έχουμε τα παρακάτω αποτελέσματα:

- MinorCPU
  
  Line 12:	sim_seconds	0.000033	# Number of seconds simulated
  
- TimingSimpleCPU
  
  Line 12:	sim_seconds	0.000042	# Number of seconds simulated
  
    ![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Untitled%20Diagram-Minor%20vs%20Timing.png)
  
_b_)  
Στην περίπτωση του TimingSimpleCPU ο χρόνος είναι μεγαλύτερος από ότι στον MinorCPU καθώς 
στον TimingSimpleCPU, όπως είπαμε παραπάνω περιμένει το πέρας της προσπέλασης της μνήμης 
μέχρι να συνεχίσει και επιπλέον δεν διαθέτει pipeline. Ενώ ο MinorCpu από την άλλη έχει 
pipeline τεσσάρων σταδίων. Ένας ακόμα λόγος που ο MinorCPU έχει μικρότερο χρόνο είναι και ο
συνολικός αριθμός κύκλων των επεξεργαστών όπως φαίνεται παρακάτω.


* TimingSimpleCPU : 83836 # number of cpu cycles simulated
* MinorCPU        : 66868 # number of cpu cycles simulated

_c1_)  
Πρώτα θα πραγματοποιήσουμε προσομοίωση χαμηλώνοντας τη συχνότητα απο τα 1GHz, σε καινούργια με τιμή 500MHz και τα αποτελέσματα αυτής δίνονται παρακάτω: 

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

4. Το τελικό διάγραμμα από τις τιμές που παρατέθηκαν παραπάνω είναι το εξής :

    ![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Untitled%20Diagram-ALL.png)
    
    Όπως παρατηρούμε λιγότερο χρόνο εκτέλεσης έχει ο CPU minor και με τύπο μνήμης ddr3 2133 8x8

