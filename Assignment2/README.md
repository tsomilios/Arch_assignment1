# Αρχιτεκτονική Υπολογιστών  
## Ομάδα 19
### Τσομλεκτσόγλου Βασίλης 8259
### Κουργιαντάκης Γιώργος 8592
### Asssignment 2
_____________________________________________________________________________________________________
## Βήμα 1
### Ερώτημα 1

#### Από το αρχείο _config.json_ των benchmarks έχω 

* Chace line: 
  
  		Cache line size = 64

* L1:
  
  		Dcache: size = 65536 ~= 64Kb  Assoc = 2
  
  		Icache: size=32768  ~=32Kb  Assoc = 2

* L2:

		Size=2097152 ~=2Mb  Assoc=8

### Ερώτημα 2

### Από τα αρχεία _stats.txt_ των εκάστοτε benchmark έχω

* Bzip
  * Χρόνος εκτέλεσης :
  
        sim_seconds                                  0.160359
  
  * Cpi:
  
        system.cpu.cpi                               1.603595  
  
  * Overall miss rate
	
    * Dcache: 
    
              system.cpu.dcache.overall_miss_rate::.cpu.data__________0.014123                       
              system.cpu.dcache.overall_miss_rate::total______________0.014123  

    * Icache: 
    
              system.cpu.icache.overall_miss_rate::.cpu.inst__________0.000075  
              system.cpu.icache.overall_miss_rate::total______________0.000075

    * L2: 
    
              system.l2.overall_miss_rate::.cpu.inst_______________________0.868047                       
              system.l2.overall_miss_rate::.cpu.data_______________________0.294587                       
              system.l2.overall_miss_rate::total___________________________0.295235

* Mcf
  * Χρόνος εκτέλεσης :
  
        sim_seconds                                  0.123265
  
  * Cpi:
  
        system.cpu.cpi                               1.232645 
  
  * Overall miss rate
	
    * Dcache: 
    
              system.cpu.dcache.overall_miss_rate::.cpu.data__________0.002062                       
              system.cpu.dcache.overall_miss_rate::total______________0.002062  

    * Icache: 
    
              system.cpu.icache.overall_miss_rate::.cpu.inst__________0.019046  
              system.cpu.icache.overall_miss_rate::total______________0.019046

    * L2: 
    
              system.l2.overall_miss_rate::.cpu.inst_______________________0.000977                       
              system.l2.overall_miss_rate::.cpu.data_______________________0.728121                       
              system.l2.overall_miss_rate::total___________________________0.067668

* Hmmer
  * Χρόνος εκτέλεσης :
  
        sim_seconds                                  0.140134
  
  * Cpi:
  
        system.cpu.cpi                               1.401339 
  
  * Overall miss rate
	
    * Dcache: 
    
              system.cpu.dcache.overall_miss_rate::.cpu.data__________0.006197                       
              system.cpu.dcache.overall_miss_rate::total______________0.006197  

    * Icache: 
    
              system.cpu.icache.overall_miss_rate::.cpu.inst__________0.000170 
              system.cpu.icache.overall_miss_rate::total______________0.000170

    * L2: 
    
              system.l2.overall_miss_rate::.cpu.inst_______________________0.447188                       
              system.l2.overall_miss_rate::.cpu.data_______________________0.025700                       
              system.l2.overall_miss_rate::total___________________________0.031973

* Jeng
  * Χρόνος εκτέλεσης :
  
        sim_seconds                                  0.705640
  
  * Cpi:
  
        system.cpu.cpi                               7.056395 
  
  * Overall miss rate
	
    * Dcache: 
    
              system.cpu.dcache.overall_miss_rate::.cpu.data__________0.121831                       
              system.cpu.dcache.overall_miss_rate::total______________0.121831  

    * Icache: 
    
              system.cpu.icache.overall_miss_rate::.cpu.inst__________0.000020  
              system.cpu.icache.overall_miss_rate::total______________0.000020

    * L2: 
    
              system.l2.overall_miss_rate::.cpu.inst_______________________0.918877                       
              system.l2.overall_miss_rate::.cpu.data_______________________0.999988                       
              system.l2.overall_miss_rate::total___________________________0.999978
              
