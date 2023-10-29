package entities;

import java.util.Date;

public class Customer {
    private Integer id;
    private Integer driverAge;
    private Boolean hasValidLicence;
    private Boolean additionalDriver;
    private String firstName;
    private String lastName;

    public Customer(Integer id, Integer driverAge, Boolean hasValidLicence, Boolean additionalDriver, String firstName, String lastName) {
        this.id = id;
        this.driverAge = driverAge;
        this.hasValidLicence = hasValidLicence;
        this.additionalDriver = additionalDriver;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDriverAge() {
        return driverAge;
    }

    public void setDriverAge(Integer driverAge) {
        this.driverAge = driverAge;
    }

    public Boolean getHasValidLicence() {
        return hasValidLicence;
    }

    public void setHasValidLicence(Boolean hasValidLicence) {
        this.hasValidLicence = hasValidLicence;
    }

    public Boolean getAdditionalDriver() {
        return additionalDriver;
    }

    public void setAdditionalDriver(Boolean additionalDriver) {
        this.additionalDriver = additionalDriver;
    }


}
