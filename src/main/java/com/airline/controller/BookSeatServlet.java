package com.airline.controller;

import com.airline.dao.BookingDAO;
import com.airline.dao.SeatDAO;
import com.airline.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/bookSeat")
public class BookSeatServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session=request.getSession();

        User user=(User)session.getAttribute("loggedUser");

        if(user==null){

            response.sendRedirect("login.jsp");
            return;

        }

        int seatId=Integer.parseInt(request.getParameter("seatId"));
        int flightId=Integer.parseInt(request.getParameter("flightId"));

        BookingDAO bookingDAO=new BookingDAO();
        SeatDAO seatDAO=new SeatDAO();

        bookingDAO.createBooking(user.getUserId(),flightId,seatId);

        seatDAO.bookSeat(seatId);

        response.sendRedirect("user/myBookings.jsp");

    }

}
