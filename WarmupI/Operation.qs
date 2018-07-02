namespace Solution 
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (N : Int, Uf : ((Qubit[], Qubit) => ())) : Bool
    {
        body
        {
            mutable results = new Result[N]; 

            using (qs = Qubit[N+1]) {
                let x = qs[0..N-1];
                let y = qs[N];

                X(y);
                ApplyToEach(H, x);
                H(y);

                Uf(x, y);

                ApplyToEach(H, x);

                for (idx in 0..(N - 1)) {
                    set results[idx] = MResetZ(x[idx]);
                }

                Reset(y);
            }
            return ForAll(IsResultZero, results);
        }
    }
}