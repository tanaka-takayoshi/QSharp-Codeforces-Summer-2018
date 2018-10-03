namespace Solution
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    
    function FindFirstDiff (bits0 : Bool[], bits1 : Bool[]) : Int
    {
        for (i in 0 .. Length(bits1)-1)
        {
            if (bits1[i] != bits0[i]) 
            {
                return i;
            }
        }
        fail("All elements are same.");
        //次のreturn文は到達不可能な文だが、ないとコンパイルエラー
        //https://quantum.uservoice.com/forums/906208-q-language/suggestions/35507221-the-function-or-operation-with-the-return-value-re
        return -1;
    }

    operation Solve (qs : Qubit[], bits0 : Bool[], bits1 : Bool[]) : ()
    {
        body
        {
            let firstDiff = FindFirstDiff(bits0, bits1);
            H(qs[firstDiff]);
            for (i in 0 .. Length(qs)-1)
            {
                if (bits0[i] == bits1[i])
                {
                    if (bits0[i])
                    {
                        X(qs[i]);
                    }
                }
                else
                {
                    if (i > firstDiff)
                    {
                        CNOT(qs[firstDiff], qs[i]);
                        if (bits0[i] != bits0[firstDiff])
                        {
                            X(qs[i]);
                        }
                    }
                }
            }
        }
    }
}