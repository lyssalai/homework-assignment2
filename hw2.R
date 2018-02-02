#This is Exercises 2. Matrices

#1) Suppose:
#$$ A = \begin{bmatrix}
#1 & 1 & 3\\ 
#5 & 2 & 6\\ 
#-2 & -1 & -3
#\end{bmatrix}$$

#(a) Check that $A^3 = \mathbf{0}$  
A <- matrix(c(1,1,3,5,2,6,-2,-1,-3),nrow=3,byrow=TRUE)
A^3*0

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
crossprod(B*B)

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
D <- outer(b,b,"+")
