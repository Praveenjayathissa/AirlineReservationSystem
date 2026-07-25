package com.airline.controller;

import com.airline.dao.UserDAO;
import com.airline.model.User;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Register button clicked!");


        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String passport = request.getParameter("passportNo");

        User user = new User();

        user.setFullName(fullName);
        user.setEmail(email);
        user.setPassword(password);
        user.setPhone(phone);
        user.setPassportNo(passport);

        UserDAO dao = new UserDAO();

        if(dao.registerUser(user)){

            response.sendRedirect("login.jsp");

        }else{

            response.sendRedirect("register.jsp");

        }

    }

}
