
# this function makes the inverse matrix
makeCacheMatrix <- function (x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function()x
  setinv <- function(inverse) inv <<- inverse
  getinv <- function() inv
  list (set = set, get = get, setinv=setinv, getinv=getinv)
}

# this function caches the data
cacheSolve <- function(x, ...){
  inv <- x$getinv ()
  if(!is.null(inv)){
    message("getting cached data")
    return (inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setinv(inv)
  inv
  
}