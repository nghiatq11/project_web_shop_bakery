/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

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
public class Category {
    private int id;
    private String name;
    private boolean deleted;
}