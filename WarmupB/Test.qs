namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Extensions.Diagnostics;

    operation Test() : () {
        body {
            using (qubits = Qubit[2]) {

				Solve(qubits, 0);
				DumpMachine("dump-0.txt");
				ResetAll(qubits);

				Solve(qubits, 1);
				DumpMachine("dump-1.txt");
				ResetAll(qubits);

				Solve(qubits, 2);
				DumpMachine("dump-2.txt");
				ResetAll(qubits);

				Solve(qubits, 3);
				DumpMachine("dump-3.txt");
				ResetAll(qubits);
            }
        }
    }
}

