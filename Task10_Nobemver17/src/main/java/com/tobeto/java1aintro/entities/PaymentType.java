package com.tobeto.java1aintro.entities;

import jakarta.persistence.*;

@Entity
@Table
public class PaymentType
{
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "payment_type_name")
    private String paymentTypeName;
}
