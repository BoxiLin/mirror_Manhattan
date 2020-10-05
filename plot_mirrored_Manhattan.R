###################################################
##### input dataframe: CHR, BP, pval1, pval2 ######
###################################################

plot_mirrored_manhattan <- function(manhattan_df, col_odd='grey', col_even='skyblue'){
  chr_num <- length(unique(manhattan_df$CHR))
  chr_length <- sapply(1:chr_num, function(x) max(manhattan_df$BP[manhattan_df$CHR==x]))
  add_length <- cumsum(as.numeric(chr_length))-chr_length
  new_bp <- sapply(1:chr_num, function(x) manhattan_df$BP[manhattan_df$CHR==x]+add_length[x])
  new_bp <- unlist(new_bp)
  chr_tick_pos <- (add_length + cumsum(as.numeric(chr_length)))/2
  ymax <- max(-log(manhattan_df$pval1, base=10), -log(manhattan_df$pval2, base=10), na.rm=T) + 0.5
  p <- plot(x=rnorm(100), y=rnorm(100), bty='n', xaxt='n', yaxt='n', xlim=c(0, max(manhattan_df$BP)), ylim=c(-ymax, ymax), type='n', xlab='Chromosome', ylab=expression(paste('-log'[10], ' p-value')))
axis(2, at=seq(-10,10,by=2), labels=as.character(c(10, 8, 6, 4, 2, 0, 2, 4, 6, 8, 10)), las=2)
  axis(2, at=seq(-10,10,by=2), labels=as.character(c(10, 8, 6, 4, 2, 0, 2, 4, 6, 8, 10)), las=2)
  abline(h=-log(5*10^(-8), base=10), col='red')
  abline(h=-log(1*10^(-5), base=10), col='blue')
  abline(h=log(5*10^(-8), base=10), col='red')
  abline(h=log(1*10^(-5), base=10), col='blue')
  odd_chr <- seq(1,22,by=2); even_chr <- odd_chr+1
  for(i in odd_chr){
        print(paste('plotting chr', i, 'at', Sys.time()))
        temp_ind <- which(manhattan_df$CHR==i)
        points(x=new_bp[temp_ind], y=-log(manhattan_df$pval1[temp_ind], base=10), pch=20, col=col_odd)
        points(x=new_bp[temp_ind], y=log(manhattan_df$pval2[temp_ind], base=10), pch=20, col=col_odd)
  }
  for(j in even_chr){
        print(paste('plotting chr', j, 'at', Sys.time()))
        temp_ind <- which(manhattan_df$CHR==j)
        points(x=new_bp[temp_ind], y=-log(manhattan_df$pval1[temp_ind], base=10), pch=20, col=col_even)
        points(x=new_bp[temp_ind], y=log(manhattan_df$pval2[temp_ind], base=10), pch=20, col=col_even)
  }
  axis(1, at=chr_tick_pos, labels=as.character(1:chr_num), col=NA, col.ticks = 1, pos=c(0,0))
  abline(h=0)
  text(x=max(manhattan_df$BP)/2, y=ymax-0.5, labels='Test 1', cex=1.5)
  text(x=max(manhattan_df$BP)/2, y=-ymax+0.5, labels='Test 2', cex=1.5)
  return(p)
  }
