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
            Message("Hi");
            using(qs2 = Qubit[2])
            {
                Solve(qs2, [false; false]);
                DumpMachine($"dump00");
                ResetAll(qs2);

                Solve(qs2, [true; false]);
                DumpMachine($"dump10");
                ResetAll(qs2);

                Solve(qs2, [false; true]);
                DumpMachine($"dump01");
                ResetAll(qs2);

                Solve(qs2, [true; true]);
                DumpMachine($"dump11");
                ResetAll(qs2);
            }

            using(qs3 = Qubit[3])
            {
                Solve(qs3, [false; false; false]);
                DumpMachine($"dump000");
                ResetAll(qs3);

                Solve(qs3, [false; false; true]);
                DumpMachine($"dump001");
                ResetAll(qs3);

                Solve(qs3, [true; false; false]);
                DumpMachine($"dump100");
                ResetAll(qs3);

                Solve(qs3, [true; false; true]);
                //H(qs3[0]);
                //CNOT(qs3[1],qs3[2]);
                DumpMachine($"dump101");
                ResetAll(qs3);

                Solve(qs3, [false; true; false]);
                DumpMachine($"dump010");
                ResetAll(qs3);

                //Solve(qs3, [false; true; true]);
                H(qs3[1]);
                CNOT(qs3[1],qs3[2]);
                DumpMachine($"dump011");
                ResetAll(qs3);

                Solve(qs3, [true; true; false]);
                //H(qs3[0]);
                //CNOT(qs3[0],qs3[1]);
                DumpMachine($"dump110");
                ResetAll(qs3);

                Solve(qs3, [true; true; true]);
                // H(qs3[0]);
                //CNOT(qs3[0],qs3[1]);
                //CNOT(qs3[1],qs3[2]);
                DumpMachine($"dump111");
                ResetAll(qs3);
            }
            return true;
        }
    }
}