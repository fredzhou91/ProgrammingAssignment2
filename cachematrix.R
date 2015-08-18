
###======== clear space =============
rm(list = ls())

## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function



## FUNCTION PART

## 1. makeCacheMatrix which will create global variable Inv and CacheMatrix to store
##    the matrix also the invert matrix. The Global variable is accessed by '<<-' ,
##    also returns a list with 4 functions for maniplation of cache matrix.

makeCacheMatrix <- function(Matrix = numeric()) {
    Inv <<- NULL
    CacheMatrix <<- NULL			###Create global variant Mat Inv
    setMatrix <- function(Matrix) {
        CacheMatrix <<- Matrix
        Inv <<- NULL
    }
    getMatrix <- function() CacheMatrix
    setInverse <- function(NewInv) Inv <<- NewInv
    getInverse <- function() Inv
    list(setMatrix = setMatrix, getMatrix = getMatrix,
    setInverse = setInverse,
    getInverse = getInverse)
}




## 2. cacheSolve will utilize the cache function defined in the makeCacheMatrix to
##    calcualte, store and fetch the invert matrix.


cacheSolve <- function(Matrix, ...) {
    currentInv <- Cachefun$getInverse()
    if(!is.null(currentInv)) {
        message("!!!!!!!Getting CACHED inverted matrix!!!!!!!")
        return(currentInv)
    }
    else {
        data <- Cachefun$getMatrix()
        currentInv <- solve(Matrix, ...)
        Cachefun$setInverse(currentInv)
        currentInv
    }
    =======
    ## Write a short comment describing this function
    
    cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

    }
    
    
    
    
    
## MAIN BODY FOR JOB display
    
    
###======= Import function ==========
##source('makeCacheMatrix.R')
##source('cacheSolve.R')
Cachefun=makeCacheMatrix()
    
###===== Generate matrix =============
    
dim=2000;
mat=matrix(dim*rnorm(dim*dim), dim)
    
    
###==== 1st calculation and cache ====
    
    
system.time(Invmat<-cacheSolve(mat))
    
###==== Call cacheSolve again and ====
###==== Compare execute time =========
    
system.time(Invmat2<-cacheSolve(mat))
    
###======== Compare results ==========
diff=Invmat2-Invmat
str(diff)
    
    
