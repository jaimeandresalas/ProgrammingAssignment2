## Put comments here that give an overall description of what your
## functions do
## This function try to calculate the costly computation for
## Function test

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x<<-y
    m<<-NULL
  }
  get <- function()x
  setInv<- function()x
  m<<-solve
  getInv <- function()x
  list(set=set,get=get,setInv=setInv,getInv=getInv)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m<-x$getInv()
  if(!is.null(m)){
    message("minv cached data")
    return(m)
  }
  data<-x$get()
  m<-solve(data,... )
  x$setInv(m)
  m
}

##Test for the results


(A= matrix(rnorm(9),3,3))
# [,1]       [,2]       [,3]
# [1,] 1.5442791 -0.4278944 -0.5667993
# [2,] 0.2047779  1.6090993  0.2676477
# [3,] 1.1110752  0.5955037 -1.5673713

(B <- makeCacheMatrix(A))

# $set
# function(y){
#   x<<-y
#   m<<-NULL
# }
# <bytecode: 0x00000263bc6af320>
#   <environment: 0x00000263bc567c48>
#   
#   $get
# function()x
# <bytecode: 0x00000263b9e1f230>
#   <environment: 0x00000263bc567c48>
#   
#   $setInv
# function()x
# <bytecode: 0x00000263bbec9970>
#   <environment: 0x00000263bc567c48>
#   
#   $getInv
# function()m
# <bytecode: 0x00000263bc782350>
#   <environment: 0x00000263bc567c48>


B$get()
# [,1]       [,2]       [,3]
# [1,] 1.5442791 -0.4278944 -0.5667993
# [2,] 0.2047779  1.6090993  0.2676477
# [3,] 1.1110752  0.5955037 -1.5673713

cacheSolve(B)

