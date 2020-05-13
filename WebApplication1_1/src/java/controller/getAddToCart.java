/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Cart;
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
import service.ImageService;
import service.ProductService;
import util.Helper;

/**
 *
 * @author quang
 */
@WebServlet(name = "getAddToCart", urlPatterns = {"/get-add-to-cart"})
public class getAddToCart extends HttpServlet {

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
            String getQuantity = request.getParameter("quantity");
            int quantity = 1;
            if (getQuantity != null) {
                quantity = Helper.getValidateId(getQuantity);
            }

            int productId = Helper.getValidateId(request.getParameter("productId"));
            System.out.println("productId_getaddtocart: "+ productId);
            Product product = new ProductService().getOne(productId);
            List<Product> listProducts = new ArrayList<>();
            listProducts.add(product);
            List<String> listImagesAvatar = new ImageService().getAllImageAvartar(listProducts);
            List<Cart> listCarts = null;
            Cart cart = Cart.builder()
                    .productId(productId)
                    .categoryId(product.getCategoryId())
                    .productLinkImg(listImagesAvatar.get(0))
                    .productName(product.getName())
                    .productPrice(product.getPrice())
                    .quantity(quantity)
                    .amount(product.getPrice() * quantity)
                    .build();

            HttpSession session = request.getSession();
            listCarts = (List<Cart>) session.getAttribute("listCarts");
            if (listCarts == null) {
                listCarts = new ArrayList<>();
                listCarts.add(cart);
                session.setAttribute("listCarts", listCarts);
            } else {
                boolean flag = true;
                for (Cart cart1 : listCarts) {
                    if (cart1.getProductId() == productId) {
                        cart1.setQuantity(cart1.getQuantity() + quantity);
                        cart1.setAmount(cart1.getProductPrice() * cart1.getQuantity());
                        flag = false;
                    }
                }
                if (flag) {
                    listCarts.add(cart);
                }

            }
            String link = request.getParameter("linkPrevious");
            System.out.println("add to cart"+link);
            String page = request.getParameter("page");
            if(page!=null){
                link+="&page="+page;
            }
            String categoryId = request.getParameter("categoryId");
            if(categoryId!=null){
                link+="&categoryId="+categoryId;
            }
            if(link!=null){
                request.setAttribute("toast", request.getParameter("productId"));
//                request.getRequestDispatcher(link).forward(request, response);
                response.sendRedirect(link);
                
            }else{
                response.sendRedirect("get-list-product");
                
            }
           
//            request.getRequestDispatcher("cart.jsp").forward(request, response);

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
