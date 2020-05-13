/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDao;
import entity.Account;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author quang
 */
@WebFilter(filterName = "loginFilter", urlPatterns = {"/go-checkout"})
public class loginFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("LoginAccount");
        if (account != null) {
            chain.doFilter(request, response);
        } else {
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            account = new AccountDao().login(email, password);

            if (account == null) {
                request.setAttribute("message", "Đăng Nhập");
                request.getRequestDispatcher("signin.jsp").forward(request, response);
//                response.sendRedirect("loginForm/signin.jsp");
            } else {
                session.setAttribute("LoginAccount", account);
                chain.doFilter(request, response);
            }
        }

    }

    public void destroy() {
    }

}
