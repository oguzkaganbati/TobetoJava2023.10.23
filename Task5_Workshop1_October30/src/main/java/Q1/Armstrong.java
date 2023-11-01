package Q1;

import java.util.Scanner;

// Write a Java program to check if the entered number is Armstrong number?

// Tüm basamaklarındaki rakamların sayı değerlerinin küpleri toplamı,kendisine eşit olan sayılara "Armstrong sayı"denir.

public class Armstrong {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter a number: ");
        int number = scanner.nextInt();
        scanner.close();

        int originalNumber, remainder, result = 0;

        originalNumber = number;

        while (originalNumber != 0)
        {
            remainder = originalNumber % 10;  //0 = 3
            result += Math.pow(remainder, 3); //0 =
            originalNumber /= 10; //orjinal numberı 10a böl, orjinal numbera o değeri ver
        }

        if(result == number)
            System.out.println(number + " is an Armstrong number.");
        else
            System.out.println(number + " is not an Armstrong number.");
    }
}