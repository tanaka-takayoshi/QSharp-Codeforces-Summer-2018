namespace Solution
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    
    operation Solve(qs : Qubit[], bits : Bool[]) : ()
    {
        body
        {
            H(qs[0]);
                        
            for (i in 1..Length(qs)-1) 
            {
                if (bits[i]) 
                {
                    CNOT(qs[0], qs[i]);
                    }
            }
        }
    }

    function FindFirstTrue(bits: Bool[]) : Int
    {
        for (i in 0 .. Length(bits)-1)
        {
            if (bits[i])
            {
                return i;
            }
        }
        fail("All false.");
        return -1;
    }

    //bitsの最初のビットがtrueとは限らない場合
    operation Solve2(qs : Qubit[], bits : Bool[]) : ()
    {
        body
        {
            let firstdiff = FindFirstTrue(bits);
            H(qs[firstdiff]);
            for(i in firstdiff+1..Length(bits)-1)
            {
                if (bits[i])
                {
                    CNOT(qs[i], qs[i]);
                }
            }
        }
    }
}