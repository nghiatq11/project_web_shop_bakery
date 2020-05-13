/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.ICommonDao;
import dao.ImageDao;
import entity.Image;
import entity.Product;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author quang
 */
public class ImageService implements CommonService<Image>{
    private ICommonDao<Image> commonDao = new ImageDao();
    private ImageDao imageDao = new ImageDao();
    @Override
    public List<Image> getAll() {
        return commonDao.getAll();
    }

    @Override
    public Image getOne(int id) {
        return commonDao.getOne(id);
    }

    @Override
    public boolean add(Image object) {
        return commonDao.add(object);
    }

    @Override
    public boolean update(Image object, int id) {
        return commonDao.update(id, object);
    }

    @Override
    public boolean delete(int id) {
        return commonDao.delete(id);
    }
    private Image getImageByProductId(int productId, List<Image> list){
        for(Image img : list){
            if(img.getProductId()== productId){
                return img;
            }
        }
        return null;
    }
    
    public List<String> getAllImageAvartar(List<Product> products){
        return imageDao.getAllImageAvatar(products);
    }
    
    public List<Image> listImageCoverMapping(List<Image> listImage, List<Product> listProduct){
        List<Image> listImageCoverMapping = new ArrayList<>();
        for(Product p : listProduct){
            listImageCoverMapping.add(getImageByProductId(p.getId(), listImage));
        }
        return listImageCoverMapping;
    }
    
    public List<Image> getAllSubImg(List<Image> listImage, int productId){
        List<Image> listSubImg = new ArrayList<>();
        for(Image i : listImage){
            if(i.isCover()==false && i.getProductId()==productId){
                listSubImg.add(i);
            }
        }
        return listSubImg;
    }
//    public static void main(String[] args) {
//        List<Image> list1 = new ImageService().getAll();
//        System.out.println(list1.size());
//        List<Image> list = new ImageService().getAllSubImg(new ImageService().getAll(), 2);
//        System.out.println(list.size());
//    }
}
