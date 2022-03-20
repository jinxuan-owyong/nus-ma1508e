# MATLAB Shortcuts for Linear Algebra

**Usage**:

* Change MATLAB directory to the one containing `MA1508E.m`

* Initialise class instance with `m = MA1508E()`

> Example: To check if a set of vectors S is orthogonal
> <img src="https://latex.codecogs.com/svg.image?\begin{pmatrix}&space;1&space;&&space;0&space;&&space;-2&space;\\&space;1&space;&&space;1&space;&&space;1&space;\\&space;1&space;&&space;-1&space;&&space;1&space;\end{pmatrix}" title="https://latex.codecogs.com/svg.image?\begin{pmatrix} 1 & 0 & -2 \\ 1 & 1 & 1 \\ 1 & -1 & 1 \end{pmatrix}" />
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
