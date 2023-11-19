package com.tobeto.java1aintro.entities;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table
public class VehicleType
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "vehicle_type_name")
    private String vehicleTypeName;

    @OneToMany(mappedBy = "vehicleType")
    private List<VehicleType> vehicleTypes;


}
