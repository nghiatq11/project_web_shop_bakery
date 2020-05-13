/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author quang
 */
import java.io.Serializable;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Builder
@Getter //@- gọi là Annotation(đánh dấu vai trò đặc biệt riêng)
@Setter
@ToString
public class Cart implements Serializable{
    private int productId;
    private int categoryId;
    private String productLinkImg;
    private String productName;
    private double productPrice;
    private int quantity;
    private double amount;
    private boolean cancel;
}
