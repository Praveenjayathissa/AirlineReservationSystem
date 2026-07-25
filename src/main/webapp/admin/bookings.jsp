<%@ page import="java.util.List" %>
<%@ page import="com.airline.dao.BookingDAO" %>
<%@ page import="com.airline.model.BookingDetails" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
String admin = (String) session.getAttribute("admin");

if(admin == null){
    response.sendRedirect("adminLogin.jsp");
    return;
}

BookingDAO bookingDAO = new BookingDAO();

String search = request.getParameter("search");

List<BookingDetails> bookings;

if(search != null && !search.trim().isEmpty()){

    bookings = bookingDAO.searchBookings(search);

}else{

    bookings = bookingDAO.getAllBookingDetails();

}
%>

<!DOCTYPE html>
<html>

<head>

    <title>Manage Bookings</title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

    <link rel="stylesheet" href="../assets/css/style.css">

</head>

<body class="bg-light d-flex flex-column min-vh-100">

<main class="flex-grow-1">

<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow">

    <div class="container">

        <a class="navbar-brand fw-bold" href="dashboard.jsp">

            ✈ SkyJet Airlines Admin

        </a>

        <div>

            <a href="dashboard.jsp" class="btn btn-light btn-sm me-2">

                <i class="bi bi-speedometer2"></i>

                Dashboard

            </a>

            <a href="../index.jsp" class="btn btn-outline-light btn-sm">

                <i class="bi bi-box-arrow-right"></i>

                Logout

            </a>

        </div>

    </div>

</nav>

<div class="container mt-5">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>

            <h2 class="fw-bold">

                Booking Management

            </h2>

            <p class="text-muted">

                View all customer bookings.

            </p>

        </div>

    </div>

    <div class="card shadow-sm border-0 mb-4">

        <div class="card-body">

            <form method="get">

                <div class="row">

                    <div class="col-md-10">

                        <input
                                type="text"
                                name="search"
                                class="form-control"
                                placeholder="Search by passenger name or flight number..."
                                value="<%= search == null ? "" : search %>">

                    </div>

                    <div class="col-md-2 d-grid">

                        <button class="btn btn-primary">

                            <i class="bi bi-search"></i>

                            Search

                        </button>

                    </div>

                </div>

            </form>

        </div>

    </div>

    <div class="card shadow border-0">

        <div class="card-body">

            <div class="table-responsive">

                <table class="table table-hover align-middle">

                    <thead class="table-primary">

                    <tr>

                        <th>ID</th>
                        <th>Passenger</th>
                        <th>Flight</th>
                        <th>Route</th>
                        <th>Seat</th>
                        <th>Amount</th>
                        <th>Method</th>
                        <th>Date</th>

                    </tr>

                    </thead>

                    <tbody>

                    <%

                        if(bookings.isEmpty()){

                    %>

                    <tr>

                        <td colspan="8" class="text-center py-5">

                            <i class="bi bi-ticket-perforated fs-1 text-secondary"></i>

                            <h5 class="mt-3">

                                No Bookings Found

                            </h5>

                        </td>

                    </tr>

                    <%

                        }else{

                            for(BookingDetails booking : bookings){

                    %>

                    <tr>

                        <td>
                            <%= booking.getBookingId() %>
                        </td>

                        <td>
                            <strong><%= booking.getPassengerName() %></strong>
                        </td>

                        <td>
                            <%= booking.getFlightNumber() %>
                        </td>

                        <td>

                            <%= booking.getOrigin() %>

                            <i class="bi bi-arrow-right"></i>

                            <%= booking.getDestination() %>

                        </td>

                        <td>

                            <span class="badge bg-info">

                                <%= booking.getSeatNumber() %>

                            </span>

                        </td>

                        <td>

                            $<%= booking.getAmount() %>

                        </td>

                        <td>

                            <span class="badge bg-success">

                                <%= booking.getPaymentMethod() %>

                            </span>

                        </td>

                        <td>

                            <%= booking.getBookingDate() %>

                        </td>

                    </tr>

                    <%

                            }

                        }

                    %>

                    </tbody>

                </table>

            </div>

        </div>

    </div>

</div>

</main>

<footer class="bg-dark text-white text-center mt-5 p-3">

    © 2026 Skyra Airlines | Admin Portal

</footer>

</body>

</html>