package com.airline.controller;

import com.airline.dao.BookingDAO;
import com.airline.dao.SeatDAO;
import com.airline.dao.PaymentDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/cancelBooking")
public class CancelBookingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int bookingId = Integer.parseInt(request.getParameter("id"));

        BookingDAO bookingDAO = new BookingDAO();
        PaymentDAO paymentDAO = new PaymentDAO();
        SeatDAO seatDAO = new SeatDAO();

        int seatId = bookingDAO.getSeatIdByBooking(bookingId);

// Delete payment first
        paymentDAO.deletePaymentByBookingId(bookingId);

// Delete booking
        bookingDAO.deleteBooking(bookingId);

// Make seat available again
        seatDAO.makeSeatAvailable(seatId);

        response.sendRedirect("user/myBookings.jsp");
    }
}
