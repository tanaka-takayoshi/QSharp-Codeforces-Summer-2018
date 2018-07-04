namespace Solution
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Extensions.Diagnostics;

    operation Test() : () 
    {
        body 
        {
            using (register = Qubit[1])
            {
                let q = register[0];
                DumpMachine("dump-initial.txt");

                Solve(q,-1);
                DumpMachine("dump-0.txt");
                Reset(q);

                Solve(q,1);
                DumpMachine("dump-1.txt");
                Reset(q);
            }
        }
    }
}

