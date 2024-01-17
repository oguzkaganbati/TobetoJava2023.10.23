package com.tobeto.pair5.services.concretes;

import com.tobeto.pair5.core.utilities.mappers.ModelMapperService;
import com.tobeto.pair5.entities.concretes.CorporateCustomer;
import com.tobeto.pair5.repositories.CorporateCustomerRepository;
import com.tobeto.pair5.services.abstracts.CorporateCustomerService;
import com.tobeto.pair5.services.dtos.corporateCustomer.requests.AddCorporateCustomerRequest;
import com.tobeto.pair5.services.dtos.corporateCustomer.requests.DeleteCorporateCustomerRequest;
import com.tobeto.pair5.services.dtos.corporateCustomer.requests.UpdateCorporateCustomerRequest;
import com.tobeto.pair5.services.dtos.corporateCustomer.responses.GetCorporateCustomerResponse;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@AllArgsConstructor
@Service
public class CorporateCustomerManager implements CorporateCustomerService {

    private final CorporateCustomerRepository corporateCustomerRepository;
    private ModelMapperService modelMapperService;
    @Override
    public void add(AddCorporateCustomerRequest request) {
        checkIfCorporateCustomerExists(request.getUserId());
        CorporateCustomer corporateCustomer = this.modelMapperService.forRequest().map(request,CorporateCustomer.class);
        corporateCustomerRepository.save(corporateCustomer);
    }

    @Override
    public void delete(DeleteCorporateCustomerRequest request) {
        checkIfCorporateCustomerNotExists(request.getId());
        CorporateCustomer corporateCustomerToDelete = corporateCustomerRepository.findById(request.getId()).orElseThrow();
        corporateCustomerRepository.delete(corporateCustomerToDelete);
    }

    @Override
    public void update(UpdateCorporateCustomerRequest request) {

            checkIfCorporateCustomerNotExists(request.getId());
            CorporateCustomer corporateCustomerToUpdate = corporateCustomerRepository.findById(request.getId())
                  .orElseThrow();

            this.modelMapperService.forRequest().map(request, corporateCustomerToUpdate);

            corporateCustomerRepository.saveAndFlush(corporateCustomerToUpdate);
    }

    @Override
    public List<GetCorporateCustomerResponse> getAll() {
        List<CorporateCustomer> corporateCustomers = corporateCustomerRepository.findAll();
        List<GetCorporateCustomerResponse> corporateCustomerResponses = corporateCustomers.stream()
                .map(corporateCustomer -> this.modelMapperService.forResponse().map(corporateCustomer, GetCorporateCustomerResponse.class))
                .toList();
        return  corporateCustomerResponses;
    }

    @Override
    public GetCorporateCustomerResponse getById(int id) {
        CorporateCustomer corporateCustomer = corporateCustomerRepository.findById(id).orElseThrow();
        GetCorporateCustomerResponse corporateCustomerResponse = this.modelMapperService.forResponse().map(corporateCustomer, GetCorporateCustomerResponse.class);
        return corporateCustomerResponse;
    }

    private void checkIfCorporateCustomerExists(int id){
        if (corporateCustomerRepository.existsById(id)){
            throw new RuntimeException("The customer is already exists");
        }
    }

    private void checkIfCorporateCustomerNotExists(int id){
        if (!corporateCustomerRepository.existsById(id)){
            throw new RuntimeException("The customer not exists");
        }
    }
}
