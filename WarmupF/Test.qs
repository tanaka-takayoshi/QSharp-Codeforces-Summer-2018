namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Extensions.Diagnostics;

    operation Test() : () 
    {
        body 
        {
            using(qs = Qubit[2])
            {
                let res = Solve(qs, [false; false], [true;true]);
                Message($"{res}");
                ResetAll(qs);
            }
        }
    }

    operation Generate (qs : Qubit[], index : Int) : () 
    {
        body 
        {
            if (index == 1) 
            {
                X(qs[0]);
            } elif (index == 2)
            {
                X(qs[1]);
            } elif (index == 3) 
            {
                X(qs[0]);
                X(qs[1]);
            }

            H(qs[0]);
            CNOT(qs[0], qs[1]);
        }
    }
}

