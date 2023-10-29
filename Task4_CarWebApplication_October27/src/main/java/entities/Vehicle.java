package entities;

public class Vehicle {
    private Integer id;
    private String brandName;
    private String modelName;
    private Double pricePerDay;
    private String fuelType;
    private String gearType;
    private String vehicleClass;
    private Double mileageLimit;
    private Double depositPrice;

    public Vehicle(Integer id, String brandName, String modelName, Double pricePerDay, String fuelType, String gearType, String vehicleClass, Double mileageLimit, Double depositPrice) {
        this.id = id;
        this.brandName = brandName;
        this.modelName = modelName;
        this.pricePerDay = pricePerDay;
        this.fuelType = fuelType;
        this.gearType = gearType;
        this.vehicleClass = vehicleClass;
        this.mileageLimit = mileageLimit;
        this.depositPrice = depositPrice;
    }

    public Double getDepositPrice() {
        return depositPrice;
    }

    public void setDepositPrice(Double depositPrice) {
        this.depositPrice = depositPrice;
    }

    public Double getMileageLimit() {
        return mileageLimit;
    }

    public void setMileageLimit(Double mileageLimit) {
        this.mileageLimit = mileageLimit;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getModelName() {
        return modelName;
    }

    public void setModelName(String modelName) {
        this.modelName = modelName;
    }

    public Double getPricePerDay() {
        return pricePerDay;
    }

    public void setPricePerDay(Double pricePerDay) {
        this.pricePerDay = pricePerDay;
    }

    public String getFuelType() {
        return fuelType;
    }

    public void setFuelType(String fuelType) {
        this.fuelType = fuelType;
    }

    public String getGearType() {
        return gearType;
    }

    public void setGearType(String gearType) {
        this.gearType = gearType;
    }

    public String getVehicleClass() {
        return vehicleClass;
    }

    public void setVehicleClass(String vehicleClass) {
        this.vehicleClass = vehicleClass;
    }
}
