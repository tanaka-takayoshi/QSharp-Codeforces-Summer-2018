namespace Solution 
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (qs : Qubit[]) : ()
    {
        body
        {
            H(qs[0]);
            let nQubits = Length(qs);
            for (idxQubit in 1..nQubits - 1) 
            {
                CNOT(qs[idxQubit - 1], qs[idxQubit]);
            }
        }
    }
}