* Libm
  * Χρόνος εκτέλεσης :
  
        sim_seconds                                  0.262262
  
  * Cpi:
  
        system.cpu.cpi                               2.622616 
  
  * Overall miss rate
	
    * Dcache: 
    
              system.cpu.dcache.overall_miss_rate::.cpu.data__________0.060972                      
              system.cpu.dcache.overall_miss_rate::total______________0.060972  

    * Icache: 
    
              system.cpu.icache.overall_miss_rate::.cpu.inst__________0.000095 
              system.cpu.icache.overall_miss_rate::total______________0.000095

    * L2: 
    
              system.l2.overall_miss_rate::.cpu.inst_______________________0.867826                       
              system.l2.overall_miss_rate::.cpu.data_______________________0.999991                       
              system.l2.overall_miss_rate::total___________________________0.999940

#### Γραφήματα

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/All.png)

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/All1.png)

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/All2.png)

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/All3.png)

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/All4.png)

### Ερώτημα 3

### Τρέχοντας ξανά όλα τα benchmark με --cpu-clock=2GHz έχω από τα αρχεία stats.txt και config.json :

* 1GHz
  
  * "cpu_clk_domain": "clock": [ 1000 ]
  
  * "clk_domain": "clock": [ 1000 ]
  
  * system.clk_domain.clock                      1000                       
  
  * system.cpu_clk_domain.clock                      1000  

* 2GHz
  
  * "cpu_clk_domain": "clock": [ 500 ]
  
  * "clk_domain": "clock": [ 1000 ]
  
  * system.clk_domain.clock                      1000                       
  
  * system.cpu_clk_domain.clock                      500  

### Για τους χρόνους εκτέλεσης _(i=1Ghz , ii=2Ghz)_ έχω :

* Bzip
  
  1) sim_seconds                                  0.160359
  
  2) sim_seconds                                  0.083654
	
    i/ii = 0.160359/0.083654=1.91693164702


* hmmer 
	
  1) sim_seconds                                  0.140134
	
  2) sim_seconds                                  0.070205
	
   i/ii =0.140134/0.070205=1.99606865608

* Libm
	
  1) sim_seconds                                  0.262262
	
  2) sim_seconds                                  0.174763
	
    i/ii =0.262262/0.174763=1.50067233911


* mcf
	
  1) sim_seconds                                  0.123265
	
  2) sim_seconds                                  0.062553
	
    i/ii =0.123265/0.062553=1.97056895752
       

* jeng 
	
  1) sim_seconds                                  0.705640
	
  2) sim_seconds                                  0.513823
	
    i/ii =0.705640/0.513823=1.37331337834

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/ss1vs2.png)

* Παρατηρούμε ότι σε 3/5 benchmark διπλασιάζοντας την συχνότητα του επεξεργαστή υποδιπλασιάζου τον χρόνο εκτέλεσης στο περίπου (οπός φαίνεται και από τις διαιρέσεις) . Αυτό συμβαίνει επειδή στον χρόνο εκτέλεσης δεν παίζει ρολό μόνο ο επεξεργαστής αλλά και οι ταχύτητες των μνήμων τα οποία παραμένουν ιδιά για κάθε benchmark.

* Για να προσθέσουμε έναν ακόμα επεξεργαστή θα πρέπει να έχει ακριβός τα ιδία χαρακτηριστικά με τον ήδη υπάρχων επεξεργαστή για να δούμε ενδεχομένως βελτίωση στους χρόνους. Το οποίο δεν συμβαίνει πάντα. Υπάρχει επιπλέον καθυστέρηση εάν οι επεξεργαστές πρέπει να επικοινωνούν μεταξύ τους.

* Για παράδειγμα: ας υποθέσουμε ότι το 70% ενός προγράμματος μπορεί να επιταχυνθεί εάν παραλληλιστεί και να εκτελεστεί σε πολλές CPU αντί για μία. Εάν το α είναι το κλάσμα ενός υπολογισμού που είναι διαδοχικός και a-1 είναι το κλάσμα που μπορεί να παραλληλιστεί, η μέγιστη επιτάχυνση που μπορεί να επιτευχθεί χρησιμοποιώντας P επεξεργαστές δίνεται σύμφωνα με τον Νόμο του Amdahl: 1/(a+((1-a)/P))

	Για P=4 εχω : 1/(0,3+((1-0,3)/4)) = 2,105

	Για P=8 εχω : 1/(0,3+((1-0,3)/8)) = 2,581

	Ο διπλασιασμός της ισχύος επεξεργασίας έχει επιταχύνει τη διαδικασία μόνο κατά το ένα πέμπτο.
	Επομένως, η προσθήκη περισσότερου υλικού δεν είναι απαραίτητα η βέλτιστη προσέγγιση.




