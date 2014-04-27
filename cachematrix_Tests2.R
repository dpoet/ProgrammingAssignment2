message("Beginning tests.")

# Sources the solution file
source("cachematrix.R")

# Creates matrices A and B
message("Matrix 'A':")
A <- matrix(rnorm(10000), 100, 100); A;
message("Matrix 'B':")
B <- matrix(rnorm(10000),100,100); B;

# Creates a new structure via makeCacheMatrix and assigns it to 'm1'
m1 <- makeCacheMatrix(A)
message("Get stored matrix:")
m1$get()

message("Is the stored matrix identical to matrix 'A'?")
identical(m1$get(), A)

message("The inverse matrix has not yet been solved and should be equal to NULL, by now:")
m1$getInverse()

message("Let's now solve the inverse matrix...")
cacheSolve_proto(m1)

message("Done. The inverse matrix should not be NULL anymore:")
m1$getInverse()

message("If one tries to solve the inverse matrix again, she/he should get the cached inverse matrix. Let's try once:")
cacheSolve_proto(m1)
message("Let's try it again:")
cacheSolve_proto(m1)

message("Now what happens if we set another matrix? Say, matrix 'B' instead of 'A'.")
message("Before, let's check the values we have by now. The inverse matrix is:")
m1$getInverse()

message("The stored matrix should be identical to matrix 'A':")
identical(m1$get(), A)

message("Now we set a new matrix: 'B'. So 'B' replaces 'A'.")
m1$set(B)
message("Then, the stored matrix should not be identical to matrix 'A' anymore. Is it identical to 'A'?")
identical(m1$get(), A)
message("Whenever we set a new matrix, the inverse matrix should be set to NULL. What's the inverse matrix by now?")
m1$getInverse()

message("OK. So let's solve the inverse matrix of the new stored matrix (which is 'B'):")
cacheSolve(m1)
message("OK. The inverse matrix is not NULL anymore. Let's call cacheSolve() two more times:")
cacheSolve(m1)
cacheSolve(m1)

message("End of tests.")
