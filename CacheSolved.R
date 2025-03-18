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
