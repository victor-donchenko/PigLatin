public void setup() 
{
  String[] lines = loadStrings("words.txt");
  System.out.println("there are " + lines.length + " lines");
  for (int i = 0 ; i < lines.length; i++) 
  {
    System.out.println(pigLatin(lines[i]));
  }
}

public void draw()
{
        //not used
}

public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
  String vowels = "aeiou";
  
  for (int i = 0; i < sWord.length(); ++i) {
    for (int j = 0; j < vowels.length(); ++j) {
      if (sWord.charAt(i) == vowels.charAt(j)) {
        return i;
      }
    }
  }
  
  return -1;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
  int vowel_index = findFirstVowel(sWord);
  
  if (vowel_index == -1) {
    return sWord + "ay";
  }
  else if (vowel_index == 0) {
    return sWord + "way";
  }
  else if (sWord.length() >= 2 && sWord.substring(0, 2).equals("qu")) {
    return sWord.substring(2, sWord.length()) + "quay";
  }
  else {
    return sWord.substring(vowel_index, sWord.length())
           + sWord.substring(0, vowel_index)
           + "ay";
  }
}
