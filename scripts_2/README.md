# `scripts_2`

Answers the second question of the BBBQ: what is the mutation rate in the TMH 
parts of membrane proteins?

# Walkthrough

Run:

```
./download_myco_proteome
```

to obtain `mycobacterium.faa`:

```
richel@sonic:~/GitHubs/bbbq_article/scripts$ cat mycobacterium.faa | head -n 10  
>WP_128618872.1 NUDIX hydrolase [Mycobacterium lepraemurium]
MSVRDSVLALLTGWDPPDAAQDSLRHAVLAFVHAHPDACRRECEPGHVTASTLVLDHTGGRVLLTLHHRL
GRWVQLGGHCDDDDAGIVAAALREATEESGIDGLRMAPGLTAVHVHPVTCSLGLPTRHLDLQFVAHAPAG
ARIAISDESEDLRWWPVDALPTGTDHALTYLVAQATLA
>WP_120794232.1 Rossmann-like and DUF2520 domain-containing protein [Mycobacterium paragordonae]
MEQFDGLRPARLKVGIISAGRVGSALGVALERADHVVVACSAISQASLQRAQRRLPDTPVLSPPDVAAGA
ELLLLAVTDSELPGLVAGLAATSAVRPGTIVVHTSGANGIGILEPLTRQGCIPVAIHPAMTFTGSDEDIA
RLPDTCFGVTAADEVGYAIGQSLVLEMGGEPFFVREDARVLYHAALAHASNHLVTVLADALEALRAALTG
DELLGQQRVDNQPGGIAERIVGPLARAALENTLQRGQAALTGPVARGDAAAVAGHLSALGDADPELAHAY
RVNALRTAQRAHAPDDVVEVLVR
```

This is similar to how to obtain `mycobacterium_short.faa`:

```
richel@sonic:~/GitHubs/bbbq_article/scripts$ cat mycobacterium.faa | head -n 10 > mycobacterium_short.faa
```

Showing `mycobacterium_short.faa`:

```
richel@sonic:~/GitHubs/bbbq_article/scripts$ cat mycobacterium_short.faa 
>WP_128618872.1 NUDIX hydrolase [Mycobacterium lepraemurium]
MSVRDSVLALLTGWDPPDAAQDSLRHAVLAFVHAHPDACRRECEPGHVTASTLVLDHTGGRVLLTLHHRL
GRWVQLGGHCDDDDAGIVAAALREATEESGIDGLRMAPGLTAVHVHPVTCSLGLPTRHLDLQFVAHAPAG
ARIAISDESEDLRWWPVDALPTGTDHALTYLVAQATLA
>WP_120794232.1 Rossmann-like and DUF2520 domain-containing protein [Mycobacterium paragordonae]
MEQFDGLRPARLKVGIISAGRVGSALGVALERADHVVVACSAISQASLQRAQRRLPDTPVLSPPDVAAGA
ELLLLAVTDSELPGLVAGLAATSAVRPGTIVVHTSGANGIGILEPLTRQGCIPVAIHPAMTFTGSDEDIA
RLPDTCFGVTAADEVGYAIGQSLVLEMGGEPFFVREDARVLYHAALAHASNHLVTVLADALEALRAALTG
DELLGQQRVDNQPGGIAERIVGPLARAALENTLQRGQAALTGPVARGDAAAVAGHLSALGDADPELAHAY
RVNALRTAQRAHAPDDVVEVLVR
```

Counting the number of sequences:

```
richel@sonic:~/GitHubs/bbbq_article/scripts$ egrep -c ">" mycobacterium.faa
144963 [note: this number is an understatement, as this was done during downloading]
```

Make a database from 

```
richel@sonic:~/GitHubs/bbbq_article/scripts$ ./make_db_short 


Building a new DB, current time: 05/17/2019 11:47:55
New DB name:   /home/richel/GitHubs/bbbq_article/scripts/mycobacterium_short.faa
New DB title:  mycobacterium_short.faa
Sequence type: Protein
Deleted existing Protein BLAST database named /home/richel/GitHubs/bbbq_article/scripts/mycobacterium_short.faa
Keep MBits: T
Maximum file size: 1000000000B
Adding sequences from FASTA; added 2 sequences in 0.000574827 seconds.
```

