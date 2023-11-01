package Q2;

import java.util.Scanner;

// Write a Java function to print first 100 numbers in Fibonacci series?

// Fibonacci Dizisi, her sayının kendisinden bir önceki sayı ile toplanması ile elde edilen sayılar serisidir.
// {1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, …}

public class Fibonacci {
    public static void main(String[] args) {

        Scanner scan = new Scanner(System.in);
        System.out.println("Enter a number");

        double input = scan.nextInt();


        double number1 = 0;
        double number2 = 1;
        double sum;

        System.out.println("Fibonacci series of " + input );

        for (int i = 1; i <= input; i++) {
            System.out.print(number1 + " , ");  // 0


            sum = number1 + number2;  // 0 + 1   1
            number1 = number2;       //0  - 1
            number2 = sum;       // 1 - 2
        }

        scan.close();
    }
}