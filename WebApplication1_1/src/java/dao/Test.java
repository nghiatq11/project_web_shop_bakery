/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Product;
import java.util.List;

/**
 *
 * @author quang
 */
public class Test {
    public static void main(String[] args) {
        ProductDao productDao = new ProductDao();
        List<Product> list = productDao.getAll();
        System.out.println(list.get(0));
//        if(list!= null){
//        list.forEach(System.out::println);
//        }else{
//            System.out.println("list emtity");
//        }
//    Product product = Product.builder()
//            .brandId(1)
//            .name("aaa")
//            .price(1)
//            .quantity(12)
//            .gram(123)
//            .color("đỏ")
//            .descripsion("đẹp vler")
//            .status("đang bán")
//            .build();
//    
//        System.out.println(productDao.update(1,product)?"ngon":"lỗi");


    }
}
