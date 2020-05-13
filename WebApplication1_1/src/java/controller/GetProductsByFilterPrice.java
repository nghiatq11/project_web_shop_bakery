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
import util.Helper;

/**
 *
 * @author quang
 */
@WebServlet(name = "GetProductsByFilterPrice", urlPatterns = {"/get-products-by-filter-price"})
public class GetProductsByFilterPrice extends HttpServlet {

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
            int idFilterPrice = 0;
            boolean flag = true;
            try {
                idFilterPrice = Integer.valueOf(request.getParameter("idFilterPrice"));
                System.out.println("koke");
            } catch (NumberFormatException e) {
                flag = false;
                response.sendRedirect("error.jsp");
            }
            if (flag) {
                FilterPrice filterPrice = new FilterPriceService().getOne(idFilterPrice);
                List<Category> listCategory = new CategoryDao().getAll();
                List<FilterPrice> listFilterPrice = new FilterPriceService().getAll();

                List<String> imgAvatars = null;
                
                double priceFrom = Double.valueOf(filterPrice.getPriceFrom());
                double toPrice = Double.valueOf(filterPrice.getToPrice());
                //list tất cả các sản phẩm
                List<Product> allListProductByFilterPrice = new ProductDao().
                        getAllProductByFilterPrice(priceFrom, toPrice);
                int countAllProductByFilterPrice = allListProductByFilterPrice.size();

                //đoạn phân trang
                int pageCount = new Helper().pageCount(countAllProductByFilterPrice);
                String raw_pageindex = request.getParameter("page");
                int pageSize = 9;
                if (raw_pageindex == null) {
                    raw_pageindex = "1";
                }
                int pageIndex = Helper.getValidateId(raw_pageindex);
                System.out.println("pageIndex = " + pageIndex);

                //list sản phẩm trong 1 trang
                List<Product> products = new ProductDao().proceduceProductByPrice(pageIndex, pageSize, priceFrom, toPrice);
                System.out.println("size = "+  allListProductByFilterPrice.size());
                if (!products.isEmpty()) {
                    imgAvatars = new ImageDao().getAllImageAvatar(products);
                }
                request.setAttribute("countAllProductByFilterPrice", countAllProductByFilterPrice);
                request.setAttribute("pageCount", pageCount);
                request.setAttribute("pageIndex", pageIndex);
                request.setAttribute("products", products);
                request.setAttribute("imgAvatars", imgAvatars);
                request.setAttribute("idFilterPrice", idFilterPrice);

                request.setAttribute("listFilterPrice", listFilterPrice);
                request.setAttribute("listCategory", listCategory);
                
                request.getRequestDispatcher("listProductFilterPrice.jsp").forward(request, response);
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
