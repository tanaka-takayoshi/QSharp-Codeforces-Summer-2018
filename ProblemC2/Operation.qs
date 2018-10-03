namespace Solution
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Extensions.Convert;
    open Microsoft.Quantum.Extensions.Math;

    operation Solve (q : Qubit) : Int
    {
        body
        {
            mutable output = 0;
            let basis = RandomInt(2);
            if (basis == 0)
            {
                let result = M(q);
                if (result == One)
                {
                    set output = 1;
                }
                else
                {
                    set output = -1;
                }
            }
            else
            {
                H(q);
                let result = M(q);
                if (result == One)
                {
                    set output = 0;
                }
                else
                {
                    set output = -1;
                }
            }
            return output;
        }
    }

}
