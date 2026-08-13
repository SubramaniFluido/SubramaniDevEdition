public class SampleController
{
    public string myString{
        get {
            if (myString == null)
            {
                return 'a';
            }
            return myString;
        } Private set;
    }
    public String getmyString()
    {
        return 'getmyString';
    }
    public string getMyStringMethod()
    {
        If (myString == null)
        {
            myString = 'b';
        }
        return myString;
    }
}