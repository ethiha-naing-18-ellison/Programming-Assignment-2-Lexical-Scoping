makeCacheMatrix <- function(x = matrix()) {
  m <- NULL  # Initialize cached inverse as NULL
  
  # Function to set the matrix
  set <- function(y) {
    x <<- y
    m <<- NULL  # Reset cached inverse
  }
  
  # Function to get the matrix
  get <- function() x
  
  # Function to set the inverse of the matrix
  setinverse <- function(inverse) m <<- inverse  
  
  # Function to get the cached inverse
  getinverse <- function() m
  
  # Return a list of functions
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}
