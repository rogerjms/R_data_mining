par(las=1)
plot(0,0,xlim=c(0,10*nrow(volcano)),ylim=c(0,10*ncol(volcano)),
type="n",xlab="Metres West",
ylab="Metres North",main="Topography of Maunga Whau Volcano")
u<-par("usr")
rect(u[1],u[3],u[2],u[4],col="lightgreen")
contour(x=10*1:nrow(volcano),y=10*1:ncol(volcano),
volcano,col="red",add=TRUE)



#filled 
filled.contour(x = 10*1:nrow(volcano),y = 10*1:ncol(volcano),
z = volcano, color.palette = terrain.colors,
plot.title = title(main = "The Topography of Maunga Whau",
xlab = "Meters North",ylab = "Meters West"),
plot.axes = {axis(1, seq(100, 800, by = 100))
axis(2, seq(100, 600, by = 100))},
key.title = title(main="Height\n(meters)"),
key.axes = axis(4, seq(90, 190, by = 10)))