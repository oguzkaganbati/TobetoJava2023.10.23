package Q5;

// How to determine if the string has all unique characters.
class UniqueCharacters
{
    boolean isUnique(String str)
    {

        for (int i = 0; i < str.length(); i++)
            for (int j = i + 1; j < str.length(); j++)
                if (str.charAt(i) == str.charAt(j))
                    return false;


        //tekrar eden karakter denk bulamazsa true döner
        return true;
    }

    public static void main(String args[])
    {
        UniqueCharacters obj = new UniqueCharacters();
        String input = "tobeto";

        if (obj.isUnique(input))
            System.out.println("The String " + input + " is Unique");
        else
            System.out.println("The String " + input + " is NOT unique");
    }
}