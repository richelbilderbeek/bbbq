# Formats

Conclusion: Use `-outftm 5` to get XML output.


```
#!/bin/bash
# 'show_blast_outputs' shows the different formats that blast produces

for i in $(seq 10 18)
do
  echo "***********************************************************************"
  echo $i
  echo "***********************************************************************"
  blastp -query mycobacterium_short.faa -db mycobacterium_short.faa -outfmt $i
done
```

Call:

```
./show_blast_outputs
```

Output:

```
***********************************************************************
1
***********************************************************************
BLASTP 2.6.0+


Reference: Stephen F. Altschul, Thomas L. Madden, Alejandro A.
Schaffer, Jinghui Zhang, Zheng Zhang, Webb Miller, and David J.
Lipman (1997), "Gapped BLAST and PSI-BLAST: a new generation of
protein database search programs", Nucleic Acids Res. 25:3389-3402.


Reference for composition-based statistics: Alejandro A. Schaffer,
L. Aravind, Thomas L. Madden, Sergei Shavirin, John L. Spouge, Yuri
I. Wolf, Eugene V. Koonin, and Stephen F. Altschul (2001),
"Improving the accuracy of PSI-BLAST protein database searches with
composition-based statistics and other refinements", Nucleic Acids
Res. 29:2994-3005.



Database: mycobacterium_short.faa
           2 sequences; 481 total letters



Query= WP_128618872.1 NUDIX hydrolase [Mycobacterium lepraemurium]

Length=178
                                                                      Score     E
Sequences producing significant alignments:                          (Bits)  Value

  WP_128618872.1 NUDIX hydrolase [Mycobacterium lepraemurium]         350     5e-130



Query_1  1    MSVRDSVLALLTGWDPPDAAQDSLRHAVLAFVHAHPDACRRECEPGHVTASTLVLDHTGG  60
0        1    ............................................................  60

Query_1  61   RVLLTLHHRLGRWVQLGGHCDDDDAGIVAAALREATEESGIDGLRMAPGLTAVHVHPVTC  120
0        61   ............................................................  120

Query_1  121  SLGLPTRHLDLQFVAHAPAGARIAISDESEDLRWWPVDALPTGTDHALTYLVAQATLA  178
0        121  ..........................................................  178


Lambda      K        H        a         alpha
   0.321    0.135    0.433    0.792     4.96 

Gapped
Lambda      K        H        a         alpha    sigma
   0.267   0.0410    0.140     1.90     42.6     43.6 

Effective search space used: 65208


Query= WP_120794232.1 Rossmann-like and DUF2520 domain-containing protein
[Mycobacterium paragordonae]

Length=303
                                                                      Score     E
Sequences producing significant alignments:                          (Bits)  Value

  WP_120794232.1 Rossmann-like and DUF2520 domain-containing prot...  589     0.0  



Query_2  1    MEQFDGLRPARLKVGIISAGRVGSALGVALERADHVVVACSAISQASLQRAQRRLPDTPV  60
1        1    ............................................................  60

Query_2  61   LSPPDVAAGAELLLLAVTDSELPGLVAGLAATSAVRPGTIVVHTSGANGIGILEPLTRQG  120
1        61   ............................................................  120

Query_2  121  CIPVAIHPAMTFTGSDEDIARLPDTCFGVTAADEVGYAIGQSLVLEMGGEPFFVREDARV  180
1        121  ............................................................  180

Query_2  181  LYHAALAHASNHLVTVLADALEALRAALTGDELLGQQRVDNQPGGIAERIVGPLARAALE  240
1        181  ............................................................  240

Query_2  241  NTLQRGQAALTGPVARGDAAAVAGHLSALGDADPELAHAYRVNALRTAQRAHAPDDVVEV  300
1        241  ............................................................  300

Query_2  301  LVR  303
1        301  ...  303


Lambda      K        H        a         alpha
   0.319    0.134    0.381    0.792     4.96 

Gapped
Lambda      K        H        a         alpha    sigma
   0.267   0.0410    0.140     1.90     42.6     43.6 

Effective search space used: 114933


  Database: mycobacterium_short.faa
    Posted date:  May 17, 2019  11:47 AM
  Number of letters in database: 481
  Number of sequences in database:  2



Matrix: BLOSUM62
Gap Penalties: Existence: 11, Extension: 1
Neighboring words threshold: 11
Window for multiple hits: 40
***********************************************************************
2
***********************************************************************
BLASTP 2.6.0+


Reference: Stephen F. Altschul, Thomas L. Madden, Alejandro A.
Schaffer, Jinghui Zhang, Zheng Zhang, Webb Miller, and David J.
Lipman (1997), "Gapped BLAST and PSI-BLAST: a new generation of
protein database search programs", Nucleic Acids Res. 25:3389-3402.


Reference for composition-based statistics: Alejandro A. Schaffer,
L. Aravind, Thomas L. Madden, Sergei Shavirin, John L. Spouge, Yuri
I. Wolf, Eugene V. Koonin, and Stephen F. Altschul (2001),
"Improving the accuracy of PSI-BLAST protein database searches with
composition-based statistics and other refinements", Nucleic Acids
Res. 29:2994-3005.



Database: mycobacterium_short.faa
           2 sequences; 481 total letters



Query= WP_128618872.1 NUDIX hydrolase [Mycobacterium lepraemurium]

Length=178
                                                                      Score     E
Sequences producing significant alignments:                          (Bits)  Value

  WP_128618872.1 NUDIX hydrolase [Mycobacterium lepraemurium]         350     5e-130



Query_1  1    MSVRDSVLALLTGWDPPDAAQDSLRHAVLAFVHAHPDACRRECEPGHVTASTLVLDHTGG  60
0        1    MSVRDSVLALLTGWDPPDAAQDSLRHAVLAFVHAHPDACRRECEPGHVTASTLVLDHTGG  60

Query_1  61   RVLLTLHHRLGRWVQLGGHCDDDDAGIVAAALREATEESGIDGLRMAPGLTAVHVHPVTC  120
0        61   RVLLTLHHRLGRWVQLGGHCDDDDAGIVAAALREATEESGIDGLRMAPGLTAVHVHPVTC  120

Query_1  121  SLGLPTRHLDLQFVAHAPAGARIAISDESEDLRWWPVDALPTGTDHALTYLVAQATLA  178
0        121  SLGLPTRHLDLQFVAHAPAGARIAISDESEDLRWWPVDALPTGTDHALTYLVAQATLA  178


Lambda      K        H        a         alpha
   0.321    0.135    0.433    0.792     4.96 

Gapped
Lambda      K        H        a         alpha    sigma
   0.267   0.0410    0.140     1.90     42.6     43.6 

Effective search space used: 65208


Query= WP_120794232.1 Rossmann-like and DUF2520 domain-containing protein
[Mycobacterium paragordonae]

Length=303
                                                                      Score     E
Sequences producing significant alignments:                          (Bits)  Value

  WP_120794232.1 Rossmann-like and DUF2520 domain-containing prot...  589     0.0  



Query_2  1    MEQFDGLRPARLKVGIISAGRVGSALGVALERADHVVVACSAISQASLQRAQRRLPDTPV  60
1        1    MEQFDGLRPARLKVGIISAGRVGSALGVALERADHVVVACSAISQASLQRAQRRLPDTPV  60

Query_2  61   LSPPDVAAGAELLLLAVTDSELPGLVAGLAATSAVRPGTIVVHTSGANGIGILEPLTRQG  120
1        61   LSPPDVAAGAELLLLAVTDSELPGLVAGLAATSAVRPGTIVVHTSGANGIGILEPLTRQG  120

Query_2  121  CIPVAIHPAMTFTGSDEDIARLPDTCFGVTAADEVGYAIGQSLVLEMGGEPFFVREDARV  180
1        121  CIPVAIHPAMTFTGSDEDIARLPDTCFGVTAADEVGYAIGQSLVLEMGGEPFFVREDARV  180

Query_2  181  LYHAALAHASNHLVTVLADALEALRAALTGDELLGQQRVDNQPGGIAERIVGPLARAALE  240
1        181  LYHAALAHASNHLVTVLADALEALRAALTGDELLGQQRVDNQPGGIAERIVGPLARAALE  240

Query_2  241  NTLQRGQAALTGPVARGDAAAVAGHLSALGDADPELAHAYRVNALRTAQRAHAPDDVVEV  300
1        241  NTLQRGQAALTGPVARGDAAAVAGHLSALGDADPELAHAYRVNALRTAQRAHAPDDVVEV  300

Query_2  301  LVR  303
1        301  LVR  303


Lambda      K        H        a         alpha
   0.319    0.134    0.381    0.792     4.96 

Gapped
Lambda      K        H        a         alpha    sigma
   0.267   0.0410    0.140     1.90     42.6     43.6 

Effective search space used: 114933


  Database: mycobacterium_short.faa
    Posted date:  May 17, 2019  11:47 AM
  Number of letters in database: 481
  Number of sequences in database:  2



Matrix: BLOSUM62
Gap Penalties: Existence: 11, Extension: 1
Neighboring words threshold: 11
Window for multiple hits: 40
***********************************************************************
3
***********************************************************************
BLASTP 2.6.0+


Reference: Stephen F. Altschul, Thomas L. Madden, Alejandro A.
Schaffer, Jinghui Zhang, Zheng Zhang, Webb Miller, and David J.
Lipman (1997), "Gapped BLAST and PSI-BLAST: a new generation of
protein database search programs", Nucleic Acids Res. 25:3389-3402.


Reference for composition-based statistics: Alejandro A. Schaffer,
L. Aravind, Thomas L. Madden, Sergei Shavirin, John L. Spouge, Yuri
I. Wolf, Eugene V. Koonin, and Stephen F. Altschul (2001),
"Improving the accuracy of PSI-BLAST protein database searches with
composition-based statistics and other refinements", Nucleic Acids
Res. 29:2994-3005.



Database: mycobacterium_short.faa
           2 sequences; 481 total letters



Query= WP_128618872.1 NUDIX hydrolase [Mycobacterium lepraemurium]

Length=178
                                                                      Score     E
Sequences producing significant alignments:                          (Bits)  Value

  WP_128618872.1 NUDIX hydrolase [Mycobacterium lepraemurium]         350     5e-130



Query_1  1    MSVRDSVLALLTGWDPPDAAQDSLRHAVLAFVHAHPDACRRECEPGHVTASTLVLDHTGG  60
0        1    ............................................................  60

Query_1  61   RVLLTLHHRLGRWVQLGGHCDDDDAGIVAAALREATEESGIDGLRMAPGLTAVHVHPVTC  120
0        61   ............................................................  120

Query_1  121  SLGLPTRHLDLQFVAHAPAGARIAISDESEDLRWWPVDALPTGTDHALTYLVAQATLA  178
0        121  ..........................................................  178


Lambda      K        H        a         alpha
   0.321    0.135    0.433    0.792     4.96 

Gapped
Lambda      K        H        a         alpha    sigma
   0.267   0.0410    0.140     1.90     42.6     43.6 

Effective search space used: 65208


Query= WP_120794232.1 Rossmann-like and DUF2520 domain-containing protein
[Mycobacterium paragordonae]

Length=303
                                                                      Score     E
Sequences producing significant alignments:                          (Bits)  Value

  WP_120794232.1 Rossmann-like and DUF2520 domain-containing prot...  589     0.0  



Query_2  1    MEQFDGLRPARLKVGIISAGRVGSALGVALERADHVVVACSAISQASLQRAQRRLPDTPV  60
1        1    ............................................................  60

Query_2  61   LSPPDVAAGAELLLLAVTDSELPGLVAGLAATSAVRPGTIVVHTSGANGIGILEPLTRQG  120
1        61   ............................................................  120

Query_2  121  CIPVAIHPAMTFTGSDEDIARLPDTCFGVTAADEVGYAIGQSLVLEMGGEPFFVREDARV  180
1        121  ............................................................  180

Query_2  181  LYHAALAHASNHLVTVLADALEALRAALTGDELLGQQRVDNQPGGIAERIVGPLARAALE  240
1        181  ............................................................  240

Query_2  241  NTLQRGQAALTGPVARGDAAAVAGHLSALGDADPELAHAYRVNALRTAQRAHAPDDVVEV  300
1        241  ............................................................  300

Query_2  301  LVR  303
1        301  ...  303


Lambda      K        H        a         alpha
   0.319    0.134    0.381    0.792     4.96 

Gapped
Lambda      K        H        a         alpha    sigma
   0.267   0.0410    0.140     1.90     42.6     43.6 

Effective search space used: 114933


  Database: mycobacterium_short.faa
    Posted date:  May 17, 2019  11:47 AM
  Number of letters in database: 481
  Number of sequences in database:  2



Matrix: BLOSUM62
Gap Penalties: Existence: 11, Extension: 1
Neighboring words threshold: 11
Window for multiple hits: 40
***********************************************************************
4
***********************************************************************
BLASTP 2.6.0+


Reference: Stephen F. Altschul, Thomas L. Madden, Alejandro A.
Schaffer, Jinghui Zhang, Zheng Zhang, Webb Miller, and David J.
Lipman (1997), "Gapped BLAST and PSI-BLAST: a new generation of
protein database search programs", Nucleic Acids Res. 25:3389-3402.


Reference for composition-based statistics: Alejandro A. Schaffer,
L. Aravind, Thomas L. Madden, Sergei Shavirin, John L. Spouge, Yuri
I. Wolf, Eugene V. Koonin, and Stephen F. Altschul (2001),
"Improving the accuracy of PSI-BLAST protein database searches with
composition-based statistics and other refinements", Nucleic Acids
Res. 29:2994-3005.



Database: mycobacterium_short.faa
           2 sequences; 481 total letters



Query= WP_128618872.1 NUDIX hydrolase [Mycobacterium lepraemurium]

Length=178
                                                                      Score     E
Sequences producing significant alignments:                          (Bits)  Value

  WP_128618872.1 NUDIX hydrolase [Mycobacterium lepraemurium]         350     5e-130



Query_1  1    MSVRDSVLALLTGWDPPDAAQDSLRHAVLAFVHAHPDACRRECEPGHVTASTLVLDHTGG  60
0        1    MSVRDSVLALLTGWDPPDAAQDSLRHAVLAFVHAHPDACRRECEPGHVTASTLVLDHTGG  60

Query_1  61   RVLLTLHHRLGRWVQLGGHCDDDDAGIVAAALREATEESGIDGLRMAPGLTAVHVHPVTC  120
0        61   RVLLTLHHRLGRWVQLGGHCDDDDAGIVAAALREATEESGIDGLRMAPGLTAVHVHPVTC  120

Query_1  121  SLGLPTRHLDLQFVAHAPAGARIAISDESEDLRWWPVDALPTGTDHALTYLVAQATLA  178
0        121  SLGLPTRHLDLQFVAHAPAGARIAISDESEDLRWWPVDALPTGTDHALTYLVAQATLA  178


Lambda      K        H        a         alpha
   0.321    0.135    0.433    0.792     4.96 

Gapped
Lambda      K        H        a         alpha    sigma
   0.267   0.0410    0.140     1.90     42.6     43.6 

Effective search space used: 65208


Query= WP_120794232.1 Rossmann-like and DUF2520 domain-containing protein
[Mycobacterium paragordonae]

Length=303
                                                                      Score     E
Sequences producing significant alignments:                          (Bits)  Value

  WP_120794232.1 Rossmann-like and DUF2520 domain-containing prot...  589     0.0  



Query_2  1    MEQFDGLRPARLKVGIISAGRVGSALGVALERADHVVVACSAISQASLQRAQRRLPDTPV  60
1        1    MEQFDGLRPARLKVGIISAGRVGSALGVALERADHVVVACSAISQASLQRAQRRLPDTPV  60

Query_2  61   LSPPDVAAGAELLLLAVTDSELPGLVAGLAATSAVRPGTIVVHTSGANGIGILEPLTRQG  120
1        61   LSPPDVAAGAELLLLAVTDSELPGLVAGLAATSAVRPGTIVVHTSGANGIGILEPLTRQG  120

Query_2  121  CIPVAIHPAMTFTGSDEDIARLPDTCFGVTAADEVGYAIGQSLVLEMGGEPFFVREDARV  180
1        121  CIPVAIHPAMTFTGSDEDIARLPDTCFGVTAADEVGYAIGQSLVLEMGGEPFFVREDARV  180

Query_2  181  LYHAALAHASNHLVTVLADALEALRAALTGDELLGQQRVDNQPGGIAERIVGPLARAALE  240
1        181  LYHAALAHASNHLVTVLADALEALRAALTGDELLGQQRVDNQPGGIAERIVGPLARAALE  240

Query_2  241  NTLQRGQAALTGPVARGDAAAVAGHLSALGDADPELAHAYRVNALRTAQRAHAPDDVVEV  300
1        241  NTLQRGQAALTGPVARGDAAAVAGHLSALGDADPELAHAYRVNALRTAQRAHAPDDVVEV  300

Query_2  301  LVR  303
1        301  LVR  303


Lambda      K        H        a         alpha
   0.319    0.134    0.381    0.792     4.96 

Gapped
Lambda      K        H        a         alpha    sigma
   0.267   0.0410    0.140     1.90     42.6     43.6 

Effective search space used: 114933


  Database: mycobacterium_short.faa
    Posted date:  May 17, 2019  11:47 AM
  Number of letters in database: 481
  Number of sequences in database:  2



Matrix: BLOSUM62
Gap Penalties: Existence: 11, Extension: 1
Neighboring words threshold: 11
Window for multiple hits: 40
***********************************************************************
5
***********************************************************************
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

***********************************************************************
6
***********************************************************************
WP_128618872.1	WP_128618872.1	100.000	178	0	0	1	178	1	178	4.71e-130	350
WP_120794232.1	WP_120794232.1	100.000	303	0	0	1	303	1	303	0.0	589
***********************************************************************
7
***********************************************************************
# BLASTP 2.6.0+
# Query: WP_128618872.1 NUDIX hydrolase [Mycobacterium lepraemurium]
# Database: mycobacterium_short.faa
# Fields: query acc.ver, subject acc.ver, % identity, alignment length, mismatches, gap opens, q. start, q. end, s. start, s. end, evalue, bit score
# 1 hits found
WP_128618872.1	WP_128618872.1	100.000	178	0	0	1	178	1	178	4.71e-130	350
# BLASTP 2.6.0+
# Query: WP_120794232.1 Rossmann-like and DUF2520 domain-containing protein [Mycobacterium paragordonae]
# Database: mycobacterium_short.faa
# Fields: query acc.ver, subject acc.ver, % identity, alignment length, mismatches, gap opens, q. start, q. end, s. start, s. end, evalue, bit score
# 1 hits found
WP_120794232.1	WP_120794232.1	100.000	303	0	0	1	303	1	303	0.0	589
# BLAST processed 2 queries
***********************************************************************
8
***********************************************************************
Seq-annot ::= {
  desc {
    user {
      type str "Hist Seqalign",
      data {
        {
          label str "Hist Seqalign",
          data bool TRUE
        }
      }
    },
    user {
      type str "Blast Type",
      data {
        {
          label str "blastp",
          data int 2
        }
      }
    },
    user {
      type str "Blast Database Title",
      data {
        {
          label str "mycobacterium_short.faa",
          data bool FALSE
        }
      }
    }
  },
  data align {
    {
      type partial,
      dim 2,
      score {
        {
          id str "score",
          value int 898
        },
        {
          id str "blast_score",
          value int 898
        },
        {
          id str "e_value",
          value real { 470769813230474, 10, -144 }
        },
        {
          id str "bit_score",
          value real { 350517451453827, 10, -12 }
        },
        {
          id str "num_ident",
          value int 178
        },
        {
          id str "comp_adjustment_method",
          value int 2
        },
        {
          id str "num_positives",
          value int 178
        },
        {
          id str "hsp_percent_coverage",
          value real { 1, 10, 2 }
        }
      },
      segs denseg {
        dim 2,
        numseg 1,
        ids {
          local str "Query_1",
          general {
            db "BL_ORD_ID",
            tag id 0
          }
        },
        starts {
          0,
          0
        },
        lens {
          178
        },
        strands {
          unknown,
          unknown
        }
      }
    }
  }
}
Seq-annot ::= {
  desc {
    user {
      type str "Hist Seqalign",
      data {
        {
          label str "Hist Seqalign",
          data bool TRUE
        }
      }
    },
    user {
      type str "Blast Type",
      data {
        {
          label str "blastp",
          data int 2
        }
      }
    },
    user {
      type str "Blast Database Title",
      data {
        {
          label str "mycobacterium_short.faa",
          data bool FALSE
        }
      }
    }
  },
  data align {
    {
      type partial,
      dim 2,
      score {
        {
          id str "score",
          value int 1519
        },
        {
          id str "blast_score",
          value int 1519
        },
        {
          id str "e_value",
          value real { 0, 10, 0 }
        },
        {
          id str "bit_score",
          value real { 589726388098504, 10, -12 }
        },
        {
          id str "num_ident",
          value int 303
        },
        {
          id str "comp_adjustment_method",
          value int 2
        },
        {
          id str "num_positives",
          value int 303
        },
        {
          id str "hsp_percent_coverage",
          value real { 1, 10, 2 }
        }
      },
      segs denseg {
        dim 2,
        numseg 1,
        ids {
          local str "Query_2",
          general {
            db "BL_ORD_ID",
            tag id 1
          }
        },
        starts {
          0,
          0
        },
        lens {
          303
        },
        strands {
          unknown,
          unknown
        }
      }
    }
  }
}
***********************************************************************
10
***********************************************************************
WP_128618872.1,WP_128618872.1,100.000,178,0,0,1,178,1,178,4.71e-130,350
WP_120794232.1,WP_120794232.1,100.000,303,0,0,1,303,1,303,0.0,589
***********************************************************************
11
***********************************************************************
Blast4-archive ::= {
  request {
    ident "2.6.0+",
    body queue-search {
      program "blastp",
      service "plain",
      queries bioseq-set {
        seq-set {
          seq {
            id {
              local str "Query_1"
            },
            descr {
              user {
                type str "CFastaReader",
                data {
                  {
                    label str "DefLine",
                    data str ">WP_128618872.1 NUDIX hydrolase [Mycobacterium
 lepraemurium]"
                  }
                }
              },
              title "WP_128618872.1 NUDIX hydrolase [Mycobacterium
 lepraemurium]"
            },
            inst {
              repr raw,
              mol aa,
              length 178,
              seq-data ncbieaa "MSVRDSVLALLTGWDPPDAAQDSLRHAVLAFVHAHPDACRRECEPG
HVTASTLVLDHTGGRVLLTLHHRLGRWVQLGGHCDDDDAGIVAAALREATEESGIDGLRMAPGLTAVHVHPVTCSLGL
PTRHLDLQFVAHAPAGARIAISDESEDLRWWPVDALPTGTDHALTYLVAQATLA"
            }
          },
          seq {
            id {
              local str "Query_2"
            },
            descr {
              user {
                type str "CFastaReader",
                data {
                  {
                    label str "DefLine",
                    data str ">WP_120794232.1 Rossmann-like and DUF2520
 domain-containing protein [Mycobacterium paragordonae]"
                  }
                }
              },
              title "WP_120794232.1 Rossmann-like and DUF2520
 domain-containing protein [Mycobacterium paragordonae]"
            },
            inst {
              repr raw,
              mol aa,
              length 303,
              seq-data ncbieaa "MEQFDGLRPARLKVGIISAGRVGSALGVALERADHVVVACSAISQA
SLQRAQRRLPDTPVLSPPDVAAGAELLLLAVTDSELPGLVAGLAATSAVRPGTIVVHTSGANGIGILEPLTRQGCIPV
AIHPAMTFTGSDEDIARLPDTCFGVTAADEVGYAIGQSLVLEMGGEPFFVREDARVLYHAALAHASNHLVTVLADALE
ALRAALTGDELLGQQRVDNQPGGIAERIVGPLARAALENTLQRGQAALTGPVARGDAAAVAGHLSALGDADPELAHAY
RVNALRTAQRAHAPDDVVEVLVR"
            }
          }
        }
      },
      subject database "mycobacterium_short.faa",
      algorithm-options {
        {
          name "EvalueThreshold",
          value cutoff e-value { 1, 10, 1 }
        },
        {
          name "MaskAtHash",
          value boolean FALSE
        },
        {
          name "SegFiltering",
          value boolean FALSE
        },
        {
          name "WordThreshold",
          value integer 11
        },
        {
          name "WindowSize",
          value integer 40
        },
        {
          name "HitlistSize",
          value integer 500
        },
        {
          name "UngappedMode",
          value boolean FALSE
        },
        {
          name "CompositionBasedStats",
          value integer 2
        },
        {
          name "SmithWatermanMode",
          value boolean FALSE
        },
        {
          name "EffectiveSearchSpace",
          value big-integer 65208
        }
      }
    }
  },
  results {
    alignments {
      {
        type partial,
        dim 2,
        score {
          {
            id str "score",
            value int 898
          },
          {
            id str "blast_score",
            value int 898
          },
          {
            id str "e_value",
            value real { 470769813230474, 10, -144 }
          },
          {
            id str "bit_score",
            value real { 350517451453827, 10, -12 }
          },
          {
            id str "num_ident",
            value int 178
          },
          {
            id str "comp_adjustment_method",
            value int 2
          },
          {
            id str "num_positives",
            value int 178
          },
          {
            id str "hsp_percent_coverage",
            value real { 1, 10, 2 }
          }
        },
        segs denseg {
          dim 2,
          numseg 1,
          ids {
            local str "Query_1",
            general {
              db "BL_ORD_ID",
              tag id 0
            }
          },
          starts {
            0,
            0
          },
          lens {
            178
          },
          strands {
            unknown,
            unknown
          }
        }
      },
      {
        type partial,
        dim 2,
        score {
          {
            id str "score",
            value int 1519
          },
          {
            id str "blast_score",
            value int 1519
          },
          {
            id str "e_value",
            value real { 0, 10, 0 }
          },
          {
            id str "bit_score",
            value real { 589726388098504, 10, -12 }
          },
          {
            id str "num_ident",
            value int 303
          },
          {
            id str "comp_adjustment_method",
            value int 2
          },
          {
            id str "num_positives",
            value int 303
          },
          {
            id str "hsp_percent_coverage",
            value real { 1, 10, 2 }
          }
        },
        segs denseg {
          dim 2,
          numseg 1,
          ids {
            local str "Query_2",
            general {
              db "BL_ORD_ID",
              tag id 1
            }
          },
          starts {
            0,
            0
          },
          lens {
            303
          },
          strands {
            unknown,
            unknown
          }
        }
      }
    },
    masks {
    },
    ka-blocks {
      {
        lambda { 321409871016395, 10, -15 },
        k { 135489833977787, 10, -15 },
        h { 432756253711857, 10, -15 },
        gapped FALSE
      },
      {
        lambda { 267, 10, -3 },
        k { 41, 10, -3 },
        h { 14, 10, -2 },
        gapped TRUE
      }
    },
    search-stats {
      "Effective search space: 65208",
      "Effective search space used: 65208",
      "Length adjustment: 26"
    }
  }
}
***********************************************************************
12
***********************************************************************
{
  "Seq_annot": {
    "desc": [
      {
        "user": {
          "type": {
            "str": "Hist Seqalign"
          },
          "data": [
            {
              "label": {
                "str": "Hist Seqalign"
              },
              "data": {
                "bool": true
              }
            }
          ]
        }
      },
      {
        "user": {
          "type": {
            "str": "Blast Type"
          },
          "data": [
            {
              "label": {
                "str": "blastp"
              },
              "data": {
                "int": 2
              }
            }
          ]
        }
      },
      {
        "user": {
          "type": {
            "str": "Blast Database Title"
          },
          "data": [
            {
              "label": {
                "str": "mycobacterium_short.faa"
              },
              "data": {
                "bool": false
              }
            }
          ]
        }
      }
    ],
    "data": {
      "align": [
        {
          "type": "partial",
          "dim": 2,
          "score": [
            {
              "id": {
                "str": "score"
              },
              "value": {
                "int": 898
              }
            },
            {
              "id": {
                "str": "blast_score"
              },
              "value": {
                "int": 898
              }
            },
            {
              "id": {
                "str": "e_value"
              },
              "value": {
                "real": 4.70769813230474e-130
              }
            },
            {
              "id": {
                "str": "bit_score"
              },
              "value": {
                "real": 350.517451453827
              }
            },
            {
              "id": {
                "str": "num_ident"
              },
              "value": {
                "int": 178
              }
            },
            {
              "id": {
                "str": "comp_adjustment_method"
              },
              "value": {
                "int": 2
              }
            },
            {
              "id": {
                "str": "num_positives"
              },
              "value": {
                "int": 178
              }
            },
            {
              "id": {
                "str": "hsp_percent_coverage"
              },
              "value": {
                "real": 100
              }
            }
          ],
          "segs": {
            "denseg": {
              "dim": 2,
              "numseg": 1,
              "ids": [
                {
                  "local": {
                    "str": "Query_1"
                  }
                },
                {
                  "general": {
                    "db": "BL_ORD_ID",
                    "tag": {
                      "id": 0
                    }
                  }
                }
              ],
              "starts": [
                0,
                0
              ],
              "lens": [
                178
              ],
              "strands": [
                "unknown",
                "unknown"
              ]
            }
          }
        }
      ]
    }
  }
}
{
  "Seq_annot": {
    "desc": [
      {
        "user": {
          "type": {
            "str": "Hist Seqalign"
          },
          "data": [
            {
              "label": {
                "str": "Hist Seqalign"
              },
              "data": {
                "bool": true
              }
            }
          ]
        }
      },
      {
        "user": {
          "type": {
            "str": "Blast Type"
          },
          "data": [
            {
              "label": {
                "str": "blastp"
              },
              "data": {
                "int": 2
              }
            }
          ]
        }
      },
      {
        "user": {
          "type": {
            "str": "Blast Database Title"
          },
          "data": [
            {
              "label": {
                "str": "mycobacterium_short.faa"
              },
              "data": {
                "bool": false
              }
            }
          ]
        }
      }
    ],
    "data": {
      "align": [
        {
          "type": "partial",
          "dim": 2,
          "score": [
            {
              "id": {
                "str": "score"
              },
              "value": {
                "int": 1519
              }
            },
            {
              "id": {
                "str": "blast_score"
              },
              "value": {
                "int": 1519
              }
            },
            {
              "id": {
                "str": "e_value"
              },
              "value": {
                "real": 0
              }
            },
            {
              "id": {
                "str": "bit_score"
              },
              "value": {
                "real": 589.726388098504
              }
            },
            {
              "id": {
                "str": "num_ident"
              },
              "value": {
                "int": 303
              }
            },
            {
              "id": {
                "str": "comp_adjustment_method"
              },
              "value": {
                "int": 2
              }
            },
            {
              "id": {
                "str": "num_positives"
              },
              "value": {
                "int": 303
              }
            },
            {
              "id": {
                "str": "hsp_percent_coverage"
              },
              "value": {
                "real": 100
              }
            }
          ],
          "segs": {
            "denseg": {
              "dim": 2,
              "numseg": 1,
              "ids": [
                {
                  "local": {
                    "str": "Query_2"
                  }
                },
                {
                  "general": {
                    "db": "BL_ORD_ID",
                    "tag": {
                      "id": 1
                    }
                  }
                }
              ],
              "starts": [
                0,
                0
              ],
              "lens": [
                303
              ],
              "strands": [
                "unknown",
                "unknown"
              ]
            }
          }
        }
      ]
    }
  }
}
***********************************************************************
13
***********************************************************************
***********************************************************************
14
***********************************************************************
***********************************************************************
15
***********************************************************************
{
"BlastOutput2": [
{
    "report": {
      "program": "blastp",
      "version": "BLASTP 2.6.0+",
      "reference": "Stephen F. Altschul, Thomas L. Madden, Alejandro A. Sch&auml;ffer, Jinghui Zhang, Zheng Zhang, Webb Miller, and David J. Lipman (1997), \"Gapped BLAST and PSI-BLAST: a new generation of protein database search programs\", Nucleic Acids Res. 25:3389-3402.",
      "search_target": {
        "db": "mycobacterium_short.faa"
      },
      "params": {
        "matrix": "BLOSUM62",
        "expect": 10,
        "gap_open": 11,
        "gap_extend": 1,
        "filter": "F",
        "cbs": 2
      },
      "results": {
        "search": {
          "query_id": "Query_1",
          "query_title": "WP_128618872.1 NUDIX hydrolase [Mycobacterium lepraemurium]",
          "query_len": 178,
          "hits": [
            {
              "num": 1,
              "description": [
                {
                  "id": "gnl|BL_ORD_ID|0",
                  "accession": "0",
                  "title": "WP_128618872.1 NUDIX hydrolase [Mycobacterium lepraemurium]"
                }
              ],
              "len": 178,
              "hsps": [
                {
                  "num": 1,
                  "bit_score": 350.517,
                  "score": 898,
                  "evalue": 4.7077e-130,
                  "identity": 178,
                  "positive": 178,
                  "query_from": 1,
                  "query_to": 178,
                  "hit_from": 1,
                  "hit_to": 178,
                  "align_len": 178,
                  "gaps": 0,
                  "qseq": "MSVRDSVLALLTGWDPPDAAQDSLRHAVLAFVHAHPDACRRECEPGHVTASTLVLDHTGGRVLLTLHHRLGRWVQLGGHCDDDDAGIVAAALREATEESGIDGLRMAPGLTAVHVHPVTCSLGLPTRHLDLQFVAHAPAGARIAISDESEDLRWWPVDALPTGTDHALTYLVAQATLA",
                  "hseq": "MSVRDSVLALLTGWDPPDAAQDSLRHAVLAFVHAHPDACRRECEPGHVTASTLVLDHTGGRVLLTLHHRLGRWVQLGGHCDDDDAGIVAAALREATEESGIDGLRMAPGLTAVHVHPVTCSLGLPTRHLDLQFVAHAPAGARIAISDESEDLRWWPVDALPTGTDHALTYLVAQATLA",
                  "midline": "MSVRDSVLALLTGWDPPDAAQDSLRHAVLAFVHAHPDACRRECEPGHVTASTLVLDHTGGRVLLTLHHRLGRWVQLGGHCDDDDAGIVAAALREATEESGIDGLRMAPGLTAVHVHPVTCSLGLPTRHLDLQFVAHAPAGARIAISDESEDLRWWPVDALPTGTDHALTYLVAQATLA"
                }
              ]
            }
          ],
          "stat": {
            "db_num": 2,
            "db_len": 481,
            "hsp_len": 26,
            "eff_space": 65208,
            "kappa": 0.041,
            "lambda": 0.267,
            "entropy": 0.14
          }
        }
      }
    }
  }
,
{
    "report": {
      "program": "blastp",
      "version": "BLASTP 2.6.0+",
      "reference": "Stephen F. Altschul, Thomas L. Madden, Alejandro A. Sch&auml;ffer, Jinghui Zhang, Zheng Zhang, Webb Miller, and David J. Lipman (1997), \"Gapped BLAST and PSI-BLAST: a new generation of protein database search programs\", Nucleic Acids Res. 25:3389-3402.",
      "search_target": {
        "db": "mycobacterium_short.faa"
      },
      "params": {
        "matrix": "BLOSUM62",
        "expect": 10,
        "gap_open": 11,
        "gap_extend": 1,
        "filter": "F",
        "cbs": 2
      },
      "results": {
        "search": {
          "query_id": "Query_2",
          "query_title": "WP_120794232.1 Rossmann-like and DUF2520 domain-containing protein [Mycobacterium paragordonae]",
          "query_len": 303,
          "hits": [
            {
              "num": 1,
              "description": [
                {
                  "id": "gnl|BL_ORD_ID|1",
                  "accession": "1",
                  "title": "WP_120794232.1 Rossmann-like and DUF2520 domain-containing protein [Mycobacterium paragordonae]"
                }
              ],
              "len": 303,
              "hsps": [
                {
                  "num": 1,
                  "bit_score": 589.726,
                  "score": 1519,
                  "evalue": 0,
                  "identity": 303,
                  "positive": 303,
                  "query_from": 1,
                  "query_to": 303,
                  "hit_from": 1,
                  "hit_to": 303,
                  "align_len": 303,
                  "gaps": 0,
                  "qseq": "MEQFDGLRPARLKVGIISAGRVGSALGVALERADHVVVACSAISQASLQRAQRRLPDTPVLSPPDVAAGAELLLLAVTDSELPGLVAGLAATSAVRPGTIVVHTSGANGIGILEPLTRQGCIPVAIHPAMTFTGSDEDIARLPDTCFGVTAADEVGYAIGQSLVLEMGGEPFFVREDARVLYHAALAHASNHLVTVLADALEALRAALTGDELLGQQRVDNQPGGIAERIVGPLARAALENTLQRGQAALTGPVARGDAAAVAGHLSALGDADPELAHAYRVNALRTAQRAHAPDDVVEVLVR",
                  "hseq": "MEQFDGLRPARLKVGIISAGRVGSALGVALERADHVVVACSAISQASLQRAQRRLPDTPVLSPPDVAAGAELLLLAVTDSELPGLVAGLAATSAVRPGTIVVHTSGANGIGILEPLTRQGCIPVAIHPAMTFTGSDEDIARLPDTCFGVTAADEVGYAIGQSLVLEMGGEPFFVREDARVLYHAALAHASNHLVTVLADALEALRAALTGDELLGQQRVDNQPGGIAERIVGPLARAALENTLQRGQAALTGPVARGDAAAVAGHLSALGDADPELAHAYRVNALRTAQRAHAPDDVVEVLVR",
                  "midline": "MEQFDGLRPARLKVGIISAGRVGSALGVALERADHVVVACSAISQASLQRAQRRLPDTPVLSPPDVAAGAELLLLAVTDSELPGLVAGLAATSAVRPGTIVVHTSGANGIGILEPLTRQGCIPVAIHPAMTFTGSDEDIARLPDTCFGVTAADEVGYAIGQSLVLEMGGEPFFVREDARVLYHAALAHASNHLVTVLADALEALRAALTGDELLGQQRVDNQPGGIAERIVGPLARAALENTLQRGQAALTGPVARGDAAAVAGHLSALGDADPELAHAYRVNALRTAQRAHAPDDVVEVLVR"
                }
              ]
            }
          ],
          "stat": {
            "db_num": 2,
            "db_len": 481,
            "hsp_len": 30,
            "eff_space": 114933,
            "kappa": 0.041,
            "lambda": 0.267,
            "entropy": 0.14
          }
        }
      }
    }
  }
]
}
***********************************************************************
16
***********************************************************************
<?xml version="1.0"?>
<BlastXML2
    xmlns="http://www.ncbi.nlm.nih.gov"
    xmlns:xs="http://www.w3.org/2001/XMLSchema-instance"
    xs:schemaLocation="http://www.ncbi.nlm.nih.gov http://www.ncbi.nlm.nih.gov/data_specs/schema_alt/NCBI_BlastOutput2.xsd"
>
<BlastOutput2>
  <report>
    <Report>
      <program>blastp</program>
      <version>BLASTP 2.6.0+</version>
      <reference>Stephen F. Altschul, Thomas L. Madden, Alejandro A. Sch&amp;auml;ffer, Jinghui Zhang, Zheng Zhang, Webb Miller, and David J. Lipman (1997), &quot;Gapped BLAST and PSI-BLAST: a new generation of protein database search programs&quot;, Nucleic Acids Res. 25:3389-3402.</reference>
      <search-target>
        <Target>
          <db>mycobacterium_short.faa</db>
        </Target>
      </search-target>
      <params>
        <Parameters>
          <matrix>BLOSUM62</matrix>
          <expect>10</expect>
          <gap-open>11</gap-open>
          <gap-extend>1</gap-extend>
          <filter>F</filter>
          <cbs>2</cbs>
        </Parameters>
      </params>
      <results>
        <Results>
          <search>
            <Search>
              <query-id>Query_1</query-id>
              <query-title>WP_128618872.1 NUDIX hydrolase [Mycobacterium lepraemurium]</query-title>
              <query-len>178</query-len>
              <hits>
                <Hit>
                  <num>1</num>
                  <description>
                    <HitDescr>
                      <id>gnl|BL_ORD_ID|0</id>
                      <accession>0</accession>
                      <title>WP_128618872.1 NUDIX hydrolase [Mycobacterium lepraemurium]</title>
                    </HitDescr>
                  </description>
                  <len>178</len>
                  <hsps>
                    <Hsp>
                      <num>1</num>
                      <bit-score>350.517</bit-score>
                      <score>898</score>
                      <evalue>4.7077e-130</evalue>
                      <identity>178</identity>
                      <positive>178</positive>
                      <query-from>1</query-from>
                      <query-to>178</query-to>
                      <hit-from>1</hit-from>
                      <hit-to>178</hit-to>
                      <align-len>178</align-len>
                      <gaps>0</gaps>
                      <qseq>MSVRDSVLALLTGWDPPDAAQDSLRHAVLAFVHAHPDACRRECEPGHVTASTLVLDHTGGRVLLTLHHRLGRWVQLGGHCDDDDAGIVAAALREATEESGIDGLRMAPGLTAVHVHPVTCSLGLPTRHLDLQFVAHAPAGARIAISDESEDLRWWPVDALPTGTDHALTYLVAQATLA</qseq>
                      <hseq>MSVRDSVLALLTGWDPPDAAQDSLRHAVLAFVHAHPDACRRECEPGHVTASTLVLDHTGGRVLLTLHHRLGRWVQLGGHCDDDDAGIVAAALREATEESGIDGLRMAPGLTAVHVHPVTCSLGLPTRHLDLQFVAHAPAGARIAISDESEDLRWWPVDALPTGTDHALTYLVAQATLA</hseq>
                      <midline>MSVRDSVLALLTGWDPPDAAQDSLRHAVLAFVHAHPDACRRECEPGHVTASTLVLDHTGGRVLLTLHHRLGRWVQLGGHCDDDDAGIVAAALREATEESGIDGLRMAPGLTAVHVHPVTCSLGLPTRHLDLQFVAHAPAGARIAISDESEDLRWWPVDALPTGTDHALTYLVAQATLA</midline>
                    </Hsp>
                  </hsps>
                </Hit>
              </hits>
              <stat>
                <Statistics>
                  <db-num>2</db-num>
                  <db-len>481</db-len>
                  <hsp-len>26</hsp-len>
                  <eff-space>65208</eff-space>
                  <kappa>0.041</kappa>
                  <lambda>0.267</lambda>
                  <entropy>0.14</entropy>
                </Statistics>
              </stat>
            </Search>
          </search>
        </Results>
      </results>
    </Report>
  </report>
</BlastOutput2>

<BlastOutput2>
  <report>
    <Report>
      <program>blastp</program>
      <version>BLASTP 2.6.0+</version>
      <reference>Stephen F. Altschul, Thomas L. Madden, Alejandro A. Sch&amp;auml;ffer, Jinghui Zhang, Zheng Zhang, Webb Miller, and David J. Lipman (1997), &quot;Gapped BLAST and PSI-BLAST: a new generation of protein database search programs&quot;, Nucleic Acids Res. 25:3389-3402.</reference>
      <search-target>
        <Target>
          <db>mycobacterium_short.faa</db>
        </Target>
      </search-target>
      <params>
        <Parameters>
          <matrix>BLOSUM62</matrix>
          <expect>10</expect>
          <gap-open>11</gap-open>
          <gap-extend>1</gap-extend>
          <filter>F</filter>
          <cbs>2</cbs>
        </Parameters>
      </params>
      <results>
        <Results>
          <search>
            <Search>
              <query-id>Query_2</query-id>
              <query-title>WP_120794232.1 Rossmann-like and DUF2520 domain-containing protein [Mycobacterium paragordonae]</query-title>
              <query-len>303</query-len>
              <hits>
                <Hit>
                  <num>1</num>
                  <description>
                    <HitDescr>
                      <id>gnl|BL_ORD_ID|1</id>
                      <accession>1</accession>
                      <title>WP_120794232.1 Rossmann-like and DUF2520 domain-containing protein [Mycobacterium paragordonae]</title>
                    </HitDescr>
                  </description>
                  <len>303</len>
                  <hsps>
                    <Hsp>
                      <num>1</num>
                      <bit-score>589.726</bit-score>
                      <score>1519</score>
                      <evalue>0</evalue>
                      <identity>303</identity>
                      <positive>303</positive>
                      <query-from>1</query-from>
                      <query-to>303</query-to>
                      <hit-from>1</hit-from>
                      <hit-to>303</hit-to>
                      <align-len>303</align-len>
                      <gaps>0</gaps>
                      <qseq>MEQFDGLRPARLKVGIISAGRVGSALGVALERADHVVVACSAISQASLQRAQRRLPDTPVLSPPDVAAGAELLLLAVTDSELPGLVAGLAATSAVRPGTIVVHTSGANGIGILEPLTRQGCIPVAIHPAMTFTGSDEDIARLPDTCFGVTAADEVGYAIGQSLVLEMGGEPFFVREDARVLYHAALAHASNHLVTVLADALEALRAALTGDELLGQQRVDNQPGGIAERIVGPLARAALENTLQRGQAALTGPVARGDAAAVAGHLSALGDADPELAHAYRVNALRTAQRAHAPDDVVEVLVR</qseq>
                      <hseq>MEQFDGLRPARLKVGIISAGRVGSALGVALERADHVVVACSAISQASLQRAQRRLPDTPVLSPPDVAAGAELLLLAVTDSELPGLVAGLAATSAVRPGTIVVHTSGANGIGILEPLTRQGCIPVAIHPAMTFTGSDEDIARLPDTCFGVTAADEVGYAIGQSLVLEMGGEPFFVREDARVLYHAALAHASNHLVTVLADALEALRAALTGDELLGQQRVDNQPGGIAERIVGPLARAALENTLQRGQAALTGPVARGDAAAVAGHLSALGDADPELAHAYRVNALRTAQRAHAPDDVVEVLVR</hseq>
                      <midline>MEQFDGLRPARLKVGIISAGRVGSALGVALERADHVVVACSAISQASLQRAQRRLPDTPVLSPPDVAAGAELLLLAVTDSELPGLVAGLAATSAVRPGTIVVHTSGANGIGILEPLTRQGCIPVAIHPAMTFTGSDEDIARLPDTCFGVTAADEVGYAIGQSLVLEMGGEPFFVREDARVLYHAALAHASNHLVTVLADALEALRAALTGDELLGQQRVDNQPGGIAERIVGPLARAALENTLQRGQAALTGPVARGDAAAVAGHLSALGDADPELAHAYRVNALRTAQRAHAPDDVVEVLVR</midline>
                    </Hsp>
                  </hsps>
                </Hit>
              </hits>
              <stat>
                <Statistics>
                  <db-num>2</db-num>
                  <db-len>481</db-len>
                  <hsp-len>30</hsp-len>
                  <eff-space>114933</eff-space>
                  <kappa>0.041</kappa>
                  <lambda>0.267</lambda>
                  <entropy>0.14</entropy>
                </Statistics>
              </stat>
            </Search>
          </search>
        </Results>
      </results>
    </Report>
  </report>
</BlastOutput2>
</BlastXML2>
***********************************************************************
17
***********************************************************************
***********************************************************************
18
***********************************************************************

                                          Tax BLAST report                                          

Query= WP_128618872.1 NUDIX hydrolase [Mycobacterium lepraemurium]

Length=178

                                           Organism Report                                           

Accession                                 Description                                Score E-value 

                                          Tax BLAST report                                          

Query= WP_120794232.1 Rossmann-like and DUF2520 domain-containing protein
[Mycobacterium paragordonae]

Length=303

                                           Organism Report                                           

Accession                                 Description                                Score E-value 
```
