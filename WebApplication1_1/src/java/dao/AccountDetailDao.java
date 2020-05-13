/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.AccountDetail;
import entity.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jdbc.SQLServerConnection;

/**
 *
 * @author quang
 */
public class AccountDetailDao implements ICommonDao<AccountDetail> {

    @Override
    public List<AccountDetail> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public AccountDetail getOne(int id) {
        String query = "SELECT * FROM [account_detail] WHERE id = ?";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (ps != null) {
                ps.setInt(1, id);
                ResultSet rs = (ps != null) ? ps.executeQuery() : null;
                if (rs != null && rs.next()) {
                    AccountDetail accountDetail = AccountDetail.builder()
                            .id(rs.getInt(1))
                            .name(rs.getString(2))
                            .mobie(rs.getString(3))
                            .gender(rs.getInt(4))
                            .address(rs.getString(5))
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

    public AccountDetail getOneByAccountId(int id) {//chuwa vieets xong
        String query = "SELECT * FROM [account_detail] WHERE id = ?";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (ps != null) {
                ps.setInt(1, id);
                ResultSet rs = (ps != null) ? ps.executeQuery() : null;
                if (rs != null && rs.next()) {
                    AccountDetail accountDetail = AccountDetail.builder()
                            .id(rs.getInt(1))
                            .name(rs.getString(2))
                            .mobie(rs.getString(3))
                            .gender(rs.getInt(4))
                            .address(rs.getString(5))
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
    public boolean add(AccountDetail obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(int id, AccountDetail obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int addOrderDetailReturnId(AccountDetail obj) {
        String query = "INSERT INTO account_detail (name, mobie, gender, address ) VALUES(?, ?, ?, ?)";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS) : null;) {
            if (ps != null) {
                ps.setObject(1, obj.getName());
                ps.setObject(2, obj.getMobie());
                ps.setObject(3, obj.getGender());
                ps.setObject(4, obj.getAddress());
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

}
