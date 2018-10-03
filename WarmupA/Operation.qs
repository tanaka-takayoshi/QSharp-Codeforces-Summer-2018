namespace Solution
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (q : Qubit, sign : Int) : ()
    {
        body 
        {
            if (!(sign == -1 || sign == 1))
            {
                fail($"sign must be 1 or -1. Actual value was {sign}");
                return ();
            }
            if (sign == -1) 
            {
                Message("-1なので先にX操作をする");
                X(q);
            }
            Message("H操作をする");
            H(q);
        }
    }
}