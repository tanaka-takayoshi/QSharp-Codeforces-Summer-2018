﻿namespace Solution 
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Extensions.Diagnostics;
    open Microsoft.Quantum.Extensions.Convert;

    // ------------- Operation which is called from C# -------------------
    operation RunQsharp () : (Int,Int)
    {
        body
        {
            mutable isZero = 0;
            mutable isPlus = 0;
            using(qs = Qubit[1])
            {
                let q = qs[0];
                for(i in 1..1000)
                {
                    let res1 = Solve(q);
                    if (res1 == 0)
                    {
                        set isZero = isZero + 1;
                    }
                    
                    Reset(q);
                }
                for(j in 1..1000)
                {
                    H(q);
                    let res2 = Solve(q);
                    if (res2 == 1)
                    {
                       set isPlus = isPlus + 1;
                    }
                    
                    Reset(q);
                }
            }
            return (isZero, isPlus);
        }
    }
}