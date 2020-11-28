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
Πρώτα θα πραγματοποιήσουμε προσομοίωση χαμηλώνοντας τη συχνότητα απο τα *1GHz*, σε καινούργια με τιμή *500MHz* και τα αποτελέσματα αυτής που προκύπτουν απο τα αρχεία [c_prog_minor_clock50/stats.txt](https://github.com/tsomilios/Arch_assignment1/blob/readme/c_prog_minor_clock50/stats.txt) και [c_prog_time_clock50/stats.txt](https://github.com/tsomilios/Arch_assignment1/blob/readme/c_prog_time_clock50/stats.txt) αντίστοιχα δίνονται παρακάτω: 

- MinorCPU
  
  Line 12:	sim_seconds	0.000039	# Number of seconds simulated 
  
- TimingSimpleCPU
  
  Line 12:	sim_seconds	0.000048	# Number of seconds simulated
  
    ![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Untitled%20Diagram-minor%20vs%20timing%20cpu.png)
    
    
  Είναι ορατό πως οι χρόνοι αυξήθηκαν , πράγμα λογικό καθώς μειώσαμε την συχνότητα των επεξεργαστών.
  
_c2_)  
Τώρα θα πραγματοποιήσουμε προσομοίωση αλλάζοντας την τεχνολογία μνήμης από *DDR3_1600_8x8* σε *DDR3_2133_8x8* τα αποτελέσματα της οποίας προκύπτουν απο τα αρχεία [c_prog_minor_ram/stats.txt](https://github.com/tsomilios/Arch_assignment1/blob/readme/c_prog_minor_ram/stats.txt) και [c_prog_time_ram/stats.txt](https://github.com/tsomilios/Arch_assignment1/blob/readme/c_prog_time_ram/stats.txt) αντίστοιχα και δίνονται παρακάτω:

- MinorCPU
  
  Line 12:	sim_seconds	0.000032	# Number of seconds simulated
  
- TimingSimpleCPU
  
  Line 12:	sim_seconds	0.000041	# Number of seconds simulated
  
  ![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Untitled%20Diagram-Minor%20vs%20Timing%20ram.png)
  
  Παρατηρούμε πως οι χρόνοι εκτέλεσης μειώθηκαν σε σχέση με την αρχική περίπτωση, το οποίο περιμέναμε καθώς αρχικά είχαμε  DDR3_1600_8x8 : (1.6 x 8 x 8 / 8 = 12.8 GBps) και τώρα DDR3_2133_8x8 : (2.133 x 8 x 8 / 8 = 17.0 GBps) η οπόια ειναι ταχύτερη μνήμη.


### Το τελικό διάγραμμα από τις τιμές που παρατέθηκαν παραπάνω είναι το εξής :

    ![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Untitled%20Diagram-ALL.png)
    
    Όπως παρατηρούμε λιγότερο χρόνο εκτέλεσης έχει ο CPU minor και με τύπο μνήμης ddr3 2133 8x8


#### Κριτική Εργασίας
- Θετικά :
   - Ήταν ένα μικρό Project το οποίο μας προέτρεψε να ασχοληθούμε περισσότερο με το περιβάλλον linux και να πάρουμε hands on εμπειρία πάνω σε αυτό καθώς και το πρόγραμμα Gem5. Αναγκαστήκαμε να αφιερώσουμε χρόνο και αν συνηθίσουμε που ξέρουμε πως μελλοντικά θα μας προσφέρει την εμπειρία σε παρόμοια Project. Σαν αρχικό κομμάτι της εργασίας ήταν βατό και αυτό φαινόταν από την δυσκολία των ερωτημάτων η οποία δεν ήταν μεγάλη και κύριο σκοπό είχε την εξοικείωση μας με το περιβάλλον του gem5 καθώς και με τις δυνατότητες που προσφέρει.
   -Το αρχείο pdf το οποιο μας δόθηκε για να διεκπεραιωθεί η εργασία ήταν βοηθητικό για αυτούς που ήθελαν πραγματικά να παρακολουθήσουν το μάθημα. Προσέφερε σαφείς οδηγίες ως προς τον τρόπο εγκατάστασης και λειτουργίας του περιβάλλοντος αλλά παρ. όλα αυτά δεν ήταν υπερβολικά λεπτομερές αφήνοντας μας χώρο να σκεφτούμε και να λύσουμε τυχόν προβλήματα που προκύπταν. Ο τρόπος αυτός μας έδωσε αργότερα την αυτοπεποίθηση να προχωράμε με μεγαλύτερη σιγουριά στα επόμενα βήματα.
   - Η χρήση του github είναι πολύ σημαντική για την ολοκλήρωση πολλών μεγάλων Project τόσο στον εργασιακό και τον τομέα της αγοράς όσο και στον εκπαιδευτικό, οπότε η επιλογή να γίνεται εδώ η πληροφόρηση σας για το Project μας εξοικειώνει με τα σημερινά δεδομένα.
   
- Αρνητικά :
    - Η πρώτη επαφή με την εργασία μας μπέρδεψε αρκετά και το pdf τις πρώτες φορές που το διαβάσαμε είναι η αλήθεια δεν βοήθησε ιδιαίτερα. Διαβάζοντας γενικές πληροφορίες για τον gem5 επίσης δεν βοήθησε οπότε προσπαθούσαμε με την χρήση το pdf να βρούμε τα πατήματα μας.
    - Η εγκατάσταση του περιβάλλοντος των Ubuntu απευθείας σε δίσκο αποδείχθηκε χειρότερη επιλογή από ότι σε VM εντέλει καθώς μας έβγαζε διαρκώς ergo σε πολλά σημεία και δεν επέτρεπε να τρέξουμε τις εξομοιώσεις που απαιτούσε η εργασία. Επίσης εμφάνιζε πρόβλημα με την εντολή protobuf την οποία προσπαθήσαμε να εγκαταστήσουμε και από πολλά διαφορετικά μέρη. Μην βρίσκοντας λύση σε αυτό το πρόβλημα και οι 2 χρησιμοποιήσαμε VM στο οποίο και καταφέραμε να φέρουμε ει πέρας την εργασία.
    
- Τελικά :
   -Γενικά θεωρούμε πως η εργασία δεν ήταν υπερβολικά εύκολη αλλά ούτε και δύσκολη. Είχε καλό επίπεδο δυσκολίας ώστε να μας επιτρέψει να γνωρίσουμε καλυτέρα τα Line και gem5 και όταν ξεπεράστηκαν τα προβλήματα εγκατάστασης και προσομοιώσεων ήταν απλά θέμα αφιέρωσης χρόνου. Σίγουρα μας έδωσε την όρεξη να ασχοληθούμε περαιτέρω με την αρχιτεκτονική υπολογιστών..
   

###### Βιβλιογραφία :
- [gem5.org](https://www.gem5.org/ "gem5 Official Website")
- [Arm Research Starter Kit: System Modeling using gem5 by Ashkan Tousi and Chuan Zhu
July 2017 (updated October 2020)](https://raw.githubusercontent.com/arm-university/arm-gem5-rsk/master/gem5_rsk.pdf)
-[Diagramms](https://app.diagrams.net/)
-
