package business;

import core.logging.Logger;
import dataAccess.Vehicle.HibernateVehicleDao;
import dataAccess.Vehicle.JdbcVehicleDao;
import dataAccess.Vehicle.VehicleDao;
import entities.Vehicle;

import java.util.List;

public class VehicleManager {
    private VehicleDao vehicleDao;
    private Logger[] loggers;

    public VehicleManager(VehicleDao vehicleDao, Logger[] loggers) {
        this.vehicleDao = vehicleDao;
        this.loggers = loggers;
    }
    public void add(Vehicle vehicle) {
        vehicleDao.add(vehicle);

        for (Logger logger: loggers){
            logger.log(vehicle.getBrandName(), vehicle.getModelName());

        }

    }
}
