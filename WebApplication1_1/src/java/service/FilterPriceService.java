/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.FilterPriceDao;
import dao.ICommonDao;
import entity.FilterPrice;
import java.util.List;

/**
 *
 * @author quang
 */
public class FilterPriceService implements CommonService<FilterPrice>{
    private ICommonDao<FilterPrice> commonDao = new FilterPriceDao();
    @Override
    public List<FilterPrice> getAll() {
        return commonDao.getAll();
    }

    @Override
    public FilterPrice getOne(int id) {
        return commonDao.getOne(id);
    }

    @Override
    public boolean add(FilterPrice object) {
        return commonDao.add(object);
    }

    @Override
    public boolean update(FilterPrice object, int id) {
        return commonDao.update(id, object);
    }

    @Override
    public boolean delete(int id) {
        return commonDao.delete(id);
    }
    
}
