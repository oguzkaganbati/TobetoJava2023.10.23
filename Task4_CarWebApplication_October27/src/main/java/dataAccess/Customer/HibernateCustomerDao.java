package dataAccess.Customer;

import entities.Customer;

public class HibernateCustomerDao implements CustomerDao{
    public void add(Customer customer){
        System.out.println("Has been added to the database with Hibernate...");
    }

}
