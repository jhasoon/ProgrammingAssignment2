## cachematrix.R 
## 
## Caching the Inverse of a Matrix. 
## Matrix Inversion is usually a costly computation and there may be some 
## benefit to caching the inverse of a matrix rather than computing it 
## repeatedly.
## 
## Assignment 2 
##
## Author :   Jean-Claude Hasoon

## The function makeCacheMatrix creates a special "matrix" object that can 
## cache its inverse.
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


## The function cacheSolve computes the inverse of the special "matrix" 
## returned by makeCacheMatrix. If the inverse has already been calculated(
## and the matrix has not changed), then cacheSolve should retrieve the
## inverse from the cache
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	m <- x$getinverse()
	if (!is.null(m)) {
		message("getting cached data")
		return(m)
	}
	data <- x$get()
	m <- solve(data, ...)
	x$setinverse(m)
	m
}
