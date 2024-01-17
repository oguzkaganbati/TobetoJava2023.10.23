package com.tobeto.pair5.services.dtos.customer.requests;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UpdateCustomerRequest {
    @Positive(message = "Id must be a positive number!")
    @NotNull(message = "Id cannot be empty!")
    private int id;
    @NotNull(message = "firstName field cannot be empty!")
    private String firstName;
    @NotNull(message = "lastName field cannot be empty!")
    private String lastName;
    @Positive(message = "userId must be a positive number!")
    private int userId;
}
