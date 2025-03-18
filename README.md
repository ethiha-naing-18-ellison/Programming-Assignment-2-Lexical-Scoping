# Programming-Assignment-2-Lexical-Scoping

Programming Assignment 2: Caching the Inverse of a Matrix
Objective
Matrix inversion is usually a costly computation. This assignment provides a method to cache the inverse of a matrix instead of recomputing it every time. The implementation consists of two functions:

makeCacheMatrix: Creates a special "matrix" object that stores a matrix and caches its inverse.
cacheSolve: Computes the inverse of the special "matrix". If the inverse has already been computed, it retrieves it from cache instead of recalculating.
Implementation Details
1. makeCacheMatrix
This function creates a special matrix object that can cache its inverse.

set(y): Assigns a new matrix y and resets the cached inverse.
get(): Retrieves the stored matrix.
setinverse(inverse): Stores the inverse in cache.
getinverse(): Retrieves the cached inverse.
Code:
r
Copy
Edit
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL  # Initialize the cache variable
    
    set <- function(y) {
        x <<- y
        m <<- NULL  # Reset cache when a new matrix is assigned
    }
    
    get <- function() x  # Retrieve the stored matrix
    
    setinverse <- function(inverse) m <<- inverse  # Store inverse in cache
    
    getinverse <- function() m  # Retrieve cached inverse
    
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}
2. cacheSolve
This function computes the inverse of the special matrix created by makeCacheMatrix.

If the inverse is already cached, it retrieves it.
Otherwise, it computes the inverse, stores it, and returns the result.
Code:
r
Copy
Edit
cacheSolve <- function(x, ...) {
    m <- x$getinverse()  # Retrieve cached inverse
    
    if (!is.null(m)) {  # If cached inverse exists, return it
        message("getting cached data")
        return(m)
    }
    
    data <- x$get()  # Get the matrix
    m <- solve(data, ...)  # Compute the inverse
    x$setinverse(m)  # Cache the computed inverse
    
    m  # Return the inverse
}

Example Execution
The following example demonstrates caching behavior:

# Create a 3x3 diagonal matrix
a <- diag(5, 3)
a
Matrix a:
#      [,1] [,2] [,3]
# [1,]    5    0    0
# [2,]    0    5    0
# [3,]    0    0    5

Step 1: Create Cached Matrix

CachedMatrix <- makeCacheMatrix(a)

Step 2: Compute and Cache the Inverse

cacheSolve(CachedMatrix)
Inverse of a:
#      [,1] [,2] [,3]
# [1,]  0.2  0.0  0.0
# [2,]  0.0  0.2  0.0
# [3,]  0.0  0.0  0.2

Step 3: Retrieve Cached Inverse

cacheSolve(CachedMatrix)  # Should return cached inverse
Output:
getting cached data

#      [,1] [,2] [,3]
# [1,]  0.2  0.0  0.0
# [2,]  0.0  0.2  0.0
# [3,]  0.0  0.0  0.2


Example 2: 6x6 Matrix

b <- diag(2, 6)
b
Matrix b:

#      [,1] [,2] [,3] [,4] [,5] [,6]
# [1,]    2    0    0    0    0    0
# [2,]    0    2    0    0    0    0
# [3,]    0    0    2    0    0    0
# [4,]    0    0    0    2    0    0
# [5,]    0    0    0    0    2    0
# [6,]    0    0    0    0    0    2

Step 1: Create Cached Matrix

CachedMatrix <- makeCacheMatrix(b)
Step 2: Compute and Cache the Inverse

cacheSolve(CachedMatrix)
Inverse of b:

#      [,1] [,2] [,3] [,4] [,5] [,6]
# [1,]  0.5  0.0  0.0  0.0  0.0  0.0
# [2,]  0.0  0.5  0.0  0.0  0.0  0.0
# [3,]  0.0  0.0  0.5  0.0  0.0  0.0
# [4,]  0.0  0.0  0.0  0.5  0.0  0.0
# [5,]  0.0  0.0  0.0  0.0  0.5  0.0
# [6,]  0.0  0.0  0.0  0.0  0.0  0.5

Step 3: Retrieve Cached Inverse

cacheSolve(CachedMatrix)  # Should return cached inverse
Output:

getting cached data
#      [,1] [,2] [,3] [,4] [,5] [,6]
# [1,]  0.5  0.0  0.0  0.0  0.0  0.0
# [2,]  0.0  0.5  0.0  0.0  0.0  0.0
# [3,]  0.0  0.0  0.5  0.0  0.0  0.0
# [4,]  0.0  0.0  0.0  0.5  0.0  0.0
# [5,]  0.0  0.0  0.0  0.0  0.5  0.0
# [6,]  0.0  0.0  0.0  0.0  0.0  0.5

Final Notes
Efficient caching: The function avoids recomputation.
Utilizes lexical scoping: Uses <<- to modify variables outside the local function scope.
Works with any invertible matrix.
