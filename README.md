# MATLAB for Linear Algebra

## Setup 

```sh
git clone https://github.com/jinxuan-owyong/nus-ma1508e.git
cd nus-ma1508e
matlab MA1508E.m
```

## Usage

Initialise class instance:

  ```MATLAB
  m = MA1508E();
  ```

Call the desired [method](#methods)

  ``` MATLAB
  m.leftInverse(A);
  ```
  
**Example**

$$S = \begin{Bmatrix} \begin{pmatrix} 1 \\\ 1 \\\ 1 \end{pmatrix},\begin{pmatrix} 0 \\\ 1 \\\ -1 \end{pmatrix},\begin{pmatrix} -2 \\\ 1 \\\ 1 \end{pmatrix}\end{Bmatrix}$$

To check if a set of vectors S is orthogonal

Input:

```MATLAB
A = [1 0 -2; 1 1 1; 1 -1 1];
m.isOrthogonalSet(A);
```

Output:

```
The set is orthogonal
```

## Methods

**Chapter 1: Linear Systems**
| Method                                    | Parameters                                                                                                                                      | Description                                                                                                                                                                                                                  |
| ----------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `isValidERO`                              | `str` - String containing the elementary row operation                                                                                          | Returns true if `str` follows the required syntax, false otherwise                                                                                                                                                           |
| `generateElemAdd`<br />`generateElemSwap` | `data` - Struct containing the elementary row operation                                                                                         | Returns the elementary matrix corresponding to the elementary row operation                                                                                                                                                  |
| `generateElemMatrix`                      | `str` - Elementary row operation to be performed<br />(Example: R2 + 0.5R3, 3R1, R4 - 1R2, R2 S R3)<br />`n` - The number of rows of the matrix | Returns an elementary matrix, which can be pre-multiplied to a matrix to perform an elementary row operation<br />`>> A = m.generateElemMatrix("R2 - 1R1", 4) * A`                                                           |
| `performERO`                              | `A` - The matrix to perform elementary row operations on                                                                                        | While loop takes input from console and validates string. Input must be placed between quotation marks "":<br />`>> Enter the elementary row operation: "R1 S R2"`<br />Matrix is printed after each operation is performed. |

**Chapter 2: Matrices**
| Method         | Parameters                  | Description                                                                               |
| -------------- | --------------------------- | ----------------------------------------------------------------------------------------- |
| `leftInverse`  | `A` - m x n matrix to check | Returns left inverse of A if it exists<br />Condition: m > n for left inverse to exist.   |
| `rightInverse` | `A` - m x n matrix to check | Returns right inverse of A if it exists<br />Condition: m < n for right inverse to exist. |

**Chapter 5: Orthogonal Projection**
| Method             | Parameters                                                                                       | Description                                                                    |
| ------------------ | ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------ |
| `isOrthogonalSet`  | `S` - Set of vectors in matrix form                                                              | Prints whether a set is orthogonal                                             |
| `isOrthonormalSet` | `S` - Set of vectors in matrix form                                                              | Prints whether a set is orthonormal                                            |
| `isOrthogonalTo`   | `S` - Set of vectors in matrix form<br />`target` - The vector to be checked                     | Prints whether `target` is orthogonal to the set `S`                           |
| `toOrthonormalSet` | `OG` - Orthogonal set of vectors in matrix form                                                  | Normalises the set of vectors, returns `ON`, the corresponding orthonormal set |
| `dotWithSet`       | `S` - Set of vectors in matrix form<br />`v` - Column vector pith the same number of rows as `S` | Returns the dot product between each column of `S` and `v`                     |
| `orthogonalProj`   | `S` - Set of vectors in matrix form<br />`w` - The vector to be projected                        | Returns the orthogonal projection of `w` onto the span of `S`                  |
| `gramSchmidt`      | `v` - The basis to be converted into an orthonormal basis                                        | `u` - The corresponding orthonormal basis<br /> `r` - Not in use               |
| `calcLSS`          | `A` - The matrix to calculate the least squares solution<br />`b` - The column vector            | Returns the general least square solution to Ax = b                            |

**Chapter 6: Diagonalisation**
| Method                      | Parameters                                                                                                                                                       | Description                                                                |
| --------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| `getEigenvalues`            | `A` - The matrix corresponding to the differential system                                                                                                        | Returns both real and complex eigenvalues corresponding to `A`             |
| `getEigenvector`            | `A` - The matrix corresponding to the differential system<br />`lambda` - An eigenvalue of `A`<br />`output` - Show steps to obtain eigenvector (Default = true) | Returns the basis for the eigenspace associated to `lambda`                |
| `isAssociatedEigenvalue`    | `A` - The matrix corresponding to the differential system<br />`lambda` - Eigenvalue to verify                                                                   | Returns true if lambda is an eigenvalue associated to `A`, false otherwise |
| `getGeneralisedEigenvector` | `A` - The matrix corresponding to the differential system<br />`lambda` - An eigenvalue of `A`                                                                   | Returns the matrix which gives you the generalised eigenvector             |

**Chapter 7: System of Linear Differential Equations**
| Method                      | Parameters                                                                                                                                                                          | Description                                                  |
| --------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| `generateInitialConditions` | `n` - The number of initial conditions of a differential system                                                                                                                     | Returns string to be input as initial conditions in `dsolve` |
| `solveDifferentialSystem`   | `A` - The matrix corresponding to the differential system<br />`isInitial` - Boolean, `false` to obtain general solution of the differential system, `true` for particular solution | Returns a struct containing the solution                     |
