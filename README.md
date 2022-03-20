# MATLAB Shortcuts for Linear Algebra

**Usage**:

* Change MATLAB directory to the one containing `MA1508E.m`

* Initialise class instance with `m = MA1508E()`

> Example: To check if a set of vectors S is orthogonal
> $$\begin{pmatrix} 1 & 0 & -2 \\ 1 & 1 & 1 \\ 1 & -1 & 1 \end{pmatrix}$$
>
> Input:
> 
>> `S = [1 0 -2; 1 1 1; 1 -1 1];`
>>
>> `m.isOrthogonalSet(S);`
> 
> Output:
>
>> `The set is orthogonal`