/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jdbc.SQLServerConnection;

/**
 *
 * @author quang
 */
public class AccountDao implements ICommonDao<Account> {

    public Account login(String email, String pass) {
        String query = "select * from account where email = ? and password = ? and deleted = 0";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (ps != null) {
                ps.setObject(1, email);
                ps.setObject(2, pass);
                ResultSet rs = (ps != null) ? ps.executeQuery() : null;

                if (rs != null && rs.next()) {
                    Account account = Account.builder()
                            .id(rs.getInt(1))
                            .accountDetailId(rs.getInt(2))
                            .email(rs.getString(3))
                            .pass(rs.getString(4))
                            .status(rs.getInt(5))
                            .build();
                    return account;
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
    public List<Account> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Account getOne(int id) {
        String query = "SELECT * FROM [account] WHERE id = ? and deleted = 0";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (ps != null) {
                ps.setInt(1, id);
                ResultSet rs = (ps != null) ? ps.executeQuery() : null;
                if (rs != null && rs.next()) {
                    Account accountDetail = Account.builder()
                            .id(rs.getInt(1))
                            .accountDetailId(rs.getInt(2))
                            .email(rs.getString(3))
                            .pass(rs.getString(4))
                            .status(rs.getInt(5))
                            .build();
                    return accountDetail;
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
    public boolean add(Account obj) {
        String query = "INSERT INTO account(account_detail_id, email, password, status) VALUES( ?, ?, ?, ?)";

        int check = 0;
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            ps.setObject(1, obj.getAccountDetailId());
            ps.setObject(2, obj.getEmail());
            ps.setObject(3, obj.getPass());
            ps.setObject(4, obj.getStatus());
            check =  ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check > 0;
    }

    @Override
    public boolean update(int id, Account obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
