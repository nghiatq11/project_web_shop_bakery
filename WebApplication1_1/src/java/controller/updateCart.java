/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Cart;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author quang
 */
@WebServlet(name = "updateCart", urlPatterns = {"/update-cart"})
public class updateCart extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */

            HttpSession session = request.getSession();
            List<Cart> listCarts = (List<Cart>) session.getAttribute("listCarts");
            String str = request.getParameter(String.valueOf(listCarts.get(0).getProductId()));
            System.out.println("nghia: " + str);
            for (int i = 0; i < listCarts.size(); i++) {
                int quantity = Integer.valueOf(request.getParameter(String.valueOf(listCarts.get(i).getProductId())));
                listCarts.get(i).setQuantity(quantity);
                listCarts.get(i).setAmount(listCarts.get(i).getProductPrice() * listCarts.get(i).getQuantity());
            }
            response.sendRedirect("cart.jsp");
//            for (Cart cart1 : listCarts) {
//                    if (cart1.getProductId() == productId) {
//                        cart1.setQuantity(cart1.getQuantity() + quantity);
//                        cart1.setAmount(cart1.getProductPrice() * cart1.getQuantity());
//                        
//                    }
//                }
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
