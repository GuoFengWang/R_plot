setwd('/Users/andy/Desktop/plot_R')
library(ggplot2)
data = read.table('17A020980.sorted.cnr', head = T, sep = '\t', check.names = F)
data$chromosome = factor(data$chromosome, levels = c(paste0('chr', 1:22), 'chrX', 'chrY'))
p = ggplot(data, aes(start, 2*2^data$log2, color = chromosome))+geom_point()+scale_x_discrete(breaks=NULL)\
+theme_minimal()+theme(legend.position = 'none')+xlab(NULL)+facet_grid(.~chromosome, scale='free')
p+scale_y_continuous(name='Copy Number', limits=c(0,8))
ggsave('test3.png', width = 26, height = 2)
