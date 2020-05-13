/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Cart;
import entity.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jdbc.SQLServerConnection;

/**
 *
 * @author quang
 */
public class OrderDetailDao implements ICommonDao<OrderDetail> {

    private OrderDetail getValueOrderDetail(ResultSet rs) {
        try {
            return OrderDetail.builder()
                    .id(rs.getInt(1))
                    .orderId(rs.getInt(2))
                    .productId(rs.getInt(3))
                    .productName(rs.getString(4))
                    .productPrice(rs.getDouble(5))
                    .quantity(rs.getInt(6))
                    .build();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    private boolean setValueOrderDetail(OrderDetail orderDetail, PreparedStatement ps) {
        if (ps != null) {
            try {

                ps.setInt(1, orderDetail.getOrderId());
                ps.setInt(2, orderDetail.getProductId());
                ps.setString(3, orderDetail.getProductName());
                ps.setDouble(4, orderDetail.getProductPrice());
                ps.setInt(5, orderDetail.getQuantity());

                return true;
            } catch (SQLException e) {
                e.printStackTrace(System.out);
            }
        }
        return false;
    }

    @Override
    public List<OrderDetail> getAll() {
        String query = "SELECT * FROM order_detail";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            List<OrderDetail> list = new ArrayList<>();
            while (rs != null && rs.next()) {
                list.add(getValueOrderDetail(rs));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public OrderDetail getOne(int id) {
        String query = "SELECT * FROM order_detail WHERE id = ?";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (ps != null) {
                ps.setInt(1, id);
                ResultSet rs = (ps != null) ? ps.executeQuery() : null;
                if (rs != null && rs.next()) {
                    return getValueOrderDetail(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean add(OrderDetail obj) {
        String query = "INSERT INTO order_detail( order_id, product_id, product_name, product_price, quantity ) VALUES(?, ?, ?, ?, ? )";

        int check = 0;
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            check = setValueOrderDetail(obj, ps) ? ps.executeUpdate() : 0;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check > 0;
    }

    @Override
    public boolean update(int id, OrderDetail obj) {
        String query = "UPDATE order_detail SET order_id = ?,  product_id = ?, product_name = ?, product_price = ?, quantity = ?  WHERE id = ?";

        int check = 0;
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (setValueOrderDetail(obj, ps)) {
                ps.setInt(6, id);
                check = ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check > 0;
    }

    @Override
    public boolean delete(int id) {
        String query = "DELETE FROM order_detail WHERE id = ?";
        int check = 0;
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            ps.setInt(1, id);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public int addOrderDetailReturnId(OrderDetail obj) {
        String query = "INSERT INTO order_detail (order_id, product_id, product_name, product_price, quantity ) VALUES(?, ?, ?, ?, ?)";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS) : null;) {
            if (ps != null) {
                ps.setObject(1, obj.getOrderId());
                ps.setObject(2, obj.getProductId());
                ps.setObject(3, obj.getProductName());
                ps.setObject(4, obj.getProductPrice());
                ps.setObject(5, obj.getQuantity());
                int ischeck = ps.executeUpdate();
                if (ischeck > 0) {
                    ResultSet rs = ps.getGeneratedKeys();
                    rs.next();
                    return rs.getInt(1);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CustomerInfoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public boolean addlistCart(List<Cart> listCart, int orderId) {
        int[] arr = {};
        String query = "INSERT INTO order_detail (order_id, product_id, product_name, product_price, quantity ) VALUES(?, ?, ?, ?, ?)";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS) : null;) {
            
            if(ps != null){
                for(Cart c : listCart){
                    ps.setObject(1, orderId);
                    ps.setObject(2, c.getProductId());
                    ps.setObject(3, c.getProductName());
                    ps.setObject(4, c.getProductPrice());
                    ps.setObject(5, c.getQuantity());
                    
                    ps.addBatch();
                }
                arr = ps.executeBatch();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CustomerInfoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr.length>0;
    }

    public static void main(String[] args) {
        OrderDetailDao detailDao = new OrderDetailDao();
        List<Cart> list = new ArrayList<>();
        Cart cart = Cart.builder()
                .productId(1)
                .productName("bim bim")
                .productPrice(111)
                .build();
        Cart cart2 = Cart.builder()
                .productId(1)
                .productName("bim2 bim2")
                .productPrice(222)
                .build();
        list.add(cart);
        list.add(cart2);
        
        OrderDetail od = OrderDetail.builder()
                .orderId(1)
                .productId(1)
                .productName("aaa")
                .productPrice(123)
                .quantity(10)
                .build();
        System.out.println(detailDao.addOrderDetailReturnId(od));
    }
}
