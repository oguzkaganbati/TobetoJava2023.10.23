package org.example;
import business.ProductManager;
import core.logging.DatabaseLogger;
import core.logging.FileLogger;
import core.logging.MailLogger;
import dataAccess.JdbcProductDao;
import entities.Product;
import core.logging.Logger;

import java.io.File;

public class Main {
    public static void main(String[] args) throws Exception {
        Product product1 = new Product(1, "iPhone XR", 10000.00);

        Logger[] loggers = {new DatabaseLogger(), new FileLogger(), new MailLogger()};

        ProductManager productManager = new ProductManager(new JdbcProductDao(), loggers);
        productManager.add(product1);
    }
}