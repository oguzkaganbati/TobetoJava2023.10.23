package Q6;

import java.util.Scanner;

// Write a Java program finds first two amicable pairs. (Output: 1-> 220-284 2: 1184-1210)

// Birbirinden farklı iki pozitif tam sayıdan her birinin kendisi hariç pozitif
// bölenlerinin toplamı diğer sayıyı veriyorsa bu sayı ikilisine bağdaşık (amicable) sayı denir.

public class AmicablePair {

    public static void main(String[] args) {

        Scanner scan = new Scanner(System.in);
        System.out.println("Enter a number");

        int input1 = scan.nextInt();

        System.out.println("Enter another number");
        int input2 = scan.nextInt();

        int num1 = input1;
        int num2 = input2;

        int sum1 = 0;
        int sum2 = 0;


        for (int i = 1; i < num1; i++) {
            if (num1 % i == 0) {
                sum1 += i;
            }
        }

        for (int i = 1; i < num2; i++) {
            if (num2 % i == 0) {
                sum2 += i;
            }
        }

        if (num1 == sum2 && num2 == sum1) {
            System.out.println("These two numbers are Amicable");
        } else {
            System.out.println("These two numbers not Amicable");
        }
    }


}