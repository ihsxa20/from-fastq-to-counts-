#!/bin/bash

SECONDS=0

# change working directory
cd C:\Users\Aashi\Desktop\building_a_pipeline\script



# STEP 1: Run fastqc
#fastq1 <- list.files(path = file.path(base_dir), pattern = "*1.fq.gz$", full.names = TRUE)
#fastq2 <- list.files(path = file.path(base_dir), pattern = "*2.fq.gz$", full.names = TRUE)
#all.equal(length(fastq1),length(fastq2))

#fastqc_dir <- "~/Path/To/Files"
#fastqc(fq.dir = base_dir, qc.dir = fastqc_dir, threads = 4)

#echo "fastqc done "

# run trimmomatic to trim reads with poor quality
#java -jar trimmomatic-0.35.jar PE -phred33 input_forward.fq.gz input_reverse.fq.gz output_forward_paired.fq.gz output_forward_unpaired.fq.gz output_reverse_paired.fq.gz output_reverse_unpaired.fq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
#echo "Trimmomatic finished running!"


##run fastqc again to check how the quality has changed 
#fastqc data/(#read_the_trimmed_fastq_reads.trimmed.fastq ) -o data/


# STEP 2: Run HISAT2
# mkdir HISAT2
# get the genome indices
# wget https://genome-idx.s3.amazonaws.com/hisat/grch38_genome.tar.gz


# run alignment
#hisat2 -p 12 --dta -x HISAT2/grch38/genome -1 data/1_trimmed.fastq -2 data/2_trimmed.fastq  | samtools sort -o HISAT2/data_trimmed.bam
#echo "HISAT2 finished running!"

# STEP 3: Run featureCounts - Quantification


# get gtf
# wget http://ftp.ensembl.org/pub/release-106/gtf/homo_sapiens/Homo_sapiens.GRCh38.106.gtf.gz
#featureCounts -S 2 -a ../hg38/Homo_sapiens.GRCh38.106.gtf -o quants/demo_featurecounts.txt HISAT2/data_trimmed.bam
#echo "featureCounts finished running!"


duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."



