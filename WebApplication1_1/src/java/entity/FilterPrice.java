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
public class FilterPrice {
    private int id;
    private int priceFrom;
    private int toPrice;
    private boolean deleted;
    
    public String getPriceFormat(double price) {
        return NumberFormat.getCurrencyInstance(new Locale("vi","VN")).format(price);
    }
}