## Βήμα 2

### Ερωτήμα 1

Τρέχοντας τα διαφορετικά benchmarksκ για διαφορετικές τιμές για τα l1 dcache,l1 icache,l2,l1dassoc,l1iassoc,l2assic. Και τρέχοντας το read_results.sh έχω τα παρακάτω δεδομένα 

* Bzip
 
| Benchmarks bzip | l1 dcache | l1 icache | l2 | l1 d assoc | l1 iassoc | l2 assoc | cacheline | system.cpu.cpi | dcache.overall_miss_rate | icache.overall_miss_rate | l2.overall_miss_rate |
|-|:-:|:-:|:-:|:-:|:-:|:-:|:-:|-|-|-|-|
| 1 | 32 | 64 | 512 | 1 | 1 | 2 | 64 | 1.70818 | 0.020094 | 0.000072 | 0.290883 |
| 2 | 32 | 64 | 512 | 2 | 2 | 4 | 64 | 1.683344 | 0.017824 | 0.000068 | 0.320352 |
| 3 | 32 | 64 | 1024 | 1 | 1 | 2 | 64 | 1.684874 | 0.020098 | 0.000072 | 0.244426 |
| 4 | 32 | 64 | 1024 | 2 | 2 | 4 | 64 | 1.65522 | 0.017828 | 0.000068 | 0.262757 |
| 5 | 32 | 128 | 512 | 1 | 1 | 2 | 64 | 1.708117 | 0.020094 | 0.000068 | 0.290884 |
| 6 | 32 | 128 | 512 | 2 | 2 | 4 | 64 | 1.683461 | 0.017824 | 0.000066 | 0.320353 |
| 7 | 32 | 128 | 1024 | 1 | 1 | 2 | 64 | 1.684874 | 0.020097 | 0.000068 | 0.244429 |
| 8 | 32 | 128 | 1024 | 2 | 2 | 4 | 64 | 1.65522 | 0.017828 | 0.000066 | 0.26276 |
| 9 | 64 | 64 | 512 | 1 | 1 | 2 | 64 | 1.669159 | 0.016066 | 0.000072 | 0.367441 |
| 10 | 64 | 64 | 512 | 2 | 2 | 4 | 64 | 1.648959 | 0.014115 | 0.000068 | 0.410497 |
| 11 | 64 | 64 | 1024 | 1 | 1 | 2 | 64 | 1.646273 | 0.016069 | 0.000072 | 0.308833 |
| 12 | 64 | 64 | 1024 | 2 | 2 | 4 | 64 | 1.620858 | 0.014121 | 0.000068 | 0.336714 |
| 13 | 64 | 128 | 512 | 1 | 1 | 2 | 64 | 1.669159 | 0.016066 | 0.000068 | 0.367449 |
| 14 | 64 | 128 | 512 | 2 | 2 | 4 | 64 | 1.649105 | 0.014117 | 0.000066 | 0.410503 |
| 15 | 64 | 128 | 1024 | 1 | 1 | 2 | 64 | 1.646196 | 0.016068 | 0.000068 | 0.308836 |
| 16 | 64 | 128 | 1024 | 2 | 2 | 4 | 64 | 1.620908 | 0.01412 | 0.000066 | 0.336718 |

Κρίνοντας από της 4 μικρότερες τιμές cpi βλέπω ότι επιτυγχάνονται για l1d = 64Kb και l2 = 1024 Kb σταθερά . ενώ η αλλαγή στην l1i δεν μας προσφέρει μεγάλες αλλαγές. Ενώ υποδιπλασιάζοντας την assoc έχουμε αισθητά χειρότερο χρόνο 

* Mcf

