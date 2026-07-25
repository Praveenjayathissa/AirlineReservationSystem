<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.airline.dao.BookingDAO" %>
<%@ page import="com.airline.model.Booking" %>
<%@ page import="com.airline.model.User" %>


<%
User user = (User) session.getAttribute("loggedUser");

if(user == null){
    response.sendRedirect("../login.jsp");
    return;
}

BookingDAO dao = new BookingDAO();

List<Booking> bookings = dao.getBookingsByUser(user.getUserId());
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>My Bookings</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
          rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">

    <link rel="stylesheet"
          href="../assets/css/style.css">

</head>

<body>

<!-- Navbar -->

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">

    <div class="container">

        <a class="navbar-brand fw-bold"
           href="../dashboard.jsp">

              Skyra Airlines

        </a>

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav">

            <span class="navbar-toggler-icon"></span>

        </button>

        <div class="collapse navbar-collapse"
             id="navbarNav">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">

                    <a class="nav-link"
                       href="../dashboard.jsp">

                        Dashboard

                    </a>

                </li>

            </ul>

        </div>

    </div>

</nav>

<div class="container py-5">

    <div class="bookings-header text-center mb-5">

        <h1>

            <i class="bi bi-journal-check"></i>

            My Flight Bookings

        </h1>

        <p class="text-muted">

            View and manage all your airline reservations.

        </p>

    </div>

    <div class="card bookings-card">

        <div class="card-header bg-primary text-white">

            <h4 class="mb-0">

                <i class="bi bi-airplane-fill"></i>

                Booking History

            </h4>

        </div>

        <div class="card-body p-0">

            <div class="table-responsive">

                <table class="table table-hover align-middle mb-0">

                    <thead class="table-dark">

                    <tr>

                        <th>ID</th>

                        <th>Flight</th>

                        <th>Origin</th>

                        <th>Destination</th>

                        <th>Departure</th>

                        <th>Seat</th>

                        <th>Status</th>

                        <th>Action</th>

                    </tr>

                    </thead>

<tbody>

<%
if(bookings.isEmpty()){
%>

<tr>

    <td colspan="8" class="text-center py-5">

        <i class="bi bi-airplane-engines display-1 text-secondary"></i>

        <h4 class="mt-3">

            No Bookings Found

        </h4>

        <p class="text-muted">

            You haven't booked any flights yet.

        </p>

        <a href="flights.jsp"
           class="btn btn-primary mt-2">

            <i class="bi bi-plus-circle"></i>

            Book Your First Flight

        </a>

    </td>

</tr>

<%
}else{

for(Booking booking : bookings){
%>

<tr>

    <td>

        <strong>#<%= booking.getBookingId() %></strong>

    </td>

    <td>

        <span class="fw-semibold">

            <%= booking.getFlightNumber() %>

        </span>

    </td>

    <td>

        <i class="bi bi-geo-alt-fill text-primary"></i>

        <%= booking.getOrigin() %>

    </td>

    <td>

        <i class="bi bi-geo-fill text-danger"></i>

        <%= booking.getDestination() %>

    </td>

    <td>

        <i class="bi bi-calendar-event"></i>

        <%= booking.getDepartureDate() %>

    </td>

    <td>

        <span class="badge bg-primary px-3 py-2">

            <%= booking.getSeatNumber() %>

        </span>

    </td>

    <td>

        <span class="badge bg-success px-3 py-2">

            Confirmed

        </span>

    </td>

    <td>

        <a href="../cancelBooking?id=<%= booking.getBookingId() %>"
           class="btn btn-outline-danger btn-sm">

            <i class="bi bi-x-circle"></i>

            Cancel

        </a>

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

    <div class="text-center mt-4">

        <a href="flights.jsp"
           class="btn btn-primary btn-lg">

            <i class="bi bi-airplane-fill"></i>

            Book Another Flight

        </a>

    </div>

</div>

<footer class="footer-simple mt-5">

    <h5>

          Skyra Airlines

    </h5>

    <p>

        Fly Safe • Fly Smart • Fly Worldwide

    </p>

</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>


