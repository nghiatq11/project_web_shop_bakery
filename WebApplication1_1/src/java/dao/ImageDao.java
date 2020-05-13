/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Image;
import entity.Product;
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
public class ImageDao implements ICommonDao<Image> {

    private Image getValueImage(ResultSet rs) {
        try {
            return Image.builder()
                    .id(rs.getInt(1))
                    .productId(rs.getInt(2))
                    .linkImg(rs.getString(3))
                    .cover(rs.getBoolean(4))
                    .deleted(rs.getBoolean(5))
                    .build();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    private boolean setValueImage(Image image, PreparedStatement ps) {
        if (ps != null) {
            try {
                ps.setInt(1, image.getProductId());
                ps.setString(2, image.getLinkImg());
                ps.setBoolean(3, image.isCover());
                ps.setBoolean(4, image.isDeleted());
                return true;
            } catch (SQLException e) {
                e.printStackTrace(System.out);
            }
        }
        return false;
    }

    @Override
    public List<Image> getAll() {
        String query = "SELECT * FROM image WHERE deleted = 0";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            List<Image> list = new ArrayList<>();
            while (rs != null && rs.next()) {
                list.add(getValueImage(rs));
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
    public Image getOne(int id) {

        String query = "SELECT * FROM image WHERE id = ? and deleted = 0";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (ps != null) {
                ps.setInt(1, id);
                ResultSet rs = (ps != null) ? ps.executeQuery() : null;
                if (rs != null && rs.next()) {
                    return getValueImage(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Image getOneByProductId(int productId) {

        String query = "SELECT * FROM image WHERE product_id = ? and deleted = 0";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (ps != null) {
                ps.setInt(1, productId);
                ResultSet rs = (ps != null) ? ps.executeQuery() : null;
                if (rs != null && rs.next()) {
                    return getValueImage(rs);
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
    public boolean add(Image image) {
        String query = "INSERT INTO image(Product_id, link_img, cover, deleted) VALUES(?, ?, ?, ?)";

        int check = 0;
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            check = setValueImage(image, ps) ? ps.executeUpdate() : 0;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check > 0;
    }

    @Override
    public boolean update(int id, Image image) {

        String query = "UPDATE image SET Product_id = ?, link_img = ?, cover = ?, "
                + "delete = ? WHERE id = ? AND deleted = 0";

        int check = 0;
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (setValueImage(image, ps)) {
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
        String query = "UPDATE image SET deleted = 1 WHERE id = ?";
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

    public List<String> getAllImageAvatar(List<Product> product) {
        String query = getQueryAllImageAvatar(product);
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            List<String> listImg = new ArrayList<>();
            if (rs != null && rs.next()) {
                for (int i = 1; i <= product.size(); i++) {
                    listImg.add(rs.getString(i));
                }
            }
            return listImg;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    private String getQueryAllImageAvatar(List<Product> product) {
        String select = "";
        String from = "";
        for (int i = 0; i < product.size(); i++) {
            select += "t" + i + ".c, ";
            from += "(SELECT link_img AS c FROM image WHERE product_id=" + product.get(i).getId() + " AND cover = 1) as t" + i + ",";
        }
        from = from.substring(0, from.length() - 1);
        select = select.substring(0, select.length() - 2);
        String result = "SELECT " + select + " FROM " + from;
        return result;
    }
    
    

//    public static void main(String[] args) {
//        ImageDao imageDao = new ImageDao();
//        List<String> images = imageDao.getAllImageAvatar(new ProductDao().getAll());
//        System.out.println(images);
//    }
}