Which files are created:

```
richel@sonic:~/GitHubs/bbbq_article/scripts$ ls mycobacterium_short.*
mycobacterium_short.faa      mycobacterium_short.faa.pin
mycobacterium_short.faa.phr  mycobacterium_short.faa.psq
```

All three files are in a binary/nonreadable format.

```
richel@sonic:~/GitHubs/bbbq/scripts_2$ ./blast_to_xml 
richel@sonic:~/GitHubs/bbbq/scripts_2$ cat short_vs_short.xml 
<?xml version="1.0"?>
<!DOCTYPE BlastOutput PUBLIC "-//NCBI//NCBI BlastOutput/EN" "http://www.ncbi.nlm.nih.gov/dtd/NCBI_BlastOutput.dtd">
<BlastOutput>
  <BlastOutput_program>blastp</BlastOutput_program>
  <BlastOutput_version>BLASTP 2.6.0+</BlastOutput_version>
  <BlastOutput_reference>Stephen F. Altschul, Thomas L. Madden, Alejandro A. Sch&amp;auml;ffer, Jinghui Zhang, Zheng Zhang, Webb Miller, and David J. Lipman (1997), &quot;Gapped BLAST and PSI-BLAST: a new generation of protein database search programs&quot;, Nucleic Acids Res. 25:3389-3402.</BlastOutput_reference>
  <BlastOutput_db>mycobacterium_short.faa</BlastOutput_db>
  <BlastOutput_query-ID>Query_1</BlastOutput_query-ID>
  <BlastOutput_query-def>WP_128618872.1 NUDIX hydrolase [Mycobacterium lepraemurium]</BlastOutput_query-def>
  <BlastOutput_query-len>178</BlastOutput_query-len>
  <BlastOutput_param>
    <Parameters>
      <Parameters_matrix>BLOSUM62</Parameters_matrix>
      <Parameters_expect>10</Parameters_expect>
      <Parameters_gap-open>11</Parameters_gap-open>
      <Parameters_gap-extend>1</Parameters_gap-extend>
      <Parameters_filter>F</Parameters_filter>
    </Parameters>
  </BlastOutput_param>
<BlastOutput_iterations>
<Iteration>
  <Iteration_iter-num>1</Iteration_iter-num>
  <Iteration_query-ID>Query_1</Iteration_query-ID>
  <Iteration_query-def>WP_128618872.1 NUDIX hydrolase [Mycobacterium lepraemurium]</Iteration_query-def>
  <Iteration_query-len>178</Iteration_query-len>
<Iteration_hits>
<Hit>
  <Hit_num>1</Hit_num>
  <Hit_id>gnl|BL_ORD_ID|0</Hit_id>
  <Hit_def>WP_128618872.1 NUDIX hydrolase [Mycobacterium lepraemurium]</Hit_def>
  <Hit_accession>0</Hit_accession>
  <Hit_len>178</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>350.517</Hsp_bit-score>
      <Hsp_score>898</Hsp_score>
      <Hsp_evalue>4.7077e-130</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>178</Hsp_query-to>
      <Hsp_hit-from>1</Hsp_hit-from>
      <Hsp_hit-to>178</Hsp_hit-to>
      <Hsp_query-frame>0</Hsp_query-frame>
      <Hsp_hit-frame>0</Hsp_hit-frame>
      <Hsp_identity>178</Hsp_identity>
      <Hsp_positive>178</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>178</Hsp_align-len>
      <Hsp_qseq>MSVRDSVLALLTGWDPPDAAQDSLRHAVLAFVHAHPDACRRECEPGHVTASTLVLDHTGGRVLLTLHHRLGRWVQLGGHCDDDDAGIVAAALREATEESGIDGLRMAPGLTAVHVHPVTCSLGLPTRHLDLQFVAHAPAGARIAISDESEDLRWWPVDALPTGTDHALTYLVAQATLA</Hsp_qseq>
      <Hsp_hseq>MSVRDSVLALLTGWDPPDAAQDSLRHAVLAFVHAHPDACRRECEPGHVTASTLVLDHTGGRVLLTLHHRLGRWVQLGGHCDDDDAGIVAAALREATEESGIDGLRMAPGLTAVHVHPVTCSLGLPTRHLDLQFVAHAPAGARIAISDESEDLRWWPVDALPTGTDHALTYLVAQATLA</Hsp_hseq>
      <Hsp_midline>MSVRDSVLALLTGWDPPDAAQDSLRHAVLAFVHAHPDACRRECEPGHVTASTLVLDHTGGRVLLTLHHRLGRWVQLGGHCDDDDAGIVAAALREATEESGIDGLRMAPGLTAVHVHPVTCSLGLPTRHLDLQFVAHAPAGARIAISDESEDLRWWPVDALPTGTDHALTYLVAQATLA</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
</Iteration_hits>
  <Iteration_stat>
    <Statistics>
      <Statistics_db-num>2</Statistics_db-num>
      <Statistics_db-len>481</Statistics_db-len>
      <Statistics_hsp-len>26</Statistics_hsp-len>
      <Statistics_eff-space>65208</Statistics_eff-space>
      <Statistics_kappa>0.041</Statistics_kappa>
      <Statistics_lambda>0.267</Statistics_lambda>
      <Statistics_entropy>0.14</Statistics_entropy>
    </Statistics>
  </Iteration_stat>
</Iteration>
<Iteration>
  <Iteration_iter-num>2</Iteration_iter-num>
  <Iteration_query-ID>Query_2</Iteration_query-ID>
  <Iteration_query-def>WP_120794232.1 Rossmann-like and DUF2520 domain-containing protein [Mycobacterium paragordonae]</Iteration_query-def>
  <Iteration_query-len>303</Iteration_query-len>
<Iteration_hits>
<Hit>
  <Hit_num>1</Hit_num>
  <Hit_id>gnl|BL_ORD_ID|1</Hit_id>
  <Hit_def>WP_120794232.1 Rossmann-like and DUF2520 domain-containing protein [Mycobacterium paragordonae]</Hit_def>
  <Hit_accession>1</Hit_accession>
  <Hit_len>303</Hit_len>
  <Hit_hsps>
    <Hsp>
      <Hsp_num>1</Hsp_num>
      <Hsp_bit-score>589.726</Hsp_bit-score>
      <Hsp_score>1519</Hsp_score>
      <Hsp_evalue>0</Hsp_evalue>
      <Hsp_query-from>1</Hsp_query-from>
      <Hsp_query-to>303</Hsp_query-to>
      <Hsp_hit-from>1</Hsp_hit-from>
      <Hsp_hit-to>303</Hsp_hit-to>
      <Hsp_query-frame>0</Hsp_query-frame>
      <Hsp_hit-frame>0</Hsp_hit-frame>
      <Hsp_identity>303</Hsp_identity>
      <Hsp_positive>303</Hsp_positive>
      <Hsp_gaps>0</Hsp_gaps>
      <Hsp_align-len>303</Hsp_align-len>
      <Hsp_qseq>MEQFDGLRPARLKVGIISAGRVGSALGVALERADHVVVACSAISQASLQRAQRRLPDTPVLSPPDVAAGAELLLLAVTDSELPGLVAGLAATSAVRPGTIVVHTSGANGIGILEPLTRQGCIPVAIHPAMTFTGSDEDIARLPDTCFGVTAADEVGYAIGQSLVLEMGGEPFFVREDARVLYHAALAHASNHLVTVLADALEALRAALTGDELLGQQRVDNQPGGIAERIVGPLARAALENTLQRGQAALTGPVARGDAAAVAGHLSALGDADPELAHAYRVNALRTAQRAHAPDDVVEVLVR</Hsp_qseq>
      <Hsp_hseq>MEQFDGLRPARLKVGIISAGRVGSALGVALERADHVVVACSAISQASLQRAQRRLPDTPVLSPPDVAAGAELLLLAVTDSELPGLVAGLAATSAVRPGTIVVHTSGANGIGILEPLTRQGCIPVAIHPAMTFTGSDEDIARLPDTCFGVTAADEVGYAIGQSLVLEMGGEPFFVREDARVLYHAALAHASNHLVTVLADALEALRAALTGDELLGQQRVDNQPGGIAERIVGPLARAALENTLQRGQAALTGPVARGDAAAVAGHLSALGDADPELAHAYRVNALRTAQRAHAPDDVVEVLVR</Hsp_hseq>
      <Hsp_midline>MEQFDGLRPARLKVGIISAGRVGSALGVALERADHVVVACSAISQASLQRAQRRLPDTPVLSPPDVAAGAELLLLAVTDSELPGLVAGLAATSAVRPGTIVVHTSGANGIGILEPLTRQGCIPVAIHPAMTFTGSDEDIARLPDTCFGVTAADEVGYAIGQSLVLEMGGEPFFVREDARVLYHAALAHASNHLVTVLADALEALRAALTGDELLGQQRVDNQPGGIAERIVGPLARAALENTLQRGQAALTGPVARGDAAAVAGHLSALGDADPELAHAYRVNALRTAQRAHAPDDVVEVLVR</Hsp_midline>
    </Hsp>
  </Hit_hsps>
</Hit>
</Iteration_hits>
  <Iteration_stat>
    <Statistics>
      <Statistics_db-num>2</Statistics_db-num>
      <Statistics_db-len>481</Statistics_db-len>
      <Statistics_hsp-len>30</Statistics_hsp-len>
      <Statistics_eff-space>114933</Statistics_eff-space>
      <Statistics_kappa>0.041</Statistics_kappa>
      <Statistics_lambda>0.267</Statistics_lambda>
      <Statistics_entropy>0.14</Statistics_entropy>
    </Statistics>
  </Iteration_stat>
</Iteration>
</BlastOutput_iterations>
</BlastOutput>
````

Now, we are going to use 


## Doc of Maxim Baranov

Alignment of downloade protein sequences 

First we installed Entrez tools and followed the advice from NCBI: 

```
# Moved to donwload_myco_proteome
esearch -db assembly -query '("Mycobacterium"[Organism] OR mycobacterium[All Fields]) AND (latest[filter] AND "complete genome"[filter] AND all[filter] NOT anomalous[filter])' | elink -target nuccore -name assembly_nuccore_refseq | elink -target protein | efetch -db protein -format fasta > mycobacterium.faa 
```

That created a file with all protein sequences from all mycobacteria species
After that I checked how many protein sequences were in the file (~200000): 
-----Check how many entries are in the file? 
egrep -c '^>' mycobacterium.faa 
215194

After that I installed stand alone Blast and created a database from mycobacterium.faa 

-----this makes a database out of a fasta file (this creates many files with dif extensions)
makeblastdb -in mycobacterium_db.faa -dbtype prot

building a new DB, current time: 02/10/2019 12:26:05
New DB name:   /home/maxim/mycobacterium_db.faa
New DB title:  mycobacterium_db.faa
Sequence type: Protein
Keep MBits: T
Maximum file size: 1000000000B
Adding sequences from FASTA; added 215194 sequences in 9.20805 seconds.


--- less function to read a file 
less ...txt

AfHere I tested the blast aligement of proteins in mycobacterium.fa against the database in mycobacterium_db.faa (it is basically aligment of file against file with the same content)

---- make tabulated output file with best scores (max output -5 scores)
blastp -query mycobacterium.faa -db mycobacterium_db.faa -out mycoALL_vs_myco_blastp.tab -evalue 1e-5 -outfmt 6 -max_target_seqs 5

---
blastp -query mycobacterium.faa -db mycobacterium_db.faa -out mycoALL_vs_myco_blastp.tab -evalue 1e-5 -outfmt 6 -max_target_seqs 5

----
 blastp -query mycobac.small.faa -db mycobacterium_db.faa -out myco_myco_blastp.tab -evalue 1e-5 -outfmt 7

----
blastp -query mycobac.small.faa -db mycobacterium_db.faa -out myco.small_vs_myco_db.txt




That created a large file with protein alignments: 

Database: mycobacterium_db.faa
           215,194 sequences; 77,848,592 total letters



Query= WP_104182628.1 MULTISPECIES: XRE family transcriptional regulator
[Mycobacterium avium complex (MAC)]

Length=178
                                                                      Score     E
Sequences producing significant alignments:                          (Bits)  Value

  WP_104182628.1 MULTISPECIES: XRE family transcriptional regulat...  355     1e-126
  WP_009979691.1 MULTISPECIES: XRE family transcriptional regulat...  350     8e-125
  WP_033711243.1 MULTISPECIES: XRE family transcriptional regulat...  348     5e-124
  WP_065370886.1 hypothetical protein [Mycobacterium avium]           348     6e-124
  WP_099180165.1 XRE family transcriptional regulator [Mycobacter...  345     8e-123
  WP_095578328.1 XRE family transcriptional regulator [Mycobacter...  289     8e-101
  WP_014712519.1 XRE family transcriptional regulator [Mycobacter...  275     8e-95 
  WP_008261906.1 MULTISPECIES: XRE family transcriptional regulat...  274     9e-95 
  WP_020823796.1 MULTISPECIES: XRE family transcriptional regulat...  273     2e-94 
  WP_014381437.1 XRE family transcriptional regulator [Mycobacter...  273     3e-94 
  WP_040629432.1 hypothetical protein [Mycobacterium colombiense]     270     4e-93 
  WP_096436617.1 transcriptional regulator [Mycobacterium shigaense]  266     1e-91 
  WP_020731491.1 XRE family transcriptional regulator [Mycobacter...  263     3e-90 
  WP_012392417.1 MULTISPECIES: XRE family transcriptional regulat...  263     4e-90 
  WP_015354196.1 XRE family transcriptional regulator [Mycobacter...  262     4e-90 
  WP_011739303.1 XRE family transcriptional regulator [Mycobacter...  261     1e-89 
  WP_096371985.1 XRE family transcriptional regulator [Mycobacter...  260     2e-89 
  WP_072501458.1 XRE family transcriptional regulator [Mycobacter...  258     9e-89 
  WP_047314447.1 hypothetical protein [Mycobacterium haemophilum]     250     3e-85 
  WP_023369668.1 hypothetical protein [Mycobacterium kansasii]        240     3e-81 
  WP_120791432.1 XRE family transcriptional regulator [Mycobacter...  238     7e-81 
  WP_010908994.1 hypothetical protein [Mycobacterium leprae]          233     9e-79 
  NP_302675.1 hypothetical protein ML2616 [Mycobacterium leprae TN]   233     9e-79 
  WP_014000113.1 hypothetical protein [Mycobacterium canettii]        224     2e-75 
  YP_009357537.1 conserved protein [Mycobacterium tuberculosis va...  224     3e-75 
  WP_003401187.1 MULTISPECIES: hypothetical protein [Mycobacterium]   224     3e-75 
  NP_214715.1 hypothetical protein Rv0201c [Mycobacterium tubercu...  224     3e-75 
  WP_015574898.1 hypothetical protein [Mycobacterium tuberculosis]    221     7e-74 
  WP_047328482.1 hypothetical protein [Mycobacterium sp. EPa45]       211     4e-70 
  WP_071948122.1 XRE family transcriptional regulator [Mycobacter...  210     1e-69 
  WP_096309573.1 transcriptional regulator [Mycobacterium sp. PYR15]  209     2e-69 
  WP_015304181.1 hypothetical protein [Mycobacterium sp. JS623]       204     2e-67 
  WP_068918913.1 MULTISPECIES: hypothetical protein [Mycobacteria...  201     7e-66 
  WP_067990266.1 hypothetical protein [Mycobacterium sp. YC-RL4]      200     1e-65 
  WP_019514229.1 MULTISPECIES: hypothetical protein [Mycobacteria...  191     2e-62 
  WP_087083155.1 transcriptional regulator [Mycobacterium dioxano...  189     4e-61 
  WP_011854236.1 hypothetical protein [Mycobacterium sp. JLS]         185     1e-59 
  WP_011557588.1 MULTISPECIES: hypothetical protein [Mycobacteria...  185     2e-59 
  WP_030097363.1 MULTISPECIES: XRE family transcriptional regulat...  149     2e-45 
  WP_023365508.1 XRE family transcriptional regulator [Mycobacter...  34.3    0.096 
  WP_068917942.1 MULTISPECIES: XRE family transcriptional regulat...  32.3    0.70  
  WP_080772681.1 hypothetical protein [Mycobacterium avium]           31.6    1.3   
  WP_071948813.1 XRE family transcriptional regulator [Mycobacter...  30.8    2.0   
  WP_096312456.1 XRE family transcriptional regulator [Mycobacter...  30.8    2.2   
  WP_047315757.1 helix-turn-helix domain-containing protein [Myco...  29.3    3.2   
  WP_096436134.1 XRE family transcriptional regulator [Mycobacter...  28.9    3.7   
  WP_019514158.1 MULTISPECIES: amidohydrolase [Mycobacteriaceae]      29.6    5.1   
  WP_068918459.1 glycine hydroxymethyltransferase [Mycobacterium ...  30.0    5.4   
  WP_014942948.1 hypothetical protein [Mycobacterium intracellulare]  29.6    5.5   
  WP_081490140.1 MULTISPECIES: hypothetical protein [Mycobacterium]   29.6    5.8   
  WP_014381190.1 hypothetical protein [Mycobacterium intracellulare]  29.6    5.9   
  WP_120794320.1 aminotransferase class I/II-fold pyridoxal phosp...  29.6    6.5   
  WP_015309273.1 type I polyketide synthase [Mycobacterium sp. JS...  29.3    8.7   
  WP_047332606.1 helix-turn-helix domain-containing protein [Myco...  28.9    9.2   


> WP_104182628.1 MULTISPECIES: XRE family transcriptional regulator 
[Mycobacterium avium complex (MAC)]
Length=178

 Score = 355 bits (911),  Expect = 1e-126, Method: Compositional matrix adjust.
 Identities = 178/178 (100%), Positives = 178/178 (100%), Gaps = 0/178 (0%)

Query  1    MTLAPDRRPASPPHRPAPGDQRNRGGPSAPLPDLDQPVEFWPTAAIRSALQSGDIATWKR  60
            MTLAPDRRPASPPHRPAPGDQRNRGGPSAPLPDLDQPVEFWPTAAIRSALQSGDIATWKR
Sbjct  1    MTLAPDRRPASPPHRPAPGDQRNRGGPSAPLPDLDQPVEFWPTAAIRSALQSGDIATWKR  60

Query  61   IAGALKRDPYGRTARQVEEVLDGTRPYGIAKALWEVLERARAHLEANERAEVARHVRLLI  120
            IAGALKRDPYGRTARQVEEVLDGTRPYGIAKALWEVLERARAHLEANERAEVARHVRLLI
Sbjct  61   IAGALKRDPYGRTARQVEEVLDGTRPYGIAKALWEVLERARAHLEANERAEVARHVRLLI  120

Query  121  DRSGLGQQEFASRIGVSAEELGSYLDGSTSPTAALMIRIRRLSDRFVKVKSARSAESN  178
            DRSGLGQQEFASRIGVSAEELGSYLDGSTSPTAALMIRIRRLSDRFVKVKSARSAESN
Sbjct  121  DRSGLGQQEFASRIGVSAEELGSYLDGSTSPTAALMIRIRRLSDRFVKVKSARSAESN  178


> WP_009979691.1 MULTISPECIES: XRE family transcriptional regulator 
[Mycobacterium avium complex (MAC)]
Length=179

 Score = 350 bits (898),  Expect = 8e-125, Method: Compositional matrix adjust.
 Identities = 178/179 (99%), Positives = 178/179 (99%), Gaps = 1/179 (1%)

Query  1    MTLAPDRRPASPPHRPAPGDQRNRGG-PSAPLPDLDQPVEFWPTAAIRSALQSGDIATWK  59
            MTLAPDRRPASPPHRPAPGDQRNRGG PSAPLPDLDQPVEFWPTAAIRSALQSGDIATWK
Sbjct  1    MTLAPDRRPASPPHRPAPGDQRNRGGGPSAPLPDLDQPVEFWPTAAIRSALQSGDIATWK  60

Query  60   RIAGALKRDPYGRTARQVEEVLDGTRPYGIAKALWEVLERARAHLEANERAEVARHVRLL  119
            RIAGALKRDPYGRTARQVEEVLDGTRPYGIAKALWEVLERARAHLEANERAEVARHVRLL
Sbjct  61   RIAGALKRDPYGRTARQVEEVLDGTRPYGIAKALWEVLERARAHLEANERAEVARHVRLL  120

Query  120  IDRSGLGQQEFASRIGVSAEELGSYLDGSTSPTAALMIRIRRLSDRFVKVKSARSAESN  178
            IDRSGLGQQEFASRIGVSAEELGSYLDGSTSPTAALMIRIRRLSDRFVKVKSARSAESN
Sbjct  121  IDRSGLGQQEFASRIGVSAEELGSYLDGSTSPTAALMIRIRRLSDRFVKVKSARSAESN  179




Part II. 

I was asked to download all gene sequences from all mycobacteria species. 

I tried to modify the below command line to get genes instead of proteins

esearch -db assembly -query '("Mycobacterium"[Organism] OR mycobacterium[All Fields]) AND (latest[filter] AND "complete genome"[filter] AND all[filter] NOT anomalous[filter])' | elink -target nuccore -name assembly_nuccore_refseq | elink -target protein | efetch -db protein -format fasta > mycobacterium.faa 

But nothing worked ()

So I decided to use this pipelines 

----example line 
-----Collect and modify the FTP URLs to point to the _genomic.fna.gz files

curl 'ftp://ftp.ncbi.nlm.nih.gov/genomes/refseq/fungi/assembly_summary.txt' | \awk '{FS="\t"}  !/^#/ {print $20} ' | \sed-r 's|(ftp://ftp.ncbi.nlm.nih.gov/genomes/all/.+/)(GCF_.+)|\1\2/\2_genomic.fna.gz|' > genomic_file


----bacterial ftp
ftp://ftp.ncbi.nlm.nih.gov/genomes/refseq/bacteria/

curl 'ftp://ftp.ncbi.nlm.nih.gov/genomes/refseq/bacteria/assembly_summary.txt' | \awk '{FS="\t"}  !/^#/ {print $20} ' | \sed-r 's|(ftp://ftp.ncbi.nlm.nih.gov/genomes/all/.+/)(GCF_.+)|\1\2/\2_genomic.fna.gz|' > genomic_file

################################################################################

-----How to download genome assemblies from NCBI with a list of GCA identifiers?
-----from this website: https://www.biostars.org/p/344959/

esearch -db assembly -query 'Bos taurus[organism] AND latest[filter]' \
    | esummary \
    | xtract -pattern DocumentSummary -element FtpPath_GenBank \
    | while read -r line ; 
    do
        fname=$(echo $line | grep -o 'GCA_.*' | sed 's/$/_genomic.fna.gz/') ;
        wget "$line/$fname" ;
    done

--------- For Mycobacterium (whole genome shotgun sequnce) : The assembly accession starts with a three letter prefix, GCA for GenBank assemblies and GCF for RefSeq assemblies.

esearch -db assembly -query 'Mycobacterium [organism] AND latest[filter]' \
    | esummary \
    | xtract -pattern DocumentSummary -element FtpPath_RefSeq \
    | while read -r line ; 
    do
        fname=$(echo $line | grep -o 'GCF_.*' | sed 's/$/_genomic.fna.gz/') ;
        wget "$line/$fname" ;
    done

#############################################################################
----------Question: how to download all the complete genomes for mycobacteria from NCBI?
----from this website: https://www.biostars.org/p/344959/

#Get GenBank assembly summary file
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/genbank/assembly_summary_genbank.txt

#Get all lines that have "Mycobacter", if 12th field is "Complete Genome", print the 20th field (url to file).
#But the actual filename ends _genomic.fna.gz so include that too..
grep Mycobacter assembly_summary_genbank.txt \
    | awk 'BEGIN{FS="\t"}{if($12=="Complete Genome"){print $20}}' \
    | awk 'BEGIN{OFS=FS="/"}{print $0,$NF"_genomic.fna.gz"}' \
    > urls.txt

#Now you can go through your urls file
IFS=$'\n'; for NEXT in $(cat urls.txt); do wget "$NEXT"; done


So only the last command worked for me (highlighted in yellow), but it downloads all gene assemblies, but not genes. 

So we still have to clue how to download the genes for all mycobacterial species. 
