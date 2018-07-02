namespace Solution
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (qs : Qubit[]) : Int
    {
        body
        {
            let resX = Measure([PauliX; PauliX], qs);
            let resY = Measure([PauliY; PauliY], qs);
            if(resX == Zero && resY == One)
            {
                return 0;
            } elif (resX == One && resY == Zero)
            {
                return 1;
            } elif (resX == Zero && resY == Zero)
            {
                return 2;
            } elif (resX == One && resY == One)
            {
                return 3;
            } 
            return -1;
        }
    }


}
