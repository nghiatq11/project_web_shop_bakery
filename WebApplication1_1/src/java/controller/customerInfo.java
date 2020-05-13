/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CustomerInfoDao;
import dao.OrderDao;
import dao.OrderDetailDao;
import entity.Account;
import entity.Cart;
import entity.CustomerInfo;
import entity.Order;
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
@WebServlet(name = "customerInfo", urlPatterns = {"/customer-info"})
public class customerInfo extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("name");
            String mobie = request.getParameter("mobie");
            String email = request.getParameter("email");
            String address = request.getParameter("address");

            CustomerInfo customerInfo = CustomerInfo.builder()
                    .name(name)
                    .mobile(mobie)
                    .email(email)
                    .address(address)
                    .build();
            int customerId = new CustomerInfoDao().addCustomerInfoReturnId(customerInfo);
            if (customerId > 0) {
                String note = request.getParameter("note");
                HttpSession session = request.getSession();
                List<Cart> listCart = (List<Cart>) session.getAttribute("listCarts");
                Account account =  (Account)session.getAttribute("LoginAccount");
                int idAccount = 0;
                if(account!=null){
                    idAccount = account.getId();
                }
                double totalPrice = 0;
                if (listCart != null) {
                    for (Cart c : listCart) {
                        totalPrice += c.getAmount();
                    }
                    
                    Order order = Order.builder()
                            .customerInfoId(customerId)
                            .totalPrice(totalPrice)
                            .note(note)
                            .status(0)
                            .accountId(idAccount)
                            .build();
                    int orderId = new OrderDao().addOrderReturnId(order);
                    if (orderId > 0) {
                        boolean isCheck = new OrderDetailDao().addlistCart(listCart, orderId);
                        if (isCheck) {
                            session.removeAttribute("listCarts");
                            response.sendRedirect("thanks.jsp");
                        } else {
                            //delete order
                            System.out.println(new OrderDao().delete(orderId));
                            //delete customer info
                            response.sendRedirect("error.jsp");
                        }
                    } else {
                        //delete customer info
                    }
                } else {

                    response.getWriter().println("bạn chưa chọn sản phẩm");
                }

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
