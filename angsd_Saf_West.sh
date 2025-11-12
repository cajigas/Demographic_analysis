# Estimate Site Allelic Frequency Likelihoods with ANGSD
cd $HOME/vicentei/population_genetics/demography
REF="$HOME/Projects/Oophaga_sylvatica/OopSyl_NCBI_genome.fasta"
population="West"
bamlist="West_bam.list"
jobToDo="-nThreads 24 -gl 2 -doSaf 1 -doCounts 1 -ref $REF -anc $REF"
filters="-minInd 13 -minMapQ 30 -minQ 20 -setMinDepthInd 1 -remove_bads 1 -C 50 -baq 1 -uniqueOnly 1 -only_proper_pairs 1"

# prepare the sites file for ANGSD (exclude sites within CDS):
$HOME/Software/ANGSD/angsd/angsd sites index $HOME/Projects/Oophaga_sylvatica/non-CDS_OopSyl_NCBI_genome.ANGSD.Chr1-10_regions 

# we now subset the bam files to exclude the sites on CDS:
$HOME/Software/ANGSD/angsd/angsd -bam $bamlist -out $population $jobToDo $filters -sites $HOME/Projects/Oophaga_sylvatica/non-CDS_OopSyl_NCBI_genome.ANGSD.Chr1-10_regions
#	-> Number of sites retained after filtering: 14425036 
$HOME/Software/ANGSD/angsd/misc/realSFS print West.saf.idx 2>/dev/null | cut -f1-2 > extract
wc -l extract # 14425036 sites
$HOME/Software/ANGSD/angsd/misc/realSFS West.saf.idx -P 24 -fold 1 > West_nonCDS_SFS.txt
