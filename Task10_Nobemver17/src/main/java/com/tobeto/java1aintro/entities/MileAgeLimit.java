package com.tobeto.java1aintro.entities;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table
public class MileAgeLimit
{
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "mile_age_limit")
    private int mileAgeLimit;

    @OneToMany(mappedBy = "mileAgeLimit")
    private List<MileAgeLimit> mileAgeLimits;
}
