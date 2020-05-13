/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Order;
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
public class OrderDao implements ICommonDao<Order>{

    private Order getValueOrder(ResultSet rs) {
        try {
            return Order.builder()
                    .id(rs.getInt(1))
                    .customerInfoId(rs.getInt(2))
                    .totalPrice(rs.getDouble(3))
                    .note(rs.getString(4))
                    .createDate(rs.getString(5))
                    .status(rs.getInt(6))
                    .accountId(7)
                    .build();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    private boolean setValueOrder(Order order, PreparedStatement ps) {
        if (ps != null) {
            try {

                ps.setInt(1, order.getCustomerInfoId());
                ps.setDouble(2, order.getTotalPrice());
                ps.setString(3, order.getNote());
                ps.setInt(4, order.getStatus());
                ps.setInt(5, order.getAccountId());
                return true;
            } catch (SQLException e) {
                e.printStackTrace(System.out);
            }
        }
        return false;
    }
    
    @Override
    public List<Order> getAll() {
        String query = "SELECT * FROM [order]";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            List<Order> list = new ArrayList<>();
            while (rs != null && rs.next()) {
                list.add(getValueOrder(rs));
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
    public Order getOne(int id) {
        String query = "SELECT * FROM [order] WHERE id = ?";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (ps != null) {
                ps.setInt(1, id);
                ResultSet rs = (ps != null) ? ps.executeQuery() : null;
                if (rs != null && rs.next()) {
                    return getValueOrder(rs);
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
    public boolean add(Order obj) {
        String query = "INSERT INTO [order]( customer_info_id, total_price, note, status, account_id ) VALUES(?, ?, ?, ?, ?, ? )";

        int check = 0;
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            check = setValueOrder(obj, ps) ? ps.executeUpdate() : 0;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check > 0;
    }

    @Override
    public boolean update(int id, Order obj) {
        String query = "UPDATE [order] SET customer_info_id = ?,  total_price = ?, note = ?, create_date = ?, status = ?, account_id = ?  WHERE id = ?";

        int check = 0;
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (setValueOrder(obj, ps)) {
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
        String query = "DELETE FROM [order] WHERE id = ?";
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
    
    public int addOrderReturnId(Order obj){
        String query = "INSERT INTO [order] (customer_info_id, total_price, note, status, account_id ) VALUES(?, ?, ?, ?, ?)";
        try(Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con!= null)?con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS) : null;){
            if(ps!= null){
                ps.setObject(1, obj.getCustomerInfoId());
                ps.setObject(2, obj.getTotalPrice());
                ps.setObject(3, obj.getNote());
                ps.setObject(4, obj.getStatus());
                ps.setObject(5, obj.getAccountId());
                int ischeck = ps.executeUpdate();
                if(ischeck>0){
                    ResultSet rs = ps.getGeneratedKeys();
                    rs.next();
                    return rs.getInt(1);
                }
            }
            
        }catch(SQLException e){
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CustomerInfoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
}
