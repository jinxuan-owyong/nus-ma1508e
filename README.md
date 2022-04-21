# MATLAB Shortcuts for Linear Algebra

**Usage**:

- Change MATLAB directory to the one containing `MA1508E.m`

- Initialise class instance:

  ```MATLAB
  >> m = MA1508E();
  ```

**Example**

To check if a set of vectors S is orthogonal
<img src="https://latex.codecogs.com/svg.image?\begin{Bmatrix}\begin{pmatrix}&space;1&space;\\&space;1&space;\\&space;1\end{pmatrix},\begin{pmatrix}&space;0&space;\\&space;1&space;\\&space;-1\end{pmatrix},\begin{pmatrix}&space;-2&space;\\&space;1&space;\\&space;1\end{pmatrix}\end{Bmatrix}&space;" title="https://latex.codecogs.com/svg.image?\begin{Bmatrix}\begin{pmatrix} 1 \\ 1 \\ 1\end{pmatrix},\begin{pmatrix} 0 \\ 1 \\ -1\end{pmatrix},\begin{pmatrix} -2 \\ 1 \\ 1\end{pmatrix}\end{Bmatrix} " />

Input:

```MATLAB
>> A = [1 0 -2; 1 1 1; 1 -1 1];
>> m.isOrthogonalSet(A);
```

Output:

```MATLAB
>> The set is orthogonal
```

| Method                      | Parameters                                                                                                                                                                                                                                                                 | Description                                                                                                                                                                                                               |
| --------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `isOrthogonalSet`           | `S` - Set of vectors in matrix form                                                                                                                                                                                                                                        | Prints whether a set is orthogonal or not                                                                                                                                                                                 |
| `isOrthogonalTo`            | `S` - Set of vectors in matrix form<br />`target` - The vector to be checked                                                                                                                                                                                               | Prints whether `target` is orthogonal to the set `S`                                                                                                                                                                      |
| `orthogonalProj`            | `S` - Set of vectors in matrix form<br />`w` - The vector to be projected                                                                                                                                                                                                  | Returns the orthogonal projection of `w` onto the span of `S`                                                                                                                                                             |
| `toOrthonormalSet`          | `OG` - Orthogonal set of vectors in matrix form                                                                                                                                                                                                                            | Normalises the set of vectors, returns `ON`, the corresponding orthonormal set                                                                                                                                            |
| `dotWithSet`                | `S` - Set of vectors in matrix form<br />`v` - Column vector pith the same number of rows as `S`                                                                                                                                                                           | Returns the dot product between each column of `S` and `v`                                                                                                                                                                |
| `getEigenvalues`            | `A` - The matrix corresponding to the differential system                                                                                                                                                                                                                  | Returns both real and complex eigenvalues corresponding to `A`                                                                                                                                                            |
| `getEigenvector`            | `A` - The matrix corresponding to the differential system<br />`lambda` - An eigenvalue of `A`                                                                                                                                                                             | Returns the eigenvector associated to `lambda`                                                                                                                                                                            |
| `getGeneralisedEigenvector` | `A` - The matrix corresponding to the differential system<br />`lambda` - An eigenvalue of `A`                                                                                                                                                                             | Returns the matrix which gives you the generalised eigenvector                                                                                                                                                            |
| `generateInitialConditions` | `n` - The number of initial conditions of a differential system                                                                                                                                                                                                            | Returns string to be input as initial conditions in `dsolve`<br />_Also a helper function for `solveDifferentialSystem`_                                                                                                  |
| `solveDifferentialSystem`   | `A` - The matrix corresponding to the differential system<br />`isInitial` - Boolean, `false` to obtain general solution of the differential system, `true` for particular solution                                                                                        | Returns a struct containing the solution                                                                                                                                                                                  |
| `generateElemMatrix`        | `str` - Elementary row operation to be performed<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Example:<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;R2 + 0.5R3, 3R1, R4 - 1R2, R2 S R3<br />`n` - The number of rows of the matrix | Returns an elementary matrix, which can be pre-multiplied to a matrix to perform an elementary row operation<br />`A = m.generateElemMatrix("R2 - 1R1", 4) * A`                                                           |
| `performERO`                | `A` - The matrix to perform elementary row operations on                                                                                                                                                                                                                   | While loop takes input from console and validates string. Input must be placed between quotation marks "":<br />`Enter the elementary row operation: "R1 S R2"`<br />Matrix is printed after each operation is performed. |
