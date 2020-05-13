/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Category;
import entity.FilterPrice;
import entity.Image;
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
public class FilterPriceDao implements ICommonDao<FilterPrice> {

    private FilterPrice getValueFilterPrice(ResultSet rs) {
        try {
            return FilterPrice.builder()
                    .id(rs.getInt(1))
                    .priceFrom(rs.getInt(2))
                    .toPrice(rs.getInt(3))
                    .deleted(rs.getBoolean(4))
                    .build();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    private boolean setValueFilterPrice(FilterPrice filterPrice, PreparedStatement ps) {
        if (ps != null) {
            try {
                ps.setInt(2, filterPrice.getPriceFrom());
                ps.setInt(3, filterPrice.getToPrice());
                ps.setBoolean(4, filterPrice.isDeleted());
                return true;
            } catch (SQLException e) {
                e.printStackTrace(System.out);
            }
        }
        return false;
    }

    @Override
    public List<FilterPrice> getAll() {
        String query = "SELECT * FROM filter_price WHERE deleted = 0";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            List<FilterPrice> list = new ArrayList<>();
            while (rs != null && rs.next()) {
                list.add(getValueFilterPrice(rs));
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
    public FilterPrice getOne(int id) {
        String query = "SELECT * FROM filter_price WHERE id = ? and deleted = 0";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (ps != null) {
                ps.setInt(1, id);
                ResultSet rs = (ps != null) ? ps.executeQuery() : null;
                if (rs != null && rs.next()) {
                    return getValueFilterPrice(rs);
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
    public boolean add(FilterPrice filterPrice) {
        String query = "INSERT INTO filter_price( price_from, to_from, deleted) VALUES(?, ?, ?)";

        int check = 0;
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            check = setValueFilterPrice(filterPrice, ps) ? ps.executeUpdate() : 0;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check > 0;
    }

    @Override
    public boolean update(int id, FilterPrice filterPrice) {
        String query = "UPDATE filter_price SET price_from = ?, to_price = ?, deteled = ? WHERE id = ? AND deleted = 0";

        int check = 0;
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (setValueFilterPrice(filterPrice, ps)) {
                ps.setInt(4, id);
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
        String query = "UPDATE filter_price SET deleted = 1 WHERE id = ?";
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
//    public static void main(String[] args) {
//        List<FilterPrice> list = new FilterPriceDao().getAll();
//        System.out.println(list.get(0).getPriceFrom()+"-"+list.get(0).getToPrice());
//    }
}
