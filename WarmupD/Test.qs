namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Extensions.Diagnostics;

    operation Test() : () {
        body {
            using (qs = Qubit[1]) {
                H(qs[0]);
				mutable  msg = Solve(qs[0]);
                Message($"+: {msg}");
				ResetAll(qs);

                X(qs[0]);
                H(qs[0]);
				mutable msgs = Solve(qs[0]);
                Message($"-: {msgs}");
                ResetAll(qs);
            }

        }
    }
}

