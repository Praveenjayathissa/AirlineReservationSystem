package com.airline.controller;

import com.airline.dao.FlightDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/deleteFlight")
public class DeleteFlightServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        FlightDAO dao = new FlightDAO();

        dao.deleteFlight(id);

        response.sendRedirect("admin/flights.jsp");
    }
}