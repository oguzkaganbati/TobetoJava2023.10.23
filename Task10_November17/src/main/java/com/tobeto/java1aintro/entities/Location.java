package com.tobeto.java1aintro.entities;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table
public class Location
{
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "location_name")
    private String locationName;

    @OneToMany(mappedBy = "pickupLocation")
    private List<Location> pickupLocations;

    @OneToMany(mappedBy = "dropoffLocation")
    private List<Location> dropoffLocations;
}
