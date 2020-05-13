/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ImageDao;
import dao.ProductDao;
import entity.Category;
import entity.FilterPrice;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CategoryService;
import service.FilterPriceService;
import util.Helper;

/**
 *
 * @author quang
 */
@WebServlet(name = "NewServlet", urlPatterns = {"/get-list-product"})
public class GetListProduct extends HttpServlet {

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
            int pageSize = 9;
            
            
            int countAllProduct = new ProductDao().countAllProduct();
            
            int pageCount = new Helper().pageCount(countAllProduct);
            
            String raw_pageindex = request.getParameter("page");
            if (raw_pageindex == null) {
                raw_pageindex = "1";
            }
            int pageIndex = Helper.getValidateId(raw_pageindex);
            boolean flag = true;
            List<Product> list = null;
            if (pageIndex >= 1) {
                list = new ProductDao().proceduceAllProduct(pageIndex, pageSize);
            } else {
                response.sendRedirect("error.jsp");
                flag = false;
            }
                    
            if (flag == true) {
                List<String> listImageAvatar = new ImageDao().getAllImageAvatar(list);
                List<Category> listCategory = new CategoryService().getAll();
                List<FilterPrice> listFilterPrice = new FilterPriceService().getAll();
                
                request.setAttribute("countAllProduct", countAllProduct);
                request.setAttribute("pageCount", pageCount);
                request.setAttribute("pageIndex", pageIndex);
                request.setAttribute("result", list);
                request.setAttribute("imgAvatars", listImageAvatar);
                request.setAttribute("listCategory", listCategory);
                request.setAttribute("listFilterPrice", listFilterPrice);
                
                request.getRequestDispatcher("index2.jsp").forward(request, response);
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
