/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.ICommonDao;
import dao.ProductDao;
import entity.Product;
import java.util.List;

/**
 *
 * @author quang
 */
public class ProductService implements CommonService<Product>{
    private ICommonDao<Product> commonDao = new ProductDao();
    @Override
    public List<Product> getAll() {
        return  commonDao.getAll();
    }

    @Override
    public Product getOne(int id) {
        return commonDao.getOne(id);
    }

    @Override
    public boolean add(Product object) {
        return commonDao.add(object);
    }

    @Override
    public boolean update(Product object, int id) {
        return commonDao.update(id, object);
    }

    @Override
    public boolean delete(int id) {
        return commonDao.delete(id);
    }
    
}
