/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.CustomerInfo;
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
public class CustomerInfoDao implements ICommonDao<CustomerInfo>{
    private CustomerInfo getValueCustomerInfo(ResultSet rs) {
        try {
            return CustomerInfo.builder()
                    .id(rs.getInt(1))
                    .name(rs.getString(2))
                    .mobile(rs.getString(3))
                    .email(rs.getString(4))
                    .address(rs.getString(5))
                    .build();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    private boolean setValueCustomerInfo(CustomerInfo category, PreparedStatement ps) {
        if (ps != null) {
            try {

                ps.setString(1, category.getName());
                ps.setString(2, category.getMobile());
                ps.setString(3, category.getEmail());
                ps.setString(4, category.getAddress());
                
                return true;
            } catch (SQLException e) {
                e.printStackTrace(System.out);
            }
        }
        return false;
    }

    @Override
    public List<CustomerInfo> getAll() {
        String query = "SELECT * FROM customer_info";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            List<CustomerInfo> list = new ArrayList<>();
            while (rs != null && rs.next()) {
                list.add(getValueCustomerInfo(rs));
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
    public CustomerInfo getOne(int id) {
        String query = "SELECT * FROM customer_info WHERE id = ?";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (ps != null) {
                ps.setInt(1, id);
                ResultSet rs = (ps != null) ? ps.executeQuery() : null;
                if (rs != null && rs.next()) {
                    return getValueCustomerInfo(rs);
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
    public boolean add(CustomerInfo obj) {
        String query = "INSERT INTO customer_info( name, mobile, email, address) VALUES(?, ?, ?, ?)";

        int check = 0;
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            check = setValueCustomerInfo(obj, ps) ? ps.executeUpdate() : 0;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check > 0;
    }

    @Override
    public boolean update(int id, CustomerInfo obj) {
        String query = "UPDATE customer_info SET name = ?,  mobile = ?, email = ?, address = ? WHERE id = ?";

        int check = 0;
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (setValueCustomerInfo(obj, ps)) {
                ps.setInt(5, id);
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
         String query = "DELETE FROM customer_info WHERE id = ?";
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
    
    public int addCustomerInfoReturnId(CustomerInfo obj){
        String query = "INSERT INTO customer_info (name, mobile, email, address) VALUES(?, ?, ?, ?)";
        try(Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con!= null)?con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS) : null;){
            if(ps!= null){
                ps.setObject(1, obj.getName());
                ps.setObject(2, obj.getMobile());
                ps.setObject(3, obj.getEmail());
                ps.setObject(4, obj.getAddress());
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
    public static void main(String[] args) {
        CustomerInfoDao customerInfoDao = new CustomerInfoDao();
        CustomerInfo customerInfo = CustomerInfo.builder()
                .name("nghia")
                .mobile("123456789")
                .email("nghiatqhe130530")
                .address("Nam Dinh")
                .build();
        System.out.println(customerInfoDao.addCustomerInfoReturnId(customerInfo));
    }
}
