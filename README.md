# mirror_Manhattan
GWAS mirrored Manhattan plots to compare two association testing methods. 

## :heavy_plus_sign: To plot in linux system
- [Step 1. Download plot_mirrored_Manhattan.R(https://github.com/lzhangdc/mirror_Manhattan/blob/main/plot_mirrored_Manhattan.R) to the working directory]

- [Step 2. Run the following code in R]
```R
source('plot_mirrored_Manhattan.R')
png('my_mirrored_Manhattan.png', type='cairo', width=1500, height=1000)
plot_mirrored_manhattan(chr=test_df$chr, bp=test_df$bp, pval1=test_df$pval1, pval2=test_df$pval2)
dev.off()
```
