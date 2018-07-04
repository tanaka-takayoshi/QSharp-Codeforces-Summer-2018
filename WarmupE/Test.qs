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
                Generate(qs, 0);
                mutable res0 = Solve(qs);
                Message($"0: {res0}");
                ResetAll(qs);

                Generate(qs, 1);
                mutable res1 = Solve(qs);
                Message($"1: {res1}");
                ResetAll(qs);

                Generate(qs, 2);
                mutable res2 = Solve(qs);
                Message($"2: {res2}");
                ResetAll(qs);

                Generate(qs, 3);
                mutable res3 = Solve(qs);
                Message($"3: {res3}");
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

