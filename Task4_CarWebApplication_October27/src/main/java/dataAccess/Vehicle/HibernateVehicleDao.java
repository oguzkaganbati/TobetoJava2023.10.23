package dataAccess.Vehicle;

import entities.Vehicle;

public class HibernateVehicleDao implements VehicleDao {
    public void add(Vehicle vehicle){
        System.out.println("Has been added to database with Hibernate...");
    }
}
