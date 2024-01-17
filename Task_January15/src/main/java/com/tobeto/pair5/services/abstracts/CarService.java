package com.tobeto.pair5.services.abstracts;

import com.tobeto.pair5.services.dtos.car.requests.AddCarRequest;
import com.tobeto.pair5.services.dtos.car.requests.DeleteCarRequest;
import com.tobeto.pair5.services.dtos.car.requests.UpdateCarRequest;
import com.tobeto.pair5.services.dtos.car.responses.GetAllCarResponse;
import com.tobeto.pair5.services.dtos.car.responses.GetByIdCarResponse;
import com.tobeto.pair5.services.dtos.car.responses.GetCustomCarResponse;

import java.util.List;

public interface CarService {
    void add(AddCarRequest request);
    void delete(DeleteCarRequest request);
    void update(UpdateCarRequest request);

    List<GetAllCarResponse> getAll();
    GetByIdCarResponse getById(int id);

    List<GetCustomCarResponse> getAllCustom();
}
