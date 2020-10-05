# mirror_Manhattan
GWAS mirrored Manhattan plots

```R
source('plot_mirrored_Manhattan.R')
png('my_mirrored_Manhattan.png', type='cairo', width=1500, height=1000)
plot_mirrored_manhattan(manhattan_df)
dev.off()
```
