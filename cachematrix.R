## These R functions are able to cache time-consuming computation: matrix inversion. 
## If the inverse has already been calculated and in memory, then
## the function will retrieve the inverse from the cache instead of computing it again
## to save running time.

## The first function includes a list of functions to get the value of the matrix, set
## the value of the matrix inverse and get the value of the matrix inverse.

makeCacheMatrix <- function(x = matrix()) {
  cachedinverse <- NULL
  ## Null the value of the inverse 
  getmatrix <- function() x
  ## Return the matrix stored in the main function: makeCacheMatrix
  setinverse <- function(solution) cachedinverse <<- solution
  ## Store the value of the newly-calculated inverse into the main function
  getinverse <- function() cachedinverse
  ## Return the inverse stored in the main function
  list(getmatrix = getmatrix, setinverse = setinverse, getinverse = getinverse)
  ## Store the 4 functions in the main function
}



## The second function checks to see if the inverse has already been calculated.
## If so, it gets the inverse from the cache and skips the computation.
## If not, it calculates the inverse of the matrix and sets the value of the inverse
## in the cache via the setinverse function for the future use.

cacheSolve <- function(x, ...) {
  solution <- x$getinverse()
  if(!is.null(solution)){
    message ("getting cached value")
    return(solution)
    ## Check if the inverse exists and is not NULL.
    ## If it exists in memory, it simly returns a message
    ## and return the inverse.
  }
  MATRIX <-x$getmatrix()
  solution <-solve(MATRIX, ...)
  x$setinverse(solution)
  solution
  ## if the inverse is NULL, then MATRIX gets the matrix stored with makeCacheMatrix,
  ## solution calculates the inverse of the matrix and x$setinverse stors it.
}
