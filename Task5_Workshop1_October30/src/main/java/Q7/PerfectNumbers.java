package Q7;


// Write a Java program finds first 10 perfect numbers.

// Mükemmel sayı, kendisi hariç pozitif tam bölenlerinin toplamı kendisine eşit olan sayıdır.
public class PerfectNumbers {

    public static void main(String[] s1){

        long num = 0;
        long sum = 0;

        for (num = 1; num < 999999999; num++) {
            for (long j = 1; j < num; j++) {
                if (num % j == 0) {
                    sum = sum + j;
                }
            }
            if (sum == num) {
                System.out.println(sum);
            }
            sum = 0;
        }

    }
}