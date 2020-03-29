## The functions below create a special matrix and calculate its inverse
## the functions use caching to save on computing and time cost

## this function creates a special matrix which can cache its inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  
  inv <- NULL
  
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  get <- function() {
    x
  }
  
  set_inverse <- function(inverse) {
    inv <<- inverse
  }
  
  get_inverse <- function() {
    inv
  }
  
  list(set = set, get = get,
       set_inverse = set_inverse,
       get_inverse = get_inverse)

}


## the below function computes the inverse of the matrix returned by the
## above function. It checks if the inverse has already been calculated,
## if so then it uses the cache instead of computing it

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$get_inverse()
  
  # if it has been already computed (in cache)
  if(!is.null(inv)) {
    return(m)
  }
  
  # else
  data <- x$get()
  inv <- solve(data) %*% data
  
  x$set_inverse(inv)
  
  inv
}
