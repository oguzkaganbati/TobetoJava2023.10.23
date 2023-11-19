package com.tobeto.java1aintro.entities;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table
public class RentalType
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "rental_type_name")
    private String rentalTypeName;

    @OneToMany(mappedBy = "rentalType")
    private List<RentalType> rentalTypes;

}
