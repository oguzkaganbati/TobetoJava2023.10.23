package com.tobeto.java1aintro.entities;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.util.List;

@Entity
@Table
public class DepositFee
{
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "deposit_fee")
    private BigDecimal depositFee;

    @OneToMany(mappedBy = "depositFee")
    private List<DepositFee> depositFees;

}
