package org.example;

public class Main {
    public static void main(String[] args) {
        String message = "Maturity Rate";

        Product product1 = new Product();
        product1.setName("Delonghi Coffee Machine");
        product1.setUnitPrice(7500.00);
        product1.setDiscount(7.0);
        product1.setUnitsInStock(3);
        product1.setImageUrl("sample1.jpeg");

        Product product2 = new Product();
        product2.setName("Smeg Coffee Machine");
        product2.setUnitPrice(6500.00);
        product2.setDiscount(8.0);
        product2.setUnitsInStock(2);
        product2.setImageUrl("sample2.jpeg");

        Product product3 = new Product();
        product3.setName("Kitchen Aid Machine");
        product3.setUnitPrice(4500.00);
        product3.setDiscount(9.0);
        product3.setUnitsInStock(4);
        product3.setImageUrl("sample3.jpeg");

        Product[] products = {product1, product2, product3};

        System.out.println("<ul>");
        for (Product product : products
        ) {
            System.out.println("<li>" + product.getName() + "</li>");
        }
        System.out.println("</ul>");

        IndividualCustomer individualCustomer = new IndividualCustomer();
        individualCustomer.setId(1);
        individualCustomer.setPhoneNumber("0543222222");
        individualCustomer.setCustomerNumber("12345");
        individualCustomer.setFirstName("Oguz Kagan");
        individualCustomer.setLastName("Bati");

        CorporateCustomer corporateCustomer = new CorporateCustomer();
        corporateCustomer.setId(2);
        corporateCustomer.setPhoneNumber("05431234433");
        corporateCustomer.setCustomerNumber("123456");
        corporateCustomer.setCompanyName("Acme");
        corporateCustomer.setTaxNumber("4657883");

        Customer[] customers = {individualCustomer, corporateCustomer};


    }
}

