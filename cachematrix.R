## Put comments here that give an overall description of what your
## functions do

## This is to create a special object to cache inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  
  ## Create inverse variable
  inverse_matrix <- NULL

  ## Set the matrix method
  Set <- function(matrix){
    regular_matrix <<- matrix
    inverse_matrix <<- NULL
  }
  
  ## Return the matrix method
  Get <- function(){
    regular_matrix
  }
  
  ## Set matrix to inverse
  SetInverse <- function(inverse){
    inverse_matrix <<- inverse
  }
  
  ## Get inverse matrix
  GetInverse <- function(inverse){
    inverse_matrix
  }
  
  list(Set = Set, Get = Get,
       SetInverse = SetInverse,
       GetInverse = GetInverse)
}


cacheSolve <- function(x, ...) {
  ## Getting the Inverse from object
  inverse_m <- x$GetInverse()
  
  ## If the inverse already been set, then return the result
  if( !is.null(inverse_m) ) {
    message("getting cached data")
    return(inverse_m)
  }
  
  ## Get the matrix from object
  data <- x$Get()
  
  ## Calculate the inverse using matrix multiplication
  inverse_m <- solve(data) %*% data
  
  ## Set the inverse to the object
  x$SetInverse(inverse_m)
  
  ## Return the matrix
  m
}
