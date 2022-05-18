plot_manhattan <- function(chr, bp, pval,col_odd='grey', col_even='skyblue'){
  chr_order <- order(chr)
  chr = chr[chr_order]; bp = bp[chr_order]; pval = pval[chr_order]
  chr_num <- length(unique(chr))
  chr_length <- sapply(1:chr_num, function(x) max(bp[chr==x]))
  add_length <- cumsum(as.numeric(chr_length))-chr_length
  new_bp <- sapply(1:chr_num, function(x) bp[chr==x]+add_length[x])
  new_bp <- unlist(new_bp)
  chr_tick_pos <- (add_length + cumsum(as.numeric(chr_length)))/2
  ymax <- max(-log(pval, base=10), na.rm=T) + 0.5
	p <- plot(x=rnorm(100), y=rnorm(100), bty='n', xaxt='n', yaxt='n', xlim=c(0, max(new_bp)), ylim=c(0, ymax), type='n', xlab='Chromosome', ylab=expression(paste('-log'[10], ' p-value')))
  abline(h=-log(5*10^(-8), base=10), col='red')
  abline(h=-log(1*10^(-5), base=10), col='blue')
  odd_chr <- seq(1, chr_num, by=2); even_chr <- odd_chr+1
  for(i in odd_chr){
        print(paste('plotting chr', i, 'at', Sys.time()))
        temp_ind <- which(chr==i)
        points(x=new_bp[temp_ind], y=-log(pval[temp_ind], base=10), pch=20, col=col_odd)
  }
  for(j in even_chr){
        print(paste('plotting chr', j, 'at', Sys.time()))
        temp_ind <- which(chr==j)
        points(x=new_bp[temp_ind], y=-log(pval[temp_ind], base=10), pch=20, col=col_even)
  }
  axis(1, at=chr_tick_pos, labels=as.character(1:chr_num), col=NA, col.ticks = 1, pos=c(0,0))
  abline(h=0)
  return(p)
  }
