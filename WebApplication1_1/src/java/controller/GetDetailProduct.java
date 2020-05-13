/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CategoryDao;
import dao.ImageDao;
import dao.ProductDao;
import entity.Category;
import entity.FilterPrice;
import entity.Image;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.FilterPriceService;
import service.ImageService;

/**
 *
 * @author quang
 */
@WebServlet(name = "GetDetailProduct", urlPatterns = {"/get-detail-product"})
public class GetDetailProduct extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int productId = 0;
            int categoryId = 0;
            boolean flag = true;
            try {
                productId = Integer.valueOf(request.getParameter("productId"));
                categoryId = Integer.valueOf(request.getParameter("categoryId"));
            } catch (NumberFormatException e) {
                flag = false;
                response.sendRedirect("error.jsp");
            }
            
            Product product = new ProductDao().getOne(productId);
            Image image = new ImageDao().getOneByProductId(productId);
            List<Category> listCategory = new CategoryDao().getAll();
            if (categoryId > listCategory.get(listCategory.size() - 1).getId()) {
                flag = false;
                response.sendRedirect("error.jsp");
            }
            
            if (flag) {
                List<Product> productRelatives = new ProductDao().getProductRelative(categoryId);
                List<String> imageProductRelative = new ImageDao().getAllImageAvatar(productRelatives);
                List<Image> listSubImg = new ImageService().getAllSubImg(new ImageService().getAll(), productId);
                List<FilterPrice> listFilterPrice = new FilterPriceService().getAll();
                request.setAttribute("productId", productId);
                request.setAttribute("productDetail", product);
                request.setAttribute("imgAvatar", image);
                request.setAttribute("listCategory", listCategory);
                request.setAttribute("productRelatives", productRelatives);
                request.setAttribute("imageProductRelative", imageProductRelative);
                request.setAttribute("listSubImg", listSubImg);
                request.setAttribute("listFilterPrice", listFilterPrice);
                request.setAttribute("link", "/get-detail-product");
                request.getRequestDispatcher("detail.jsp").forward(request, response);
            }
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
