/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.text.NumberFormat;
import java.util.Locale;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author quang
 */
@Builder
@Getter //@- gọi là Annotation(đánh dấu vai trò đặc biệt riêng)
@Setter
@ToString
public class Product {

    private int id;
    private int brandId;
    private int categoryId;
    private String name;
    private double price;
    private String descripsion;
    private int status;
    private boolean deleted;

    public String getDisplayStatus() {
        return status == 1 ? "còn hàng" : status == 2 ? "hết hàng" : "đang khuyến mãi";
    }

    public String getPriceFormat() {
        return NumberFormat.getCurrencyInstance(new Locale("vi","VN")).format(this.price);
    }
    public String getPriceFormat2(double price) {
        return NumberFormat.getCurrencyInstance(new Locale("vi","VN")).format(price);
    }

    public static void main(String[] args) {
        System.out.println(NumberFormat.getCurrencyInstance(new Locale("vi","VN")).format(100000000));
    }
}
