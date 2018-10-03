namespace Solution
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (qs : Qubit[]) : ()
    {
        body
        {
            let N = Length(qs);
            if (N == 1) 
            {
                X(qs[0]);
            }
            else
            {
                let K = N / 2;
                Solve(qs[0..K-1]);
                
                using (anc = Qubit[1]) 
                {
                    let here = anc[0];
                    H(here);
                    for (i in 0..K-1)
                    {
                        (Controlled SWAP)([here], (qs[i], qs[i+K]));
                    }
                    for (i in K..N-1)
                    {
                        CNOT(qs[i], here);
                    }
                }
            }
        }
        adjoint auto;
    }
}
