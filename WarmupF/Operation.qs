namespace Solution 
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (qs : Qubit[], bits0 : Bool[], bits1 : Bool[]) : Int
    {
        body
        {
            let len = Length(qs);
            for(i in 0..len-1)
            {
                if (M(qs[i]) == Zero)
                {
                    if(!bits0[i])
                    {
                        if(!bits1[i])
                        {
                            //continue
                        }
                        else
                        {
                            return 0;
                        }
                    }
                    else
                    {
                        if(!bits1[i])
                        {
                            return 1;
                        }
                        else
                        {
                            fail("illegal bit");
                            return -1;
                        }
                    }
                }
                else
                {
                    if(bits0[i])
                    {
                        if(bits1[i])
                        {
                            //continue
                        }
                        else
                        {
                            return 0;
                        }
                    }
                    else
                    {
                        if(bits1[i])
                        {
                            return 1;
                        }
                        else
                        {
                            fail("illegal bit");
                            return -1;
                        }
                    }
                }
            }
            fail("illegal bit");
            return -1;
        }
    }
}