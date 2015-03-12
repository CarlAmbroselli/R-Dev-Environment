# inc_pyramide.r

pyramid <- function(rechts, links){
  mark_rechts<-rechts
  mark_rechts[!(rownames(mark_rechts) %in% seq(10,90,by=10)),]<-0
  mark_links<-links
  mark_links[!(rownames(mark_links) %in% seq(10,90,by=10)),]<-0

  farbe_rechts_aussen<-rgb(255,0,210,50,maxColorValue=255)
  farbe_rechts_innen<-rgb(255,0,210,120,maxColorValue=255) 
  farbe_links_innen<-rgb(191,239,255,220,maxColorValue=255)
  farbe_links_aussen<-rgb(191,239,255,100,maxColorValue=255)

  farbe_rechts<-c(farbe_rechts_innen,farbe_rechts_aussen)
  farbe_links<-c(farbe_links_innen,farbe_links_aussen)

  b1<-barplot(t(rechts),axes=F,horiz=T,axis.lty=0,border=NA,col=farbe_rechts,
    xlim=c(-750,750))
  b2<-barplot(-t(links),axes=F,horiz=T,axis.lty=0,border=NA,col=farbe_links,
    xlim=c(-750,750),add=T)

  barplot(t(mark_rechts),axes=F,horiz=T,axis.lty=0,border=NA,col=farbe_rechts,
    xlim=c(-750,750),add=T)
  barplot(-t(mark_links),axes=F,horiz=T,axis.lty=0,border=NA,col=farbe_links,
    xlim=c(-750,750),add=T)

  abline(v=0,lwd=25,col=par("bg"))
  mtext(abs(seq(-600,600,by=200)),at=seq(-600,600,by=200),1,line=-1,cex=0.80)
  for (i in seq(10,90,by=10)) text(0,i+i*0.2,i,cex=1.1)

  mtext("Männer",3,line=0,adj=0.25,cex=1.5,col="grey")
  mtext("Frauen",3,line=0,adj=0.75,cex=1.5,col="grey")
}
