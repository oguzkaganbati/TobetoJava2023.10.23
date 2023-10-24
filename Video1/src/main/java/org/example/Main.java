package org.example;

public class Main {
    public static void main(String[] args) {

        System.out.println("Hello World!");


        // Variables are written as camelCase in Java.
        String middleText = "Might interest you..";
        String bottomText = "Maturity Date";

        System.out.println(middleText);

        Integer maturity = 12;
        Double dollarYesterday = 18.20;
        Double dollarToday = 18.20;

        Boolean isDollarRised = false;
        String arrowDirection = "";

        if (dollarToday<dollarYesterday){ // true
            arrowDirection = "down.svg";
            System.out.println(arrowDirection);
        }else if(dollarToday>dollarYesterday){
            arrowDirection = "up.svg";
            System.out.println(arrowDirection);
        }else{
            arrowDirection = "equal.svg";
            System.out.println(arrowDirection);
        }

        //array

        String[] loans = {
                "Fast Loan",
                "Loan for those who receive their salaries from Halkbank",
                "Happy Retirement Consumer Loan"
        };

        for (int i = 0; i < loans.length; i++){
            System.out.println(loans[i]);
        }
    }
}
