setwd('/Users/andy/Desktop/plot_R')
library(ggplot2)
data = read.table('CNV-31659.sorted.cnr', head = T, sep = '\t', check.names = F)
data$chromosome = factor(data$chromosome, levels = c(paste0('chr', 1:22), 'chrX', 'chrY'))


p = ggplot(data, aes(start, 2*2^data$log2, color = 597))+geom_point(size=0.01, alpha=0.5)+scale_x_discrete(breaks=NULL)+theme_minimal()+theme(legend.position = 'none')+xlab(NULL)+facet_grid(.~chromosome, scale='free', switch = 'x')+labs(title='CNV-31659')+theme(plot.title = element_text(hjust = 0.5,size=14),axis.text=element_text(size=14))+theme(strip.text.x=element_text(size=14))
p+scale_y_continuous(name='Copy Number', limits=c(0,8))

ggsave('newCNV-31659.png', width = 26, height = 3)

