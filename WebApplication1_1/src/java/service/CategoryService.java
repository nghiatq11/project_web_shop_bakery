/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.CategoryDao;
import dao.ICommonDao;
import entity.Category;
import java.util.List;

/**
 *
 * @author quang
 */
public class CategoryService implements CommonService<Category>{
    private ICommonDao<Category> commonDao = new CategoryDao();
    @Override
    public List<Category> getAll() {
        return commonDao.getAll();
    }

    @Override
    public Category getOne(int id) {
        return commonDao.getOne(id);
    }

    @Override
    public boolean add(Category object) {
        return commonDao.add(object);
    }

    @Override
    public boolean update(Category object, int id) {
        return commonDao.update(id, object);
    }

    @Override
    public boolean delete(int id) {
        return commonDao.delete(id);
    }
    
}
