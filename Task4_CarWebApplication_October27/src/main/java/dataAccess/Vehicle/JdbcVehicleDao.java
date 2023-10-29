package dataAccess.Vehicle;

import entities.Vehicle;

public class JdbcVehicleDao implements VehicleDao {
    public void add(Vehicle vehicle){
        System.out.println("Has been added to database with JDBC...");
    }
}
