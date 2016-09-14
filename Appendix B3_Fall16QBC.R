# Data Structures
#single number real = scalar
#B.3.1 Vectors
# vectors are essentially the basic unit of R, a vector may be just a column of scalars
Y <- c(8.3, 8.6, 10.7, 10.8, 11, 11, 11.1, 11.2, 11.3, 11.4)
# an "=" could replace the "<-"
# R has shortcuts for entering a sequence of integers
# examples:
1:4
4:1
-1:3
-(1:3)
#now to specify either units of sequence, or the total length of the sequence
seq(from = 1, to = 3, by = 0.2)
#or
seq(1, 3, by = 0.2)
seq(1,3, length = 7)
# now I can also fill repetitive sequences.
rep(1,3)
rep(1:3, each = 2)
# Getting information about vectors
# R will tell you information about Y
sum(Y)
mean(Y)
max(Y)
length(Y)
summary(Y)
# a vector cou be a character, or logical as well...
Names = c("Sarah", "Yunluan")
b <- c(TRUE, FALSE)
# vectors can also be dates, complex numbers, real numbers, integers, or factors.
class(Y)
class(b)
# I can test whether each element of a vector is greater than a particular value or greather than its mean.
Y > 10
Y > mean(Y)
# test using ">,<,>=,<=,==, != and others
# below is a test to see if a vector is equal to a number
Y == 11
#... not equal
Y != 11
# this will be useful for extracting subsets of data
# Algebra with vectors
a <- 1:3
b = 4:6
a + b
a * b
a/b
a + 1
a * 2
1/a
a * 1:2
a * c(1, 2, 1)
# if we miltiply vectors of length 4 and 2, we get no error, because four is a multple of 2
1:4 * 1:2
1:4 *c(1, 2, 1 ,2)
# Extraction and missing values
# we can extract or subset elements of the vector
# two basic ways: 1) identifying which rows (or columns) I want (i.e. the first row) 
# 2) providing a logical vector (of TRUE or FLASE's) of the same length as the vector I am subsetting. 
# method 1:
Y[1]
Y[1:3]
# use of logical
Y > mean(Y)
# below I will get back all the values that are TURE
Y[Y > mean(y)]
Y[Y > mean(Y)]
# R takes missing data seriously
a = c(5, 3, 6, NA)
a
is.na(a)
!is.na(a)
a[!is.na(a)]
na.exclude(a)
mean(a)
# ^ this did not work because of the missing data
mean(a, na.rm = TRUE)
d = na.exclude(a)
mean(d)
# ^ the two above are easy solutions to excluding missing data
# Matrices
# a matrix is a two dimensional set of elements (all elements are the same type)
matrix(letters[1:4], ncol =2)
m = matrix(1:4, nrow = 2)
# not how the matrix is filled by columns, or "column major order". WE also do it by rows...
m2 = matrix(1:4, nrow = 2, byrow = TRUE)
# matrix with 1s on the diagonal...
i = diag(1, nrow = 2)
# identity matrix
minv = solve(m)
m %*% minv
# QR decomposition is available (e.g., qr.solve())
# Extraction in matricies
# I extract elements of matricies in the same fashion as vectors, but specificy both rows and columns.
m[1,2]
m[1, 1:2]
# if I leave either rows or columns blank, R returns all rows (or columns).
m[, 2]
m[, ]
# **skip simple matric algebra
# Data Frames
# two dimensional, a little like spreadsheets and matricies
# each column can be a different type
dat <- data.frame(species = c("S. altissima", "S. rugosa", "E. graminifolia", "A. pilosus"), treatment = factor(c("Control", "Water", "Control", "Water")), height = c(1.1, 0.8, 0.9, 1), width = c(1, 1.7, 0.6, 0.2))
# we can extract data from the data frames just the way we can from matrices
dat[2, ]
dat[3, 4]
# I can test elements in data frames, as here where I yest whether I test whether each element column 2 in "Water." I then use that to extract rows of data that are associated with theis criterion.
dat[, 2] == "Water"
dat[dat[, 2] == "Water", ]
# I could also use the subset function
subset(dat, treatment == "Water")
# Factors
# factors are a class of data; as they could belong above with out discussion of character and logical and numeric vectors. 
# When defining a foctor, R by default orders the foctor levels in alphabetic order -- we canreorder them as we like....
c("Control", "Medium", "High")
rep(c("Control", "Medium", "High"), each = 3)
Treatment <- factor(rep(c("Control", "Medium", "High"), each = 3))
# note that R orders the foctor alphabetically. This mar be relevant when or if we plot it
levels(Treatment)
stripchart(1:9 ~ Treatment)
# Lists
# a list is a collection of other objects kept together in a hierachical structure. Each component of the list can be a complete different class of objects. Leggo!
my.list <- list(My.Y = Y, b = b, Names, Weed.data = dat, My.matrix = m2, my.no = 4)
my.list
# In addition, lists can be nested within other lists.
#NOTE: if we do not specify a name for a component, we can still extract it using the number of the component.
# you can extract list components in several ways, including by name, and by number **(see?'[' for more information)
my.list[["b"]]
my.list[[2]]
# if using a name..
my.list[["b"]]
my.list$b
# if by number...
my.list[1:2]
# note that you can extract a subset of one component.
my.list[["b"]][1]
# Data frames are also lists. YOu can also think of a data frame as a list of columns of identical length. I like to extract columns the same way -- by name.
mean(dat$height)
