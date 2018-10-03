namespace Solution
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Extensions.Convert;
    open Microsoft.Quantum.Extensions.Math;

    operation Solve (x : Qubit[], y : Qubit, b : Int[]) : ()
    {
        body
        {
            for (i in 0..Length(x)-1)
            {
                if (b[i] == 1)
                {
                    CNOT(x[i], y);
                }
                else
                {
                    // do a 0-controlled NOT
                    X(x[i]);
                    CNOT(x[i], y);
                    X(x[i]);
                }
            }
        }
    }

}
