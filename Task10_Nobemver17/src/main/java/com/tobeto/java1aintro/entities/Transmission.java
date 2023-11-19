package com.tobeto.java1aintro.entities;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table
public class Transmission
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "transmission_name")
    private String transmissionName;

    @OneToMany(mappedBy = "tranmission")
    private List<Transmission> transmissions;

}