| Benchmarks mcf | l1 dcache | l1 icache | l2 | l1 d assoc | l1 iassoc | l2 assoc | cacheline | system.cpu.cpi | dcache.overall_miss_rate | icache.overall_miss_rate | l2.overall_miss_rate |
|-|:-:|:-:|:-:|:-:|:-:|:-:|:-:|-|-|-|-|
| 1 | 32 | 64 | 512 | 1 | 1 | 2 | 64 | 1.132055 | 0.003446 | 0.000027 | 0.510308 |
| 2 | 32 | 64 | 512 | 2 | 2 | 4 | 64 | 1.126061 | 0.002445 | 0.000019 | 0.720399 |
| 3 | 32 | 64 | 1024 | 1 | 1 | 2 | 64 | 1.128928 | 0.003446 | 0.000027 | 0.475317 |
| 4 | 32 | 64 | 1024 | 2 | 2 | 4 | 64 | 1.12286 | 0.002445 | 0.000019 | 0.668257 |
| 5 | 32 | 128 | 512 | 1 | 1 | 2 | 64 | 1.131977 | 0.003446 | 0.000019 | 0.511616 |
| 6 | 32 | 128 | 512 | 2 | 2 | 4 | 64 | 1.126061 | 0.002445 | 0.000019 | 0.720443 |
| 7 | 32 | 128 | 1024 | 1 | 1 | 2 | 64 | 1.128795 | 0.003446 | 0.000019 | 0.476491 |
| 8 | 32 | 128 | 1024 | 2 | 2 | 4 | 64 | 1.12286 | 0.002445 | 0.000019 | 0.668268 |
| 9 | 64 | 64 | 512 | 1 | 1 | 2 | 64 | 1.128304 | 0.002773 | 0.000027 | 0.634168 |
| 10 | 64 | 64 | 512 | 2 | 2 | 4 | 64 | 1.123984 | 0.002063 | 0.000019 | 0.849799 |
| 11 | 64 | 64 | 1024 | 1 | 1 | 2 | 64 | 1.125085 | 0.002773 | 0.000027 | 0.589999 |
| 12 | 64 | 64 | 1024 | 2 | 2 | 4 | 64 | 1.120797 | 0.002063 | 0.000019 | 0.787784 |
| 13 | 64 | 128 | 512 | 1 | 1 | 2 | 64 | 1.128287 | 0.002773 | 0.000019 | 0.636139 |
| 14 | 64 | 128 | 512 | 2 | 2 | 4 | 64 | 1.12414 | 0.002063 | 0.000019 | 0.849862 |
| 15 | 64 | 128 | 1024 | 1 | 1 | 2 | 64 | 1.125025 | 0.002773 | 0.000019 | 0.59182 |
| 16 | 64 | 128 | 1024 | 2 | 2 | 4 | 64 | 1.120797 | 0.002063 | 0.000019 | 0.787805 |

Κρίνοντας από της 4 μικρότερες τιμές cpi βλέπω ότι επιτυγχάνονται για l1d = 64Kb και l2 = 1024 Kb σταθερά . ενώ η αλλαγή στην l1i δεν μας προσφέρει καμια  βελτιωση. Ενώ υποδιπλασιάζοντας την assoc έχουμε αισθητά χειρότερο χρόνο 

* Hmmer

| Benchmarks hmmer | l1 dcache | l1 icache | l2 | l1 d assoc | l1 iassoc | l2 assoc | cacheline | system.cpu.cpi | dcache.overall_miss_rate | icache.overall_miss_rate | l2.overall_miss_rate |
|-|:-:|:-:|:-:|:-:|:-:|:-:|:-:|-|-|-|-|
| 1 | 32 | 64 | 512 | 1 | 1 | 2 | 64 | 1.557888 | 0.019685 | 0.00036 | 0.007648 |
| 2 | 32 | 64 | 512 | 2 | 2 | 4 | 64 | 7.056426 | 0.121908 | 0.00002 | 0.998736 |
| 3 | 32 | 64 | 1024 | 1 | 1 | 2 | 64 | 1.557888 | 0.019685 | 0.00036 | 0.007648 |
| 4 | 32 | 64 | 1024 | 2 | 2 | 4 | 64 | 7.055995 | 0.121908 | 0.00002 | 0.998735 |
| 5 | 32 | 128 | 512 | 1 | 1 | 2 | 64 | 4.360949 | 0.019089 | 0.790186 | 0.000512 |
| 6 | 32 | 128 | 512 | 2 | 2 | 4 | 64 | 4.626317 | 0.008424 | 0.88691 | 0.000493 |
| 7 | 32 | 128 | 1024 | 1 | 1 | 2 | 64 | 4.360949 | 0.019089 | 0.790186 | 0.000512 |
| 8 | 32 | 128 | 1024 | 2 | 2 | 4 | 64 | 4.626317 | 0.008424 | 0.88691 | 0.000493 |
| 9 | 64 | 64 | 512 | 1 | 1 | 2 | 64 | 1.444462 | 0.009827 | 0.00036 | 0.017002 |
| 10 | 64 | 64 | 512 | 2 | 2 | 4 | 64 | 7.055829 | 0.121858 | 0.00002 | 0.999545 |
| 11 | 64 | 64 | 1024 | 1 | 1 | 2 | 64 | 1.444462 | 0.009827 | 0.00036 | 0.017002 |
| 12 | 64 | 64 | 1024 | 2 | 2 | 4 | 64 | 7.05733 | 0.121858 | 0.00002 | 0.999544 |
| 13 | 64 | 128 | 512 | 1 | 1 | 2 | 64 | 4.278507 | 0.009406 | 0.789474 | 0.000534 |
| 14 | 64 | 128 | 512 | 2 | 2 | 4 | 64 | 4.625668 | 0.006173 | 0.886716 | 0.000496 |
| 15 | 64 | 128 | 1024 | 1 | 1 | 2 | 64 | 4.278507 | 0.009406 | 0.789474 | 0.000534 |
| 16 | 64 | 128 | 1024 | 2 | 2 | 4 | 64 | 4.625668 | 0.006173 | 0.886716 | 0.000496 |

