package Q3;

import java.util.Scanner;

// Write a Java program gives character counts in a string Ex: Tobeto -> t:2, o:2, b:1, e:1
public class CharacterCount {
    public static void main(String[] args) {

        Scanner scan = new Scanner(System.in);
        System.out.println("Enter a word");

        String input = scan.next();
        String msg = input.toLowerCase();

        charCountInString(msg);

    }

    public static void charCountInString(String msg){
        int[]charCount = new int[128];

        for(int i = 0; i < msg.length();i++){ //
            char c = msg.charAt(i);  //
            charCount[c] += 1; //
        }
        for (int i=0; i<charCount.length;i++){ //
            if (charCount[i]>0){  //
                char c = (char) i; //
                System.out.println(c + ":" + charCount[i]);
            }
        }
    }
}