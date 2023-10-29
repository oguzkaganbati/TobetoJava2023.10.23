package business;
import core.logging.Logger;
import dataAccess.JdbcProductDao;
import dataAccess.ProductDao;
import entities.Product;

import java.util.List;

public class ProductManager {
    private final ProductDao productDao;
    private final Logger[] loggers;

    public ProductManager(ProductDao productDao, Logger[] loggers) {
        this.productDao = productDao;
        this.loggers = loggers;
    }

    public void add(Product product) throws Exception{
        //business rules
        if (product.getUnitPrice()<10){
            throw new Exception("Price can not be less than 10");
        }

        productDao.add(product);

        for (Logger logger: loggers){ //db, mail
            logger.log(product.getName());
        }
    }
}
