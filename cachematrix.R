################################################################################
# Course: R Programming - JHU, via Coursera
#
#  Assignment 2: "(...) write a pair of functions that cache the inverse 
# of a matrix.".
#
# URL for this file (2014-APR-27) : 
#   https://github.com/dpoet/ProgrammingAssignment2/blob/master/cachematrix.R
#   This file contains a solution that is complete and correct.
################################################################################
#  The two functions: 
#    1) makeCacheMatrix()
#    2) cacheSolve()
#
#  The first function, makeCacheMatrix(), creates a special data structure for 
# dealing with a given matrix 'x' and its inverse, 'invMatrix'.
#
#   The second function, cacheSolve(), takes a structure 'x' created by 
# the makeCacheMatrix() function and returns the corresponding inverse matrix.
################################################################################


# Function makeCacheMatrix()
#   This function creates a special data structure that contains:
#     - data: a matrix 'x' and its inverse matrix 'invMatrix';
#     - functions: used to get/set values from/to the two matrices above.
makeCacheMatrix <- function(x = matrix()) {
    invMatrix <- NULL # Initializes the inverse matrix with a NULL value
    
    #  This function SETs a new value for the 'x' argument. As matrix 'x' 
    # changes, the function also "resets" 'invMatrix' to NULL.
    #  Note the use of the `<<-` operator, so that the correct environment 
    # is searched and used while assigning the new values to the matrices.       
    set <- function(newMatrix){
        x <<- newMatrix
        invMatrix <<- NULL
    }
    
    # This function GETs the current value of the 'x' matrix
    get <- function(){ x }
    
    # This function SETs a new 'invMatrix'    
    # Note the use of the `<<-` operator, so that the correct environment 
    #   is searched and used while assigning the new value to the matrix.        
    setInverse <- function(newInvMatrix){
        invMatrix <<- newInvMatrix         
    }
    
    # This function GETs the current value of 'invMatrix'
    getInverse <- function(){ invMatrix }
    
    #  This last statement returns a list, from which the data and functions can
    # be accessed.
    list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)
}


# Function cacheSolve()
#   This function takes a structure 'x', created by the makeCacheMatrix()
#  function, and returns the corresponding inverse matrix.
cacheSolve <- function(x, ...) {
    #  By using the function 'getInverse' one gets the current value of the 
    # inverse matrix (or NULL, if not yet solved and stored).
    #  If a previously solved inverse matrix is available, it will be used and 
    # the user will be notified.
    cachedInverse <- x$getInverse()           
    if( ! is.null(cachedInverse) ){
        message("Getting cached inverse matrix.")
        result <- cachedInverse
    } else {
        #  If 'getInverse' returns a NULL value, one must solve the inverse 
        # matrix and store it by using the function 'setInverse'.
        
        #  Used this way (with argument matrix 'M' only), the function
        # 'solve()' will return the inverse of matrix 'M'.
        M <- x$get()
        result <- solve(M)
        
        x$setInverse(result)
    }
    
    # This last statement returns the inverse matrix, based on argument 'x'.
    result
}
