# Bristol-Bacteria-Meat-Mystery-Project
Scenario:
There have been a number of cases of severe food poisoning in Bristol city centre. The victims have predominantly been university students, and all have reported eating late-night fast-food meat products.
The case has been referred to the UK Health Security Agency (UKHSA) for investigation. The Environmental Health team at the local authority has collected meat samples from several food outlets, and bacteria have been isolated from these samples. (This is a simulated exercise and does not describe a real outbreak. The outlets are fictional.)
The laboratory has sequenced an unidentified protein-coding region from each bacterial isolate. Reads have already been quality-trimmed, and you have been provided with the resulting FASTA files, organised in one directory per food outlet. They have not yet been annotated.

Task: determine what biological information can be recovered from these sequences.

Pipeline:
1. Data preparation
Use Bash to copy the FASTA files from the outlet directories into a single working directory, adding the outlet name to each sequence header.

## copy the FASTA files from the outlet directories into a single working directory.
$ ssh -X gi26912@bp1-login.acrc.bris.ac.uk
$ cd $WORK
$ mkdir Bristol_Bacteria_Meat_Mystery
$ scp "D:/Bioinformatics_MSc/Introduction to Bioinformatics/Mystery Meat Report/sequences_by_outlet.zip" gi26912@bp1-login.acrc.bris.ac.uk:/user/work/gi26912/Bristol_Bacteria_Meat_Mystery/
$ cd $WORK/Bristol_Bacteria_Meat_Mystery
$ unzip sequences_by_outlet.zip
## inspect one of the fasta files to check the format.
$ head sequences_by_outlet/outlet_01/seq013.fasta
>seq013
TTGGCCGGTCAAGTTGTCCAATATGGAAGACATCGTAAACGTAGAAATTACGCGAGAATTTCAGAAGTAT
TAGAATTACCAAACTTAATAGAAATTCAAACTAAGTCTTACGAGTGGTTCCTAAGAGAAGGTTTAATCGA
AATGTTTAGAGACATTTCTCCAATTGAAGATTTTACTGGTAATTTGTCATTAGAGTTCGTGGATTACCGT
TTAGGAGAACCAAAATATGATTTAGAAGAATCTAAAAACCGTGATGCTACTTACGCTGCACCACTTCGTG
TAAAAGTTCGTCTAATCATAAAAGAAACAGGAGAAGTTAAAGAACAAGAAGTCTTTATGGGCGATTTCCC
ATTAATGACCGATACAGGTACGTTCGTGATCAATGGTGCAGAACGTGTAATCGTATCTCAACTAGTCCGT
TCACCATCCGTTTATTTCAATGAAAAAATCGACAAAAATGGTCGTGAAAACTATGATGCAACCATTATTC
CAAACCGTGGGGCATGGTTAGAATATGAAACAGATGCTAAAGATGTTGTATACGTACGGATTGATAGGAC
ACGTAAACTACCATTAACCGTATTGTTACGTGCTCTAGGTTTCTCAAGCGACCAAGAAATTGTTGACCTG
## combine all of the 100 sequences to all_sequences.fasta and add the outlet name to each sequence header.
$ ./catSEQUENCE.sh
## check result by checking the number of lines in all_sequences.fasta.
$ wc -l all_sequences.fasta
## copy the FASTA files from the working directory to local computer for further analysis.
$ scp gi26912@bp1-login.acrc.bris.ac.uk:/user/work/gi26912/Bristol_Bacteria_Meat_Mystery/all_sequences.fasta "D:/Bioinformatics_MSc/Introduction to Bioinformatics/Mystery Meat Report/" 

2. Identify sequence groups
