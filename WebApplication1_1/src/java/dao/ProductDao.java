/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Product;
import java.sql.CallableStatement;
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
public class ProductDao implements ICommonDao<Product> {

    private Product getValueProduct(ResultSet rs) {
        try {
            return Product.builder()
                    .id(rs.getInt(1))
                    .brandId(rs.getInt(2))
                    .categoryId(rs.getInt(3))
                    .name(rs.getString(4))
                    .price(rs.getDouble(5))
                    .descripsion(rs.getString(6))
                    .status(rs.getInt(7))
                    .deleted(rs.getBoolean(8))
                    .build();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    private boolean setValueProduct(Product product, PreparedStatement ps) {
        if (ps != null) {
            try {
                ps.setObject(1, product.getBrandId());
                ps.setObject(2, product.getCategoryId());
                ps.setObject(3, product.getName());
                ps.setObject(4, product.getPrice());
                ps.setObject(5, product.getDescripsion());
                ps.setObject(6, product.getStatus());
                ps.setObject(7, product.isDeleted());
                return true;
            } catch (SQLException e) {
                e.printStackTrace(System.out);
            }
        }
        return false;
    }

    @Override
    public List<Product> getAll() {

        String query = "SELECT * FROM product WHERE deleted = 0";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            List<Product> list = new ArrayList<>();
            while (rs != null && rs.next()) {
                list.add(getValueProduct(rs));
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
    public Product getOne(int id) {
        String query = "SELECT * FROM product WHERE id = ? and deleted = 0";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (ps != null) {
                ps.setInt(1, id);
                ResultSet rs = (ps != null) ? ps.executeQuery() : null;
                if (rs != null && rs.next()) {
                    return getValueProduct(rs);
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
    public boolean add(Product product) {
        String query = "INSERT INTO product(brand_id, category_id, name, price, description, status, deleted) VALUES( ?, ?, ?, ?, ?, ?, ?)";

        int check = 0;
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            check = setValueProduct(product, ps) ? ps.executeUpdate() : 0;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check > 0;
    }

    @Override
    public boolean update(int id, Product product) {
        String query = "UPDATE product SET brand_id = ?, type_id = ?, name = ?, price = ?, description = ?, status = ?, deteled = ? WHERE id = ? AND deleted = 0";

        int check = 0;
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (setValueProduct(product, ps)) {
                ps.setInt(8, id);
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
        String query = "UPDATE product SET deleted = 1 WHERE id = ?";
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

    public int countAllProduct() {
        String sql = "SELECT COUNT(*) as rownum FROM product where deleted = 0";
        try {
            Connection connection = SQLServerConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("rownum");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return -1;
    }

//    public int countProductByCategoryId(int categoryId){
//        String sql = "SELECT COUNT(*) as rownum FROM product where category_id = ?";
//        try {
//            Connection connection = SQLServerConnection.getConnection();
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setInt(1, categoryId);
//            ResultSet rs = ps.executeQuery();
//            if(rs.next())
//            {
//                return rs.getInt("rownum");
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        
//        return -1;
//    }
    public List<Product> getProductCategory(int categoryId) {

        String query = "SELECT * FROM product WHERE category_id = ? AND deleted = 0";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            ps.setInt(1, categoryId);
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            List<Product> listCategory = new ArrayList<>();
            while (rs != null && rs.next()) {
                listCategory.add(getValueProduct(rs));
            }
            return listCategory;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Product> getProductRelative(int categoryId) {
        String query = "SELECT TOP 3 * FROM product where category_id = ? and deleted = 0 ORDER BY NEWID()";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            ps.setInt(1, categoryId);
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            List<Product> listCategory = new ArrayList<>();
            while (rs != null && rs.next()) {
                listCategory.add(getValueProduct(rs));
            }
            return listCategory;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Product> getAllProductByFilterPrice(double priceFrom, double toPrice) {
        String query = "SELECT * FROM product WHERE price >= ? and price < ? and deleted = 0";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            ps.setDouble(1, priceFrom);
            ps.setDouble(2, toPrice);
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            List<Product> listCategory = new ArrayList<>();
            while (rs != null && rs.next()) {
                listCategory.add(getValueProduct(rs));
            }
            return listCategory;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

//            CallableStatement statement = connection.prepareCall(query);
//            statement.setString(1, "all");
//            statement.execute();
//    
    public List<Product> proceduceAllProduct(int page, int quantyProduct) {      //phân trang tất cả các sản phẩm
        String query = "spGetRecordsByPageAndSize ?, ?";
        try (Connection con = SQLServerConnection.getConnection();
                CallableStatement ps = (con != null) ? con.prepareCall(query) : null) {
            ps.setInt(1, page);
            ps.setInt(2, quantyProduct);
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            List<Product> listCategory = new ArrayList<>();
            while (rs != null && rs.next()) {
                listCategory.add(getValueProduct(rs));
            }
            return listCategory;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //phân trang khi filter by filterPrice
    public List<Product> proceduceProductByPrice(int page, int quantyProductInAPage, double priceFrom, double toPrice) {
        String query = "spGetRecordsByPageAndSizeAndFilterPrice ?, ?, ?, ?";
        try (Connection con = SQLServerConnection.getConnection();
                CallableStatement ps = (con != null) ? con.prepareCall(query) : null) {
            ps.setInt(1, page);
            ps.setInt(2, quantyProductInAPage);
            ps.setDouble(3, priceFrom);
            ps.setDouble(4, toPrice);
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            List<Product> list = new ArrayList<>();
            while (rs != null && rs.next()) {
                list.add(getValueProduct(rs));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //phân trang khi filter by category
    public List<Product> proceduceProductByCategory(int page, int quantyProductInAPage, int categoryId) {
        String query = "spGetRecordsByPageAndSizeAndCategory ?, ?, ?";
        try (Connection con = SQLServerConnection.getConnection();
                CallableStatement ps = (con != null) ? con.prepareCall(query) : null) {
            ps.setInt(1, page);
            ps.setInt(2, quantyProductInAPage);
            ps.setInt(3, categoryId);
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            List<Product> listCategory = new ArrayList<>();
            while (rs != null && rs.next()) {
                listCategory.add(getValueProduct(rs));
            }
            return listCategory;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Product> proceduceTopProductNew(int page, int quantyProductInAPage, int numberProductsDisplay) {
        String query = "pagingTopProducts ?, ?, ?";
        try (Connection con = SQLServerConnection.getConnection();
                CallableStatement ps = (con != null) ? con.prepareCall(query) : null) {
            ps.setInt(1, page);
            ps.setInt(2, quantyProductInAPage);
            ps.setInt(3, numberProductsDisplay);
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            List<Product> listCategory = new ArrayList<>();
            while (rs != null && rs.next()) {
                listCategory.add(getValueProduct(rs));
            }
            return listCategory;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Product> search(String text, int type) {
        String query = "Select * FROM product";
        if (type == 1) {
            query += " WHERE name LIKE ? and deleted = 0";
        } else {
            query += " WHERE category_id = ? ";
        }
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            ps.setString(1, "%" + text + "%");
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            List<Product> list = new ArrayList<>();
            while (rs != null && rs.next()) {
                list.add(getValueProduct(rs));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Product> proceduceSearchProduct(int page, int quantyProductInAPage, String nameProduct) {
        String query = "pagingSearchProducts ?, ?, ?";
        try (Connection con = SQLServerConnection.getConnection();
                CallableStatement ps = (con != null) ? con.prepareCall(query) : null) {
            ps.setInt(1, page);
            ps.setInt(2, quantyProductInAPage);
            ps.setString(3, nameProduct);
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            List<Product> listCategory = new ArrayList<>();
            while (rs != null && rs.next()) {
                listCategory.add(getValueProduct(rs));
            }
            return listCategory;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Product> getAllOrderByPriceASC(int pageindex, int pagesize) {

        String query = "SELECT * FROM\n"
                + "	(SELECT *,ROW_NUMBER() OVER (ORDER BY price ASC) as row_num FROM  product where deleted = 0) tblProduct\n"
                + "WHERE row_num >= (? - 1)*? +1 AND row_num<= ? * ?";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            ps.setInt(1, pageindex);
            ps.setInt(2, pagesize);
            ps.setInt(3, pageindex);
            ps.setInt(4, pagesize);
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            List<Product> list = new ArrayList<>();
            while (rs != null && rs.next()) {
                list.add(getValueProduct(rs));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public List<Product> getAllOrderByPriceDESC(int pageindex, int pagesize) {

        String query = "SELECT * FROM\n"
                + "	(SELECT *,ROW_NUMBER() OVER (ORDER BY price DESC) as row_num FROM  product where deleted = 0) tblProduct\n"
                + "WHERE row_num >= (? - 1)*? +1 AND row_num<= ? * ?";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            ps.setInt(1, pageindex);
            ps.setInt(2, pagesize);
            ps.setInt(3, pageindex);
            ps.setInt(4, pagesize);
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            List<Product> list = new ArrayList<>();
            while (rs != null && rs.next()) {
                list.add(getValueProduct(rs));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public List<Product> getAllOrderByNameASC(int pageindex, int pagesize) {

        String query = "SELECT * FROM\n"
                + "	(SELECT *,ROW_NUMBER() OVER (ORDER BY name ASC) as row_num FROM  product where deleted = 0) tblProduct\n"
                + "WHERE row_num >= (? - 1)*? +1 AND row_num<= ? * ?";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            ps.setInt(1, pageindex);
            ps.setInt(2, pagesize);
            ps.setInt(3, pageindex);
            ps.setInt(4, pagesize);
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            List<Product> list = new ArrayList<>();
            while (rs != null && rs.next()) {
                list.add(getValueProduct(rs));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public List<Product> getAllOrderByNameDESC(int pageindex, int pagesize) {

        String query = "SELECT * FROM\n"
                + "	(SELECT *,ROW_NUMBER() OVER (ORDER BY name DESC) as row_num FROM  product where deleted = 0) tblProduct\n"
                + "WHERE row_num >= (? - 1)*? +1 AND row_num<= ? * ?";
        try (Connection con = SQLServerConnection.getConnection();
                PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            ps.setInt(1, pageindex);
            ps.setInt(2, pagesize);
            ps.setInt(3, pageindex);
            ps.setInt(4, pagesize);
            ResultSet rs = (ps != null) ? ps.executeQuery() : null;
            List<Product> list = new ArrayList<>();
            while (rs != null && rs.next()) {
                list.add(getValueProduct(rs));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        Product product = Product.builder()
                .brandId(1)
                .name("aaa")
                .price(15000)
                .descripsion("aaaa")
                .status(1)
                .categoryId(2)
                .deleted(false)
                .build();
        System.out.println(new ProductDao().getAllOrderByPriceASC(1, 8));
    }

}
