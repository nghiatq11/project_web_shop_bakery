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
import entity.Image;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.CategoryService;
import service.FilterPriceService;
import util.Helper;
import static util.Helper.getValidateId;

/**
 *
 * @author quang
 */
@WebServlet(name = "processRequest", urlPatterns = {"/process-request"})
public class ProcessRequest extends HttpServlet {

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

            
            String raw_pageindex = request.getParameter("page");
            if (raw_pageindex == null) {
                raw_pageindex = "1";
            }
            int pageIndex = Helper.getValidateId(raw_pageindex);

            List<Product> listSearch = null;
            List<String> imageAvatars = null;
            String text = request.getParameter("search");
            
            if (text != null) {
                listSearch = new ProductDao().proceduceSearchProduct(1, 9, text);
                
                if(listSearch.size()<=0){
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
                
                imageAvatars = new ImageDao().getAllImageAvatar(listSearch);
                HttpSession sessionSearch = request.getSession();
                sessionSearch.setAttribute("sessionSearch", text);
            } else {
                String search = (String) request.getSession().getAttribute("sessionSearch");
                listSearch = new ProductDao().proceduceSearchProduct(pageIndex, 9, search);
                imageAvatars = new ImageDao().getAllImageAvatar(listSearch);
            }
            

            ProductDao productDao = new ProductDao();
            List<Product> products = productDao.search((String) request.getSession().
                    getAttribute("sessionSearch"), 1); //lấy ra hết các sản phẩn có type  là 1 và tìm kiếm bởi từ đc luuw trong session
            int countAllProductBySeach = products.size();
            int pageCount = new Helper().pageCount(countAllProductBySeach);
            
            List<Category> listCategory = new CategoryService().getAll();
            List<FilterPrice> listFilterPrice = new FilterPriceService().getAll();
            request.setAttribute("listCategory", listCategory);
            request.setAttribute("listFilterPrice", listFilterPrice);

//            List<Integer> numberPages = new Helper().numberPage(products.size());
            request.setAttribute("countAllProductBySeach", countAllProductBySeach);
            request.setAttribute("pageIndex", pageIndex);
            request.setAttribute("pageCount", pageCount);
            request.setAttribute("listSearch", listSearch);
            request.setAttribute("imageAvatars", imageAvatars);

            request.getRequestDispatcher("listProductSearch.jsp").forward(request, response);

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
