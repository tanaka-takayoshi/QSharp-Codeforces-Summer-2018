namespace Solution
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation ApplyDiag (qs : Qubit[]) : ()
    {
        body
        {
            ApplyToEach(X, qs);
            (Controlled Z)([qs[0]], qs[1]);
            ApplyToEach(X, qs);
        }
        adjoint self
    }

    operation Solve (qs : Qubit[]) : Int
    {
        body
        {
            SWAP(qs[0], qs[1]); 
            With(ApplyDiag, ApplyToEach(H, _), qs); // diag(..) (H \otimes H) diag(..)
            return ResultAsInt([M(qs[1]); M(qs[0])]);
        }
    }
}
