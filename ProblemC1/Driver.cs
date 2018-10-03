using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;
using System;

namespace Solution
{
    class Driver
    {
        static void Main(string[] args)
        {
            //確率的なふるまいを乱数でシミュレートするため結果は毎回異なる
            //シードを与えてあげると結果は同じになる
            //new QuantumSimulator(randomNumberGeneratorSeed:41)
            using (var sim = new QuantumSimulator()) 
            {
                var received = RunQsharp.Run(sim).Result;
                Console.WriteLine($"|0>の測定結果: |0>={received.Item1} |+>={1000 - received.Item1}");
                Console.WriteLine($"|+>の測定結果: |+>={received.Item2} |0>={1000 - received.Item2}");
                Console.ReadLine();
            }
        }
    }
}