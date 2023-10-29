package business;

import core.logging.Logger;
import dataAccess.Customer.CustomerDao;
import dataAccess.Customer.HibernateCustomerDao;
import dataAccess.Customer.JdbcCustomerDao;
import entities.Customer;

public class CustomerManager {

    private CustomerDao customerDao;
    private Logger[] loggers;

    public CustomerManager(CustomerDao customerDao, Logger[] loggers) {
        this.customerDao = customerDao;
        this.loggers = loggers;

    }

    public void add(Customer customer) throws Exception{
        if(customer.getDriverAge() <= 21){
            throw new Exception("Driver's age can not be less than 21!");
        }
        if(!customer.getHasValidLicence()){
            throw new Exception("Driver's license should be at least 2 years old!");
        }

        customerDao.add(customer);

        for (Logger logger: loggers
             ) {logger.log(customer.getFirstName(), customer.getLastName());

        }



    }
}
