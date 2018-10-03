namespace Solution 
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Extensions.Diagnostics;

    // ------------- Operation which is called from C# -------------------
    operation RunQsharp () : Bool
    {
        body
        {
            for(i in 1..8)
            {
                using(qs = Qubit[i])
                {
                    Solve(qs);
                    DumpMachine($"");
                    ResetAll(qs);
                }
            }
            return true;
        }
    }
}