if config['project']['annotation'] == "hg19":

  rule all_exomeseq_somatic:
    input:  expand("{s}"+".realign.bam",s=samples),
#            expand("mutect2_out/{p}.vcf",p=pairs),
#            expand("mutect2_out/chrom_files/{p}_{chr}.vcf",p=pairs,chr=config['references'][pfamily]['CHROMS']),
            expand("mutect_out/{p}"+".FINAL.vcf",p=pairs),
            expand("strelka_out/{p}"+".vcf",p=pairs),
#            expand("mutect2_out/oncotator_out/{p}"+".maf",p=pairs),
            expand("strelka_out/oncotator_out/{p}"+".maf",p=pairs),
            expand("mutect_out/oncotator_out/{p}"+".maf",p=pairs),
            "mutect_variants_alview.input",
            "strelka_out",
#            "mutect2_out",
            "cnvkit_out",
            "mutect_out",
            "delly_out",
            expand("cnvkit_out/{p}_calls.cns", p=pairs),
            expand("cnvkit_out/{p}_gainloss.tsv", p=pairs),                        
            expand("delly_out/{p}_del.bcf", p=pairs),
            expand("delly_out/{p}_ins.bcf", p=pairs),
            expand("delly_out/{p}_dup.bcf", p=pairs),
            expand("delly_out/{p}_tra.bcf", p=pairs),
            expand("delly_out/{p}_inv.bcf", p=pairs),
            expand("theta_out/{p}.input", p=pairs),
            expand("conpair_out/{p}.conpair", p=pairs),
            "mutect_out/merged_somatic.vcf",
            "cnvkit_out/CNVkit_summary_heatmap.pdf",
            "mutect_out/merged_somatic_snpEff.vcf",
            "strelka_out/merged_somatic_snpEff.vcf",
#            "mutect2_out/merged_somatic.vcf",
#            "mutect2_out/merged_somatic_snpEff.vcf",
            "variants.bed",
            "full_annot.txt.zip",
            "sample_network.bmp",
            "variants.database",
#            "mutect2_out/oncotator_out/mutect2_variants.maf",
#            "mutect2_out/mutsigCV_out/somatic.sig_genes.txt",
            "strelka_out/oncotator_out/strelka_variants.maf",
            "strelka_out/mutsigCV_out/somatic.sig_genes.txt",
            "mutect_out/oncotator_out/mutect_variants.maf",
            "mutect_out/mutsigCV_out/somatic.sig_genes.txt",
            "exome_targets.bed"
    output:
    params: rname="final"
    shell:  """
             module load multiqc; multiqc -f -e featureCounts .; mv *.out slurmfiles/; mv *.fin.bam.intervals logfiles/; rm *realign.bai; mv distance.cluster0 distance.cluster1 distance.cluster2 distance.cluster3 distance.nosex samples.txt plink.map plink.ped *.avia_status.txt *.avia.log *_genotypes.vcf logfiles/

            """

else:

  rule all_exomeseq_somatic:
    input:  expand("{s}"+".realign.bam",s=samples),
#            expand("mutect2_out/{p}.vcf",p=pairs),
#            expand("mutect2_out/chrom_files/{p}_{chr}.vcf",p=pairs,chr=config['references'][pfamily]['CHROMS']),
            expand("mutect_out/{p}"+".FINAL.vcf",p=pairs),
            expand("strelka_out/{p}"+".vcf",p=pairs),
            "mutect_variants_alview.input",
            "strelka_out",
#            "mutect2_out",
            "cnvkit_out",
            "mutect_out",
            "delly_out",
            expand("cnvkit_out/{p}_calls.cns", p=pairs),
            expand("cnvkit_out/{p}_gainloss.tsv", p=pairs),                        
            expand("delly_out/{p}_del.bcf", p=pairs),
            expand("delly_out/{p}_ins.bcf", p=pairs),
            expand("delly_out/{p}_dup.bcf", p=pairs),
            expand("delly_out/{p}_tra.bcf", p=pairs),
            expand("delly_out/{p}_inv.bcf", p=pairs),
            expand("theta_out/{p}.input", p=pairs),
            expand("conpair_out/{p}.conpair", p=pairs),
            "mutect_out/merged_somatic.vcf",
            "cnvkit_out/CNVkit_summary_heatmap.pdf",
            "mutect_out/merged_somatic_snpEff.vcf",
            "strelka_out/merged_somatic_snpEff.vcf",
#            "mutect2_out/merged_somatic.vcf",
#            "mutect2_out/merged_somatic_snpEff.vcf",
            "variants.bed",
            "full_annot.txt.zip",
            "sample_network.bmp",
            "variants.database",
            "exome_targets.bed"
    output:
    params: rname="final"
    shell:  """
             module load multiqc; multiqc -f -e featureCounts .; mv *.out slurmfiles/; mv *.fin.bam.intervals logfiles/; rm *realign.bai; mv distance.cluster0 distance.cluster1 distance.cluster2 distance.cluster3 distance.nosex samples.txt plink.map plink.ped *.avia_status.txt *.avia.log *_genotypes.vcf logfiles/

            """