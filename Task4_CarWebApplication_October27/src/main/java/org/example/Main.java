package org.example;


import business.CustomerManager;
import business.VehicleManager;
import core.logging.DatabaseLogger;
import core.logging.FileLogger;
import core.logging.Logger;
import core.logging.MailLogger;
import dataAccess.Customer.JdbcCustomerDao;
import dataAccess.Vehicle.HibernateVehicleDao;
import entities.Customer;
import entities.Vehicle;

import javax.xml.crypto.Data;

public class Main {
    public static void main(String[] args) throws Exception {
        Vehicle vehicle1 = new Vehicle(1, "Toyota", "Corolla", 750.00, "diesel", "manuel", "middle", 300.00, 1500.00 );
        Vehicle vehicle2 = new Vehicle(2, "Volvo", "XC90", 8600.00, "diesel", "auto", "luxury", 500.00,8500.00);
        Logger[] loggers = {new DatabaseLogger(), new FileLogger(), new MailLogger()};

        VehicleManager vehicleManager = new VehicleManager(new HibernateVehicleDao(), loggers);
        vehicleManager.add(vehicle1);
        vehicleManager.add(vehicle2);

        Customer customer1 = new Customer(1, 31, true, false, "Jack", "Brown");
        Customer customer2 = new Customer(2, 20, true, false, "John", "Lash");

        CustomerManager customerManager = new CustomerManager(new JdbcCustomerDao(), loggers);
        customerManager.add(customer1);
        customerManager.add(customer2);
    }
}