Κρίνοντας από της 4 μικρότερες τιμές cpi βλέπω ότι επιτυγχάνονται για l1d = 64Kb και l1i = 64 Kb σταθερά . ενώ η αλλαγή στην l2 δεν μας προσφέρει καμια  βελτιωση. Ενώ διπλασιάζοντας την assoc και την l1i έχουμε κατά πολύ χειρότερο χρόνο 

* Libm

| Benchmarks libm | l1 dcache | l1 icache | l2 | l1 d assoc | l1 iassoc | l2 assoc | cacheline | system.cpu.cpi | dcache.overall_miss_rate | icache.overall_miss_rate | l2.overall_miss_rate |
|-|:-:|:-:|:-:|:-:|:-:|:-:|:-:|-|-|-|-|
| 1 | 32 | 64 | 512 | 1 | 1 | 2 | 64 | 2.650616 | 0.062151 | 0.000101 | 0.973305 |
| 2 | 32 | 64 | 512 | 2 | 2 | 4 | 64 | 2.624291 | 0.060972 | 0.000087 | 0.999976 |
| 3 | 32 | 64 | 1024 | 1 | 1 | 2 | 64 | 2.649994 | 0.062151 | 0.000101 | 0.973305 |
| 4 | 32 | 64 | 1024 | 2 | 2 | 4 | 64 | 2.623706 | 0.060972 | 0.000087 | 0.999976 |
| 5 | 32 | 128 | 512 | 1 | 1 | 2 | 64 | 2.650559 | 0.062151 | 0.000089 | 0.973349 |
| 6 | 32 | 128 | 512 | 2 | 2 | 4 | 64 | 2.624329 | 0.060972 | 0.000085 | 0.999983 |
| 7 | 32 | 128 | 1024 | 1 | 1 | 2 | 64 | 2.649994 | 0.062151 | 0.000089 | 0.973349 |
| 8 | 32 | 128 | 1024 | 2 | 2 | 4 | 64 | 2.62365 | 0.060972 | 0.000085 | 0.999983 |
| 9 | 64 | 64 | 512 | 1 | 1 | 2 | 64 | 2.640417 | 0.061561 | 0.000101 | 0.98644 |
| 10 | 64 | 64 | 512 | 2 | 2 | 4 | 64 | 2.624291 | 0.060972 | 0.000087 | 0.999976 |
| 11 | 64 | 64 | 1024 | 1 | 1 | 2 | 64 | 2.638806 | 0.061561 | 0.000101 | 0.98644 |
| 12 | 64 | 64 | 1024 | 2 | 2 | 4 | 64 | 2.623706 | 0.060972 | 0.000087 | 0.999976 |
| 13 | 64 | 128 | 512 | 1 | 1 | 2 | 64 | 2.640339 | 0.061561 | 0.000089 | 0.986485 |
| 14 | 64 | 128 | 512 | 2 | 2 | 4 | 64 | 2.624329 | 0.060972 | 0.000085 | 0.999983 |
| 15 | 64 | 128 | 1024 | 1 | 1 | 2 | 64 | 2.638806 | 0.061561 | 0.000089 | 0.986485 |
| 16 | 64 | 128 | 1024 | 2 | 2 | 4 | 64 | 2.62365 | 0.060972 | 0.000085 | 0.999983 |

