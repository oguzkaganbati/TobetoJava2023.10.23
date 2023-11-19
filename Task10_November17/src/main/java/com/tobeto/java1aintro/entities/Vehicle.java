package com.tobeto.java1aintro.entities;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.util.List;

@Table(name="vehicles")
@Entity
public class Vehicle
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "price_per_day")
    private BigDecimal pricePerDay;

    @Column(name = "price_per_month")
    private BigDecimal pricePerMonth;

    @ManyToOne
    @JoinColumn(name = "brand_id")
    private Brand brand;

    @ManyToOne
    @JoinColumn(name = "deposit_fee_id")
    private DepositFee depositFee;

    @ManyToOne
    @JoinColumn(name = "fuel_type_id")
    private Fuel fuel;

    @ManyToOne
    @JoinColumn (name = "mile_age_limit_id")
    private MileAgeLimit mileAgeLimit;

    @ManyToOne
    @JoinColumn(name = "model_id")
    private Model model;

    @ManyToOne
    @JoinColumn(name = "transmission_id")
    private Transmission transmission;

    @ManyToOne
    @JoinColumn(name = "vehicle_type_id")
    private VehicleType vehicleType;

    @OneToMany(mappedBy = "vehicle")
    private List<Vehicle> vehicles;

}
