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
import static util.Helper.getValidateId;

/**
 *
 * @author quang
 */
@WebServlet(name = "GetCategory", urlPatterns = {"/get-category"})
public class GetProductByCategory extends HttpServlet {

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

        int categoryId = 0;
        try (PrintWriter out = response.getWriter()) {
            try {
                categoryId = Integer.valueOf(request.getParameter("categoryId"));

            } catch (NumberFormatException e) {
                response.sendRedirect("error.jsp");
            }
            

            List<Product> allListProductCategory = new ProductDao().getProductCategory(categoryId);
            //            List<Integer> numberPage = new Helper().numberPage(listProductCategory.size());
            int countAllProductByCategory = allListProductCategory.size();
            int pageCount = new Helper().pageCount(countAllProductByCategory);//

            String raw_pageindex = request.getParameter("page");
            int pageSize = 9;
            if (raw_pageindex == null) {
                raw_pageindex = "1";
            }
            int pageIndex = Helper.getValidateId(raw_pageindex);

            List<Product> productsDisplay = new ProductDao().proceduceProductByCategory(pageIndex, pageSize, categoryId);
            
            List<String> listImageAvatar = null;
            if (!productsDisplay.isEmpty()) {
                listImageAvatar = new ImageDao().getAllImageAvatar(productsDisplay);
            }
            List<FilterPrice> listFilterPrice = new FilterPriceService().getAll();
            List<Category> listCategory = new CategoryService().getAll();

            request.setAttribute("countAllProductByCategory", countAllProductByCategory);
            request.setAttribute("categoryId", categoryId);
            request.setAttribute("pageCount", pageCount);
            request.setAttribute("pageIndex", pageIndex);
            request.setAttribute("imgAvatars", listImageAvatar);
            request.setAttribute("listProductCategory", productsDisplay);

            request.setAttribute("listFilterPrice", listFilterPrice);
            request.setAttribute("listCategory", listCategory);
            
            request.getRequestDispatcher("listProductCategory.jsp").forward(request, response);

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
