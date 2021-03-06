##The first function, makeCacheMatrix, creates a special "matrix", which is really a list containing a function to
## 1.	set the value of the matrix
## 2.	get the value of the matrix
## 3.	set the value of the inverse matrix
## 4.	get the value of the inverse matrix


makeCacheMatrix <- function(x = matrix()) {
  
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) m <<- solve
    getsolve <- function() m
    list(set = set, get = get,
            setsolve = setsolve,
            getsolve = getsolve)
  
  
}


## The following function calculates the inverse of the special "matrix" created with the above function. 
## However, it first checks to see if the inverse of the matrix has already been calculated and if the matrix 
## was identical. If so, it gets the inverse of the matrix from the cache and skips the computation. Otherwise, 
## it calculates the inverse of the matrix and sets the value of the inverse of the matrix in the cache via 
## the setsolve function.

cacheSolve <- function(x, ...) {
  
  
    m <- x$getsolve()
    data <- x$get()
    if((!is.null(m)) & identical(data,x)) {
        message("getting cached data")
        return(m)
    }
  
    m <- solve(data, ...)
    x$setsolve(m)
    m
  
  ## Return a matrix that is the inverse of 'x'
}

