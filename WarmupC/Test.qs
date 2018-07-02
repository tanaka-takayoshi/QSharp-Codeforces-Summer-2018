namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Extensions.Diagnostics;

    operation Test() : () {
        body {
            using (qubits = Qubit[2]) {

				Solve(qubits);
				DumpMachine("dump-2.txt");
				ResetAll(qubits);
            }

			using (qs3 = Qubit[3]) {

				Solve(qs3);
				DumpMachine("dump-3.txt");
				ResetAll(qs3);
            }

            using (qs8 = Qubit[8]) {

				Solve(qs8);
				DumpMachine("dump-8.txt");
				ResetAll(qs8);
            }
        }
    }
}

