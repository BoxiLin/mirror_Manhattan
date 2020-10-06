# mirror_Manhattan
GWAS mirrored Manhattan plots to compare two association testing methods. 

## :heavy_plus_sign: Quick Start
- [Step 1.] Download plot_mirrored_Manhattan.R(https://github.com/lzhangdc/mirror_Manhattan/blob/main/plot_mirrored_Manhattan.R) to the working directory
- [Step 2.] User-input values: chromosome number, base pair values, p-values from testing method 1 and method 2
```R
### chr: the chromosome number of the tested SNP
### bp: base pair number
### pval1: p-value of GWAS using testing method 1
### pval2: p-value of GWAS using testing method 2
```
- [Step 3.] Plot the mirrored Manhattan plots
```R
source('plot_mirrored_Manhattan.R')
png('my_mirrored_Manhattan.png', type='cairo', width=1500, height=1000)
plot_mirrored_manhattan(chr=test_df$chr, bp=test_df$bp, pval1=test_df$pval1, pval2=test_df$pval2)
dev.off()
```

<img src="https://github.com/lzhangdc/mirror_Manhattan/blob/main/test1.png"/>
