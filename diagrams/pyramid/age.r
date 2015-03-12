source("diagrams/pyramid/pyramid.r")

age_pyramid <- function() {
  par(mai=c(0.2,0.1,0.2,0.1),omi=c(0.75,0.2,0.85,0.2),mfcol=c(1,2),cex=0.75,
	family="Lato Light",las=1)

  # Daten einlesen und Grafik vorbereiten

  frauen<-read.csv("data/frauen.txt",header =F,sep=",")
  for(i in 1:111) colnames(frauen)[i]<-paste("x",i+1949,sep="")
  maenner<-read.csv("data/maenner.txt",header =F,sep=",")
  for(i in 1:111) colnames(maenner)[i]<-paste("x",i+1949,sep="")

  fueberschuss<-(frauen$x1970-maenner$x1970)
  fueberschuss[fueberschuss < 0]<-0
  mueberschuss<-(maenner$x1970-frauen$x1970)
  mueberschuss[mueberschuss < 0]<-0

  rechts<-data.frame(frauen$x1970-fueberschuss,fueberschuss)
  links<-data.frame(maenner$x1970-mueberschuss,mueberschuss)

  pyramid(rechts, links)

  mtext("1970",3,line=0,adj=0.5,cex=1,font=3)

  fueberschuss<-(frauen$x2010-maenner$x2010)
  fueberschuss[fueberschuss < 0]<-0
  mueberschuss<-(maenner$x2010-frauen$x2010)
  mueberschuss[mueberschuss < 0]<-0

  rechts<-data.frame(frauen$x2010-fueberschuss,fueberschuss)
  links<-data.frame(maenner$x2010-mueberschuss,mueberschuss)

  pyramid(rechts, links)
  mtext("2010",3,line=0,adj=0.5,cex=1,font=3)

  # Betitelung

  mtext("Altersaufbau der Bevölkerung in Deutschland",3,line=2,adj=0,cex=2.25,family="Lato Black",outer=T)
  mtext("alle Angaben in Tausend je Altersjahr",3,line=-0.5,adj=0,cex=1.25,font=3,outer=T)
  mtext("Quelle: www.destatis.de/bevoelkerungspyramide/",1,line=2,adj=1.0,cex=0.95,font=3,outer=T)
  mtext("Äußere hervorgehobener Bereiche: Frauen- bzw. Männerüberschuss",1,line=2,adj=0,cex=0.95,font=3,outer=T)
}
