library(igraph)
#用graph去创建网络
g1 <- graph.empty()
g2 <- graph( c(1,2,2,3,3,4,5,6), directed=FALSE )
g5 <- graph.star(10, mode="out")
g6 <- graph.lattice(c(5,5,5))
g7 <- graph.lattice(length=5, dim=3)
g8 <- graph.ring(10)
g9 <- graph.tree(10, 2)
g10 <- graph.full(5, loops=TRUE)
g11 <- graph.full.citation(10)
g12 <- graph.atlas(sample(0:1252, 1))
el <- matrix( c("foo", "bar", "bar", "foobar"), nc=2, byrow=TRUE)
g13 <- graph.edgelist(el)
g15 <- graph.extended.chordal.ring(15, matrix(c(3,12,4,7,8,11), nr=2))
class(g5)

g=graph.empty(n=10)
f <- graph.full(3)
f <- graph.full(3, directed=TRUE)
f <- graph.full(6, directed=TRUE)
plot(f)

is.directed(graph.full(10))

#Stars and Rings


#Lattices


l1 <- graph.lattice(length=5, dim=2)
l2 <- graph.lattice( c(5,5) )

#tree
graph.tree()
#create
g1 <- graph( c( 0,1, 1,2, 2,2, 2,3 ), directed=FALSE )
g1 <- graph( c( 0,1, 1,2, 2,2, 2,3 ), n=10,directed=FALSE )
g1 <- graph( c(1,2, 2,2, 2,3 ),n=10,directed=FALSE )


M <- matrix( runif(100), nr=10 )
graph.adjacency( M >= 0.9 )

data <- edit(data.frame())
g <- graph.data.frame(data, directed=FALSE)
 V(g)$name
 E(g)$weight
 
traits <- read.csv("traits.csv", head=FALSE)
rel <- read.csv("relations.csv", head=FALSE)
library(igraph)
g <- graph.empty()
g <- add.vertices(g, nrow(traits), 
                     name=as.character(traits[,1]), age=traits[,2],
                     gender=as.character(traits[,3]))
V(g)$name
V(g)$age
V(g)$gender
names <- sapply(strsplit(V(g)$name, " "), "[",1)
ids <- 1:length(names)-1
names(ids) <- names
ids
from <- as.character(rel[,1])
to <- as.character(rel[,2])
edges <- matrix(c(ids[from], ids[to]), nc=2)
edges
g <- add.edges(g, t(edges), room=as.character(rel[,3]),friend=rel[,4],advice=rel[,5])#error 
g



#随机图
g <- erdos.renyi.game(100, 2/100)
plot(g, layout=layout.fruchterman.reingold, 
         vertex.size=3,frame=TRUE)
		 
#导入导出图


read.graph("graph.txt", format="edgelist")

g <- read.graph("graph.ncol", format="ncol")
g


#点和边的操作
g <- graph.ring(10)
V(g)
E(g)
#smart indexing
g <- barabasi.game(100)
V(g)[ degree(g) > 5 ]
V(g) [ degree(g) > 5 ] [ 0:9 ]
#点和边的属性error
g <- graph.lattice( c(10,10) )
E(g)$weight <- runif(ecount(g))
E(g)$color <- "grey"
E(g)[ weight > 0.9 ]$color <- "red"
plot(g, layout=layout.kamada.kawai,
       edge.color=E(g)$color, vertex.size=3, edge.width=2, label.dist=0.6)
#> 
g <- graph.ring(10)
V(g)$color <- c("red", "blue")
plot(g, layout=layout.circle, vertex.color=V(g)$color)

