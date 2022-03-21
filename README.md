# MATLAB Shortcuts for Linear Algebra

**Usage**:

* Change MATLAB directory to the one containing `MA1508E.m`

* Initialise class instance:

  `>> m = MA1508E();`

**Example** 

To check if a set of vectors S is orthogonal
<img src="https://latex.codecogs.com/svg.image?\begin{Bmatrix}\begin{pmatrix}&space;1&space;\\&space;1&space;\\&space;1\end{pmatrix},\begin{pmatrix}&space;0&space;\\&space;1&space;\\&space;-1\end{pmatrix},\begin{pmatrix}&space;-2&space;\\&space;1&space;\\&space;1\end{pmatrix}\end{Bmatrix}&space;" title="https://latex.codecogs.com/svg.image?\begin{Bmatrix}\begin{pmatrix} 1 \\ 1 \\ 1\end{pmatrix},\begin{pmatrix} 0 \\ 1 \\ -1\end{pmatrix},\begin{pmatrix} -2 \\ 1 \\ 1\end{pmatrix}\end{Bmatrix} " />

Input:

`>> A = [1 0 -2; 1 1 1; 1 -1 1];`

`>> m.isOrthogonalSet(A);`

Output:

`>> The set is orthogonal`
