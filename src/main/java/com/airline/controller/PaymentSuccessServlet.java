package com.airline.controller;

import com.airline.dao.BookingDAO;
import com.airline.dao.PaymentDAO;
import com.airline.dao.SeatDAO;
import com.airline.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/paymentSuccess")
public class PaymentSuccessServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("loggedUser");

        int flightId = Integer.parseInt(request.getParameter("flightId"));
        int seatId = Integer.parseInt(request.getParameter("seatId"));
        double amount = Double.parseDouble(request.getParameter("amount"));
        String paymentMethod = request.getParameter("paymentMethod");

        BookingDAO bookingDAO = new BookingDAO();
        SeatDAO seatDAO = new SeatDAO();
        PaymentDAO paymentDAO = new PaymentDAO();

        // Create booking
        bookingDAO.createBooking(user.getUserId(), flightId, seatId);

        // Mark seat as booked
        seatDAO.bookSeat(seatId);

        // Get booking ID (latest booking by this user)
        int bookingId = bookingDAO.getLatestBookingId(user.getUserId());

        // Generate transaction ID
        String transactionId = "TXN" + System.currentTimeMillis();

        // Save payment
        paymentDAO.savePayment(
                bookingId,
                transactionId,
                amount,
                paymentMethod
        );

        response.sendRedirect("user/paymentReceipt.jsp?txn=" + transactionId);
    }
}
