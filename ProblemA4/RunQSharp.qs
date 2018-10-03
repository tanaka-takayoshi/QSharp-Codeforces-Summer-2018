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
            using(qs2 = Qubit[2])
            {
                Solve(qs2);
                DumpMachine($"dump10-11");
                ResetAll(qs2);
            }

            return true;
        }
    }
}