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
            // PI/8 だけ回転 = PI/4だけRyを適用
            Ry(0.25*PI(), q);
            if (M(q) == Zero)
            {
                return 0;
            }
            return 1;
        }
    }

}
