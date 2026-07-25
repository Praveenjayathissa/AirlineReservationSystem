package com.airline.controller;

import com.airline.dao.AdminDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String username =
                request.getParameter("username");

        String password =
                request.getParameter("password");

        AdminDAO dao = new AdminDAO();

        if(dao.login(username,password)){

            HttpSession session =
                    request.getSession();

            session.setAttribute("admin",username);

            response.sendRedirect("admin/dashboard.jsp");

        }else{

            response.sendRedirect("admin/adminLogin.jsp");

        }

    }

}