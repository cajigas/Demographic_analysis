# Estimate Site Allelic Frequency Likelihoods with ANGSD
cd $HOME/Projects/Oophaga_DFG/vicentei/population_genetics/demography
REF="$HOME/Projects/Oophaga_sylvatica/OopSyl_NCBI_genome.fasta"
population="East"
bamlist="East_bam.list"
jobToDo="-nThreads 24 -gl 2 -doSaf 1 -doCounts 1 -ref $REF -anc $REF"
filters="-minInd 7 -minMapQ 30 -minQ 20 -setMinDepthInd 1 -remove_bads 1 -C 50 -baq 1 -uniqueOnly 1 -only_proper_pairs 1"

# we subset the bam files to exclude the sites on CDS:
$HOME/Software/ANGSD/angsd/angsd -bam $bamlist -out $population $jobToDo $filters -sites $HOME/Projects/Oophaga_sylvatica/non-CDS_OopSyl_NCBI_genome.ANGSD.Chr1-10_regions
#	-> Number of sites retained after filtering: 14114916 

$HOME/Software/ANGSD/angsd/misc/realSFS CEI.saf.idx -P 24 -fold 1 > East_nonCDS_SFS.txt

$HOME/Software/ANGSD/angsd/misc/realSFS print CEI.saf.idx 2>/dev/null | cut -f1-2 > extract
wc -l extract #14114916 sites


