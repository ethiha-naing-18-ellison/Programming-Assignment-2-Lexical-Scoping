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


cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  
  # If inverse is already cached, return it
  if (!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  # Compute the inverse
  data <- x$get()
  m <- solve(data, ...)  # Matrix inversion
  x$setinverse(m)  # Store in cache
  
  m  # Return the inverse
}


a <- diag(5, 3)  # 3x3 identity matrix with 5s
a

CachedMatrix <- makeCacheMatrix(a)  
cacheSolve(CachedMatrix)  # Compute and cache the inverse

b <- diag(2, 6)  # 6x6 identity matrix with 2s
b

CachedMatrix <- makeCacheMatrix(b)
cacheSolve(CachedMatrix)  # Compute and cache the inverse

cacheSolve(CachedMatrix)  # Retrieve cached inverse

