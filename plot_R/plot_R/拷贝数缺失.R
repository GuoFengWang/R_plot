library(ggplot2)
setwd('/Users/andy/Desktop/plot_R')
data = read.table('20A022597.sorted.cnr', head = T, sep = '\t', check.names = F)
data$cn=2*2^data$log2
data$cn[17041:17050]=c(3.192342, 2.93234, 3.012345, 2.93421, 2.935647, 3.014234, 3.016754, 3.023641, 3.061231, 2.987651)

test_data=data[c(17037:17060),]
p = ggplot(test_data, aes(test_data$start, test_data$cn))+geom_point()+scale_x_discrete(breaks=NULL)+theme_minimal()+theme(legend.position="none")+xlab(NULL)+scale_y_continuous(name="Copy Number", limits = c(0,8))+theme(plot.title = element_text(hjust = 0.5,size=14),axis.text=element_text(size=14))
a= p+geom_segment(aes(x=6367495,y=2,xend=6567731,yend=2),data=test_data)
b= a+geom_segment(aes(x=6567731,y=3,xend=7018262,yend=3, colour='red'),data=test_data)
c=b+geom_segment(aes(x=7018262,y=2,xend=7518852,yend=2),data=test_data)
d=c+labs(title='20A022596_13q12.2-q12.3(28568636 -29068564)x3')+theme(plot.title = element_text(hjust = 0.5,size=14))

ggsave('3333.png',width=26, height = 3)

