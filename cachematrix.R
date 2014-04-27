
## Completly based on examples in README

makeCacheMatrix <- function(x = matrix()) {

  ## defining functions for list
  
  inv <- NULL
  set <- function(y) 
    {
    x <<- y
    inv <<- NULL
  }
  
  get <- function() x
  setinv <- function(solve) inv <<- solve
  getinv <- function() inv

  ## creating list of functions
  list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## checking if inverse existing in cache and returning 
## or cached data, or calling function itself

cacheSolve <- function(x, ...) {

  inv <- x$getinv()
  
  if(!is.null(inv)) 
    {
    message("Cached data used")
    return(inv)
  }
  
  data <- x$get()
  inv <- solve(data, ...)
  x$setinv(inv)
  inv
  
}