Σε αυτό το benchmark βλέπουμε ότι ρολό παίζει μόνο το assoc. Με σταθερό assoc (l1d=2,l1i=2,l2=4) και πλήθος αλλαγών στα μεγέθη των μνήμων έχουμε σταθερούς χρόνους 

* Jebg

| Benchmarks jeng | l1 dcache | l1 icache | l2 | l1 d assoc | l1 iassoc | l2 assoc | cacheline | system.cpu.cpi | dcache.overall_miss_rate | icache.overall_miss_rate | l2.overall_miss_rate |
|-|:-:|:-:|:-:|:-:|:-:|:-:|:-:|-|-|-|-|
| 1 | 32 | 64 | 512 | 1 | 1 | 2 | 64 | 7.056426 | 0.121908 | 0.00002 | 0.998736 |
| 2 | 32 | 64 | 512 | 2 | 2 | 4 | 64 | 7.05553 | 0.121832 | 0.000019 | 0.999972 |
| 3 | 32 | 64 | 1024 | 1 | 1 | 2 | 64 | 7.055995 | 0.121908 | 0.00002 | 0.998735 |
| 4 | 32 | 64 | 1024 | 2 | 2 | 4 | 64 | 7.057096 | 0.121832 | 0.000019 | 0.999972 |
| 5 | 32 | 128 | 512 | 1 | 1 | 2 | 64 | 7.056396 | 0.121908 | 0.000019 | 0.998738 |
| 6 | 32 | 128 | 512 | 2 | 2 | 4 | 64 | 7.055561 | 0.121832 | 0.000019 | 0.999973 |
| 7 | 32 | 128 | 1024 | 1 | 1 | 2 | 64 | 7.055955 | 0.121908 | 0.000019 | 0.998738 |
| 8 | 32 | 128 | 1024 | 2 | 2 | 4 | 64 | 4.071698 | 0.082383 | 0.00022 | 0.99957 |
| 9 | 64 | 64 | 512 | 1 | 1 | 2 | 64 | 7.055829 | 0.121858 | 0.00002 | 0.999545 |
| 10 | 64 | 64 | 512 | 2 | 2 | 4 | 64 | 7.055529 | 0.121831 | 0.000019 | 0.999983 |
| 11 | 64 | 64 | 1024 | 1 | 1 | 2 | 64 | 7.05733 | 0.121858 | 0.00002 | 0.999544 |
| 12 | 64 | 64 | 1024 | 2 | 2 | 4 | 64 | 7.055141 | 0.121831 | 0.000019 | 0.999983 |
| 13 | 64 | 128 | 512 | 1 | 1 | 2 | 64 | 7.055805 | 0.121858 | 0.000019 | 0.999547 |
| 14 | 64 | 128 | 512 | 2 | 2 | 4 | 64 | 7.05551 | 0.121831 | 0.000019 | 0.999985 |
| 15 | 64 | 128 | 1024 | 1 | 1 | 2 | 64 | 7.055407 | 0.121858 | 0.000019 | 0.999547 |
| 16 | 64 | 128 | 1024 | 2 | 2 | 4 | 64 | 7.055096 | 0.121831 | 0.000019 | 0.999985 |

Σε αυτό το benchmark βλέπουμε ότι καλύτερο χρόνο πετυχαίνουμε μόνο με έναν συνδυασμό μεγέθους μνήμης και Assoc . Με την κάθε μικρή αλλαγή παρατηρούμε πολύ μεγάλη αύξηση στον χρόνο 

Με κάθε αλάγη των τιμών συνεπάγεται trade of. Εάν υπάρχουν δέκα μέρη στα οποία η πολιτική τοποθέτησης θα μπορούσε να αντιστοιχίσει μια θέση μνήμης, τότε για να ελέγξετε εάν αυτή η τοποθεσία βρίσκεται στην προσωρινή μνήμη, πρέπει να αναζητηθούν δέκα καταχωρίσεις προσωρινής μνήμης. Ο έλεγχος περισσότερων θέσεων απαιτεί περισσότερη ισχύ και μεγαλύτερο τσιπ και πιθανόν περισσότερο χρόνο. Από την άλλη, οι κρυφές μνήμες με περισσότερη συσχέτιση υποφέρουν λιγότερες απώλειες , έτσι ο CPU σπαταλά λιγότερο χρόνο ανάγνωσης από την αργή κύρια μνήμη. Η γενική οδηγία είναι ότι ο διπλασιασμός της συσχέτισης, από 1 σε 2 , ή από 2 σε 4 έχει περίπου την ίδια επίδραση στην αύξηση του ποσοστού hit rate  με τον διπλασιασμό του μεγέθους της προσωρινής μνήμης. Ωστόσο, η αύξηση της συνάφειας περισσότερο από τέσσερις δεν βελτιώνει τόσο το ποσοστό επιτυχίας.

