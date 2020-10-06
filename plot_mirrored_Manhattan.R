### Input values ###
### chr: the chromosome number of the tested SNP
### bp: base pair number
### pval1: p-value of GWAS using testing method 1
### pval2: p-value of GWAS using testing method 2
### name_test1: name of testing method 1 to appear on the Manhattan plot
### name_test2: name of testing method 2 to appear on the Manhattan plot
### col_odd: color of the dots for odd chromosomes
### col_even: color of the dots for even chromosomes

plot_mirrored_manhattan <- function(chr, bp, pval1, pval2, name_test1='Test 1', name_test2='Test 2', col_odd='grey', col_even='skyblue'){
  chr_num <- length(unique(chr))
  chr_length <- sapply(1:chr_num, function(x) max(bp[chr==x]))
  add_length <- cumsum(as.numeric(chr_length))-chr_length
  new_bp <- sapply(1:chr_num, function(x) bp[chr==x]+add_length[x])
  new_bp <- unlist(new_bp)
  chr_tick_pos <- (add_length + cumsum(as.numeric(chr_length)))/2
  ymax <- max(-log(pval1, base=10), -log(pval2, base=10), na.rm=T) + 0.5
  p <- plot(x=rnorm(100), y=rnorm(100), bty='n', xaxt='n', yaxt='n', xlim=c(0, max(new_bp)), ylim=c(-ymax, ymax), type='n', xlab='Chromosome', ylab=expression(paste('-log'[10], ' p-value')))
	axis(2, at=seq(-10,10,by=2), labels=as.character(c(10, 8, 6, 4, 2, 0, 2, 4, 6, 8, 10)), las=2)
	axis(2, at=seq(-10,10,by=2), labels=as.character(c(10, 8, 6, 4, 2, 0, 2, 4, 6, 8, 10)), las=2)
  abline(h=-log(5*10^(-8), base=10), col='red')
  abline(h=-log(1*10^(-5), base=10), col='blue')
  abline(h=log(5*10^(-8), base=10), col='red')
  abline(h=log(1*10^(-5), base=10), col='blue')
  odd_chr <- seq(1, chr_num, by=2); even_chr <- odd_chr+1
  for(i in odd_chr){
        print(paste('plotting chr', i, 'at', Sys.time()))
        temp_ind <- which(chr==i)
        points(x=new_bp[temp_ind], y=-log(pval1[temp_ind], base=10), pch=20, col=col_odd)
        points(x=new_bp[temp_ind], y=log(pval2[temp_ind], base=10), pch=20, col=col_odd)
  }
  for(j in even_chr){
        print(paste('plotting chr', j, 'at', Sys.time()))
        temp_ind <- which(chr==j)
        points(x=new_bp[temp_ind], y=-log(pval1[temp_ind], base=10), pch=20, col=col_even)
        points(x=new_bp[temp_ind], y=log(pval2[temp_ind], base=10), pch=20, col=col_even)
  }
  axis(1, at=chr_tick_pos, labels=as.character(1:chr_num), col=NA, col.ticks = 1, pos=c(0,0))
  abline(h=0)
  text(x=max(new_bp)/2, y=ymax-0.5, labels=name_test1, cex=1.5)
  text(x=max(new_bp)/2, y=-ymax+0.5, labels=name_test2, cex=1.5)
  return(p)
  }
