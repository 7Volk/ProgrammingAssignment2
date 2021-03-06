## Put comments here that give an overall description of what your
## functions do

## 
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Calculates the inverse of the given 'cache matrix' if the value was not 
## calculated before, otherwise returns cached value.
cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if (!is.null(m)) {
    message("Getting cached matrix inverse.")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