### Ερωτήμα 2

* Bzip

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/bzip.png)

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/bzip1.png)

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/bzip2.png)

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/bzip3.png)

* Mcf

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/mcf.png)

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/mcf1.png)

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/mcf2.png)

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/mcf3.png)

* Hmmer

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/hmmer.png)

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/hmmer1.png)

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/hmmer2.png)

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/hmmer3.png)

* Lbm

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/libm.png)

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/libm1.png)

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/libm2.png)

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/libm3.png)

* Jebg

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/jeng.png)

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/jeng1.png)

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/jeng2.png)

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/jeng3.png)

## Βήμα 3

Για μια προσέγγισης της αρχικής της τιμής σκέφτηκα να παραλληλίσω την τιμή ενός hdd (0.04/Gb) με την τιμή της l2 και την τιμή ενός ssd (0,14/Gb) με την τιμή της l1 d cache και l1 I cache . Βρίσκω ότι η τιμή της l1cache είναι 3,5 φορές ακριβότερη από ότι αυτή της l2 ,κάτι που μου φάνηκε στην αρχή ορθό αλλά μετρά από ερευνά(googlαρισμα) βρήκα σε ένα [thread](https://www.quora.com/How-much-does-static-RAM-cost-per-MB-or-GB-When-did-PCs-use-static-RAM) που συζητούσαν για της μνήμες ότι :

>in terms of raw fabrication cost - SRAM is about 20X the cost per bit as DRAM for large memory sizes. However for smaller memories (Up to a few MB) SRAM is actually cheaper as the control logic to go around the memory core is much simpler. It is more complicated than that - as there is no real mass market for large sized sram chips. So if you want to buy the chips you are comparing the cost of a mass market product with huge production volumes to a niche product with relatively tiny production runs. This has a huge effect on end price” 

 . Στην δικιά μας περίπτωση μιλάμε για λίγα KB ανά μνήμη (το οποίο δεν την καθιστά πολύ ακριβή). Λαμβάνοντας υπόψιν τις διακυμάνσεις στην τιμή ανάλογα με την ποσότητα  [πχ.](https://www.digikey.com/en/products/detail/cypress-semiconductor-corp/CY62157GE30-45BVXI/12316366) και υποθέτοντας ότι μιλάμε για μαζική παραγωγή  . 

Επιλεγώ base price για την l1 cache 0,988€/Mb ή 0.000965€/Kb.

Και για την l2 base price (0,000965/3,5)€/Kb δηλαδή 0.00027€/Kb.

Έτσι το κόστος για κάθε μια περίπτωση είναι το εξής :

* Bzip : [(L1d+L1i)x0.000965 + L2x0.00027]  = 128 x 0.00095 + 1024 x 0.00027 € = 0.1216 + 0.2764  € = *0.398 €*

* Limb : [(L1d+L1i)x0.000965 + L2x0.00027]  = 160 x 0.00095 + 1024 x 0.00027 € = 0.152 + 0.2764 € = *0.4284 €*

* Hmmer : [(L1d+L1i)x0.000965 + L2x0.00027]  = 160 x 0.00095 + 512 x 0.00027 € = 0.152 + 0.13824 € = *0.29024 €*

* Mcf : [(L1d+L1i)x0.000965 + L2x0.00027]  = 128 x 0.00095 + 1024 x 0.00027 € = 0.1216 + 0.2764 € = *0.398 €*

* Jeng : [(L1d+L1i)x0.000965 + L2x0.00027]  = 160 x 0.00095 + 1024 x 0.00027 € = 0.152 + 0.2764 € = *0.4284 €*

![Διαγραμμα](https://github.com/tsomilios/Arch_assignment1/blob/readme/Assignment2/Diagrams/price.png)

Δεν υπολόγισα σαν παραμέτρους τα L1d Assoc ,L1i Assoc , L2 Assoc ,cache line size διότι σε όλα τα benchmark είχα τις μικρότερες τιμές cpi για 2 ,2 ,4 , 64 (fancy word goes here).

## Κριτική 















