namespace Solution 
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Extensions.Diagnostics;
    open Microsoft.Quantum.Extensions.Convert;

    // ------------- Operation which is called from C# -------------------
    operation RunQsharp () : Bool
    {
        body
        {
            using(qs2 = Qubit[2])
            {
                DumpMachine("");
                let res1 = Solve(qs2);
                DumpMachine("");
                Message(ToStringI(res1));
                ResetAll(qs2);
            }

            return true;
        }
    }
}