package com.airline.controller;

import com.airline.dao.FlightDAO;
import com.airline.model.Flight;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/addFlight")
public class AddFlightServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        Flight flight = new Flight();

        flight.setFlightNumber(request.getParameter("flightNumber"));
        flight.setAirline(request.getParameter("airline"));
        flight.setOrigin(request.getParameter("origin"));
        flight.setDestination(request.getParameter("destination"));
        flight.setDepartureDate(request.getParameter("departureDate"));
        flight.setDepartureTime(request.getParameter("departureTime"));
        flight.setArrivalTime(request.getParameter("arrivalTime"));
        flight.setPrice(Double.parseDouble(request.getParameter("price")));

        FlightDAO dao = new FlightDAO();

        if (dao.addFlight(flight)) {
            response.sendRedirect("admin/flights.jsp");
        } else {
            response.sendRedirect("admin/addFlight.jsp");
        }
    }
}