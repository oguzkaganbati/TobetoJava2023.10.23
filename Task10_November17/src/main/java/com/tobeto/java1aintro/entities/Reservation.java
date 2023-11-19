package com.tobeto.java1aintro.entities;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table
public class Reservation
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "additional_driver")
    private Boolean additionalDriver;

    @Column(name = "pickup_date")
    private LocalDateTime pickupDate;

    @Column(name = "dropoff_date")
    private LocalDateTime dropoffDate;

    @ManyToOne
    @JoinColumn(name = "pickup_time_id")
    private Time pickupTime;

    @ManyToOne
    @JoinColumn(name = "dropoff_time_id")
    private Time dropoffTime;

    @ManyToOne
    @JoinColumn(name = "rental_type_id")
    private RentalType rentalType;

    @ManyToOne
    @JoinColumn(name = "vehicle_id")
    private Vehicle vehicle;

    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;

    @ManyToOne
    @JoinColumn(name = "pickup_location_id")
    private Location pickupLocation;

    @ManyToOne
    @JoinColumn(name = "dropoff_location_id")
    private Location dropoffLocation;


}
