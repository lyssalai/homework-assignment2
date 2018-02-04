#This is Exercises 2. Matrices

#1) Suppose:
#$$ A = \begin{bmatrix}
#1 & 1 & 3\\ 
#5 & 2 & 6\\ 
#-2 & -1 & -3
#\end{bmatrix}$$

#(a) Check that $A^3 = \mathbf{0}$  
A <- matrix(c(1,1,3,5,2,6,-2,-1,-3),nrow=3,byrow=TRUE)
A%*%A%*%A

#(b) Replace the third column of A by the sum of the second and third columns
A[,3] <- A[,2]+A[,1]
A

#2) Create the following matrix B with 15 rows:
#$$B = \begin{bmatrix}
#10 & -10 & 10\\
#10 &  -10& 10\\
#\cdots & \cdots  & \cdots \\
#10 & -10 & 10
#\end{bmatrix} $$
B <- matrix(c(rep(10,15),rep(-10,15),rep(10,15)),nrow=15,byrow=FALSE)
B
#Calculate the 3x3 matrix $B^TB$. 
crossprod(B)

#3) Create a 6 x 6 matrix matE with every element equal to 0.
matE <- matrix(rep(0,36),nrow=6,byrow=TRUE)
matE[abs(row(matE)-col(matE))==1] <- 1
matE

#4) Create the following patterned matrix:
#$$\begin{bmatrix}
#0 & 1 & 2 & 3 & 4\\
#1 & 2 & 3 & 4 & 5\\
#2 & 3 & 4 & 5 & 6\\
#3 & 4 & 5 & 6 & 7\\
#4 & 5 & 6 & 7 & 8
#\end{bmatrix} $$
a<-0:4
C <- outer(a,a,"+")
C

#5) Create the following patterned matrices.

#(a)
#$$\begin{bmatrix}
#0 & 1 & 2 & 3 & 4\\
#1 &2 & 3 & 4 & 0\\
#2 & 3 & 4 & 0 & 1\\
#3 & 4 & 0 & 1 & 2\\
#4 & 0 & 1 & 2 & 3
#\end{bmatrix}  $$
b <- 0:4
outer(b,b,"+")%%5

#(b)
#\begin{bmatrix}
#0 & 1 & 2 & 3 & 4 & 5 & 6 & 7 & 8 & 9\\
#1 & 2 & 3 & 4 & 5 & 6 & 7 & 8 & 9 & 0\\
#\vdots  & \vdots & \vdots & \vdots & \vdots & \vdots & \vdots & \vdots & \vdots & \vdots\\
#8 & 9 & 0 & 1 & 2 & 3 & 4 & 5 & 6 & 7\\
#9 & 0 & 1 & 2 & 3 & 4 & 5 & 6 & 7 & 8
#\end{bmatrix} $$
c <- 0:9
outer(c,c,"+")%%10

#(c)
#$$\begin{bmatrix}
#0 & 8 & 7 & 6 & 5 & 4 &3  & 2 & 1\\
#1 & 0 & 8 & 7 & 6 & 5 & 4 & 3 & 2\\
#2 & 1 & 0 & 8 & 7 & 6 & 5 & 4 & 3\\
#3 & 2 & 1 & 0 & 8 & 7 & 6 & 5 & 4\\
#4 & 3 & 2 & 1 & 0 & 8 & 7 & 6 & 5\\
#5 & 4 & 3 & 2 & 1 & 0 & 8 & 7 & 6\\
#6 & 5 & 4 & 3 & 2 & 1 & 0 & 8 & 7\\
#7 & 6 & 5 & 4 & 3 & 2 & 1 & 0 & 8\\
#8 & 7 & 6 & 5 & 4 & 3 & 2 & 1 & 0
#\end{bmatrix} $$
d <- 0:8
outer(d,d,"-")%%9

#6) Solve the following system of linear equations by setting up and solving the matrix equation Ax = y.
#$x_1 + 2x_2 + 3x_3 + 4x_4 + 5x_5 =  7$  
#$2x_1 +  x_2 + 2x_3 + 3x_4 + 4x_5 = -1$  
#$3x_1 + 2x_2 +  x_3 + 2x_4 + 3x_5 = -3$  
#$4x_1 + 3x_2 + 2x_3 +  x_4 + 2x_5 =  5$  
#$5x_1 + 4x_2 + 3x_3 + 2x_4 +  x_5 = 17$ 
Ax <- abs(outer(1:5,1:5,"-"))+1
yVec <- c(7,-1,-3,5,17)
Ax1 <- as.matrix(solve(Ax,yVec))
rownames(Ax1) <- c("x1","x2","x3","x4","x5")
colnames(Ax1) <- c("Values")
Ax1

#7) Create a 6 x 10 matrix of random integers chosen from 1,2,...,10 by executing the following two lines of code:
set.seed(75)
D <- matrix(sample(10, size=60, replace=TRUE), nr=6)

#(a) Find the number of entries in each row which are greater than 4.
apply(D, 1, function(x){sum(x>4)})

#(b) Which rows contain exactly two occurrences of the number seven?
which(apply(D,1,function(y){sum(y==7)==2}))

#(c) Find those pairs of columns whose total (over both columns) is greater than 75.
#The answer should be a matrix with two columns;
#so, for example, the row (1,2) in the output matrix means that the sum of columns 1 and 2 in the original matrix is greater than 75.
#Repeating a column is permitted;
#so, for exalmple, the final output matrix could contain the rows (1,2), (2,1), and (2,2).
<<<<<<< HEAD
which(outer(colSums(D),colSums(D),"+")>75,arr.ind=TRUE)
#What if repetitions are not permitted?
sums <- outer(colSums(D),colSums(D),"+")>75
sums[lower.tri(sums,diag=TRUE)] <- FALSE
which(sums,arr.ind=TRUE)

#8) Calculate:

#(a) $\sum\limits_{i=1}^{20} \sum\limits_{j=1}^5 \frac{i^4}{(3+j)}$
sum(outer((1:20)^4,3+(1:5),"/"))

#(b) $\sum\limits_{i=1}^{20} \sum\limits_{j=1}^5 \frac{i^4}{(3+ij)}$
sum((1:20)^4/(3+outer(1:20,1:5,"*")))

#(c) $\sum\limits_{i=1}^{10} \sum\limits_{j=1}^i \frac{i^4}{(3+ij)}$
sum(outer(1:10,1:10,function(i,j){(i>=j)*i^4/(3+i*j)}))
=======




>>>>>>> 1af6e5a2eb76f499e15ea0d5b0784d051a9e9961

