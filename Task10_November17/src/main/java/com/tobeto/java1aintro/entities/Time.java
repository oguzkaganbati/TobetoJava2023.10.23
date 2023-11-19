package com.tobeto.java1aintro.entities;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table
public class Time
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "time")
    private String time;

    @OneToMany(mappedBy = "pickupTime")
    private List<Time> pickupTimes;

    @OneToMany(mappedBy = "dropoffTime")
    private List<Time> dropoffTimes;

}
