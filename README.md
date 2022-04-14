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

| Method                      | Parameters                                                                                       | Description                                                                    |
| --------------------------- | ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------ |
| `isOrthogonalSet`           | `S` - Set of vectors in matrix form                                                              | Prints whether a set is orthogonal or not                                      |
| `isOrthogonalTo`            | `S` - Set of vectors in matrix form<br />`target` - The vector to be checked                     | Prints whether `target` is orthogonal to the set `S`                           |
| `orthogonalProj`            | `S` - Set of vectors in matrix form<br />`w` - The vector to be projected                        | Returns the orthogonal projection of `w` onto the span of `S`                  |
| `toOrthonormalSet`          | `OG` - Orthogonal set of vectors in matrix form                                                  | Normalises the set of vectors, returns `ON`, the corresponding orthonormal set |
| `dotWithSet`                | `S` - Set of vectors in matrix form<br />`v` - Column vector pith the same number of rows as `S` | Returns the dot product between each column of `S` and `v`                     |
| `getEigenvalues`            | `A` - The matrix corresponding to the differential system                                        | Returns both real and complex eigenvalues corresponding to `A`                 |
| `getEigenvector`            | `A` - The matrix corresponding to the differential system<br />`lambda` - An eigenvalue of `A`   | Returns the eigenvector associated to `lambda`                                 |
| `getGeneralisedEigenvector` | `A` - The matrix corresponding to the differential system<br />`lambda` - An eigenvalue of `A`   | Returns the matrix which gives you the generalised eigenvector                 |
