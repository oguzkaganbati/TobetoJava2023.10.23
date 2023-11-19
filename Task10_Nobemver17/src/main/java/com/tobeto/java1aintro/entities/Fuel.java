package com.tobeto.java1aintro.entities;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table
public class Fuel
{
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "fuel_name")
    private String fuelName;

    @OneToMany(mappedBy = "fuel")
    private List<Fuel> fuels;
}
