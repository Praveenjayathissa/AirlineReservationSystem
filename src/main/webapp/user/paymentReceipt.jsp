<%@ page import="com.airline.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%
User user = (User) session.getAttribute("loggedUser");

if(user == null){
    response.sendRedirect("../login.jsp");
    return;
}

String txn = request.getParameter("txn");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>Payment Receipt</title>

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

            ✈ Skyra Airlines

        </a>

        <button class="navbar-toggler"
                data-bs-toggle="collapse"
                data-bs-target="#navbar">

            <span class="navbar-toggler-icon"></span>

        </button>

        <div class="collapse navbar-collapse"
             id="navbar">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">

                    <a class="nav-link"
                       href="../dashboard.jsp">

                        Dashboard

                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link"
                       href="flights.jsp">

                        Flights

                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link"
                       href="myBookings.jsp">

                        My Bookings

                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link"
                       href="../logout">

                        Logout

                    </a>

                </li>

            </ul>

        </div>

    </div>

</nav>

<div class="container py-5">

    <div class="receipt-header text-center">

        <div class="success-icon">

            <i class="bi bi-check-circle-fill"></i>

        </div>

        <h1>

            Payment Successful

        </h1>

        <p class="text-muted">

            Your airline ticket has been booked successfully.

        </p>

    </div>

    <div class="row justify-content-center">

        <div class="col-lg-8">

            <div class="card receipt-card">

                <div class="card-header bg-success text-white">

                    <h3 class="mb-0">

                        <i class="bi bi-ticket-perforated-fill"></i>

                        Payment Receipt

                    </h3>

                </div>

                <div class="card-body">

<div class="alert alert-success text-center">

    <h4>

        <i class="bi bi-check-circle-fill"></i>

        Thank You!

    </h4>

    <p class="mb-0">

        Your payment has been completed successfully.
        Your flight reservation is now confirmed.

    </p>

</div>

<div class="receipt-details">

    <div class="row mb-3">

        <div class="col-md-6">

            <strong>

                <i class="bi bi-receipt"></i>

                Transaction ID

            </strong>

            <p class="receipt-value">

                <%= txn %>

            </p>

        </div>

        <div class="col-md-6">

            <strong>

                <i class="bi bi-person-fill"></i>

                Passenger

            </strong>

            <p class="receipt-value">

                <%= user.getFullName() %>

            </p>

        </div>

    </div>

    <div class="row mb-3">

        <div class="col-md-6">

            <strong>

                <i class="bi bi-credit-card-fill"></i>

                Payment Status

            </strong>

            <p>

                <span class="badge bg-success px-3 py-2">

                    Paid

                </span>

            </p>

        </div>

        <div class="col-md-6">

            <strong>

                <i class="bi bi-calendar-check"></i>

                Booking Status

            </strong>

            <p>

                <span class="badge bg-primary px-3 py-2">

                    Confirmed

                </span>

            </p>

        </div>

    </div>

</div>

<hr>

<div class="text-center mb-4">

    <h5>

        ✈ Thank you for choosing SkyJet Airlines

    </h5>

    <p class="text-muted">

        We wish you a pleasant journey and look forward to serving you again.

    </p>

</div>

<div class="d-grid gap-3">

    <button class="btn btn-primary btn-lg"
            onclick="window.print();">

        <i class="bi bi-printer-fill"></i>

        Print Receipt

    </button>

    <a href="myBookings.jsp"
       class="btn btn-success btn-lg">

        <i class="bi bi-journal-check"></i>

        View My Bookings

    </a>

    <a href="flights.jsp"
       class="btn btn-outline-primary btn-lg">

        <i class="bi bi-airplane-fill"></i>

        Book Another Flight

    </a>

</div>

</div>

</div>

</div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>

<div class="alert alert-success">

<h4>Your payment has been completed successfully.</h4>

</div>

<table class="table">

<tr>

<th>Transaction ID</th>

<td><%= txn %></td>

</tr>

<tr>

<th>Passenger</th>

<td><%= user.getFullName() %></td>

</tr>

<tr>

<th>Status</th>

<td>Paid</td>

</tr>

</table>

<div class="mt-4">

<button class="btn btn-primary"
onclick="window.print();">

Print Receipt

</button>

<a href="myBookings.jsp"
class="btn btn-success">

My Bookings

</a>

<a href="flights.jsp"
class="btn btn-secondary">

Book Another Flight

</a>

</div>

</div>

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

</body>

</html>