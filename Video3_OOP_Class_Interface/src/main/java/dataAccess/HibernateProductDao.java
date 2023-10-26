package dataAccess;

import entities.Product;
public class HibernateProductDao implements ProductDao{
    public void add(Product product){
        // only db access codes are written here
        System.out.println("Has been added to the database with Hibernate ");
    }

}
