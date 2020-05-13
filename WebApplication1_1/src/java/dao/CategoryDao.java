/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jdbc.SQLServerConnection;

/**
 *
 * @author quang
 */
public class CategoryDao implements ICommonDao<Category> {

    private Category getValueCategory(ResultSet rs) {
        try {
            return Category.builder()
                    .id(rs.getInt(1))
                    .name(rs.getString(2))
                    .deleted(rs.getBoolean(3))
                    .build();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    private boolean setValueCategory(Category category, PreparedStatement ps) {
        if (ps != null) {
            try {

                ps.setString(1, category.getName());
                ps.setBoolean(2, category.isDeleted());
                return true;
            } catch (SQLException e) {
                e.printStackTrace(System.out);
            }
        }
        return false;
    }

    @Override
    public List<Category> getAll() {
        String query = "SELECT * FROM category WHERE deleted = 0";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            List<Category> list = new ArrayList<>();
            while (rs != null && rs.next()) {
                list.add(getValueCategory(rs));
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
    public Category getOne(int id) {
        String query = "SELECT * FROM category WHERE id = ? and deleted = 0";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (ps != null) {
                ps.setInt(1, id);
                ResultSet rs = (ps != null) ? ps.executeQuery() : null;
                if (rs != null && rs.next()) {
                    return getValueCategory(rs);
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
    public boolean add(Category category) {
        String query = "INSERT INTO category( name, deleted) VALUES(?, ?)";

        int check = 0;
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            check = setValueCategory(category, ps) ? ps.executeUpdate() : 0;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check > 0;
    }

    @Override
    public boolean update(int id, Category category) {
        String query = "UPDATE category SET name = ?,  deteled = ? WHERE id = ? AND deleted = 0";

        int check = 0;
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (setValueCategory(category, ps)) {
                ps.setInt(3, id);
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
        String query = "UPDATE category SET deleted = 1 WHERE id = ?";
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
    
    
    public static void main(String[] args) {
        List<Category> list = new CategoryDao().getAll();
        System.out.println(list.size());
    }
}
