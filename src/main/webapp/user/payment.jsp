<%@ page import="com.airline.database.DBConnection" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.airline.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%
User user = (User) session.getAttribute("loggedUser");

if(user == null){
    response.sendRedirect("../login.jsp");
    return;
}

int flightId = Integer.parseInt(request.getParameter("flightId"));
int seatId = Integer.parseInt(request.getParameter("seatId"));

String flightNumber = "";
String origin = "";
String destination = "";
double price = 0;
String seatNumber = "";

Connection con = DBConnection.getConnection();

// Get flight details
PreparedStatement ps1 = con.prepareStatement(
"SELECT * FROM flights WHERE flight_id=?");
ps1.setInt(1, flightId);

ResultSet rs1 = ps1.executeQuery();

if(rs1.next()){
    flightNumber = rs1.getString("flight_number");
    origin = rs1.getString("origin");
    destination = rs1.getString("destination");
    price = rs1.getDouble("price");
}

// Get seat details
PreparedStatement ps2 = con.prepareStatement(
"SELECT seat_number FROM seats WHERE seat_id=?");
ps2.setInt(1, seatId);

ResultSet rs2 = ps2.executeQuery();

if(rs2.next()){
    seatNumber = rs2.getString("seat_number");
}

rs1.close();
rs2.close();
ps1.close();
ps2.close();
con.close();
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>Payment Gateway</title>

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

            ✈ SkyJet Airlines

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

                    <a class="nav-link active"
                       href="#">

                        Payment

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

    <div class="payment-header text-center">

        <h1>

            <i class="bi bi-credit-card-fill"></i>

            Complete Your Payment

        </h1>

        <p class="text-muted">

            Secure your booking by completing the payment below.

        </p>

    </div>

    <div class="row g-4">

        <!-- Booking Summary -->

        <div class="col-lg-5">

            <div class="card payment-summary">

                <div class="card-header bg-primary text-white">

                    <h4 class="mb-0">

                        <i class="bi bi-ticket-perforated-fill"></i>

                        Booking Summary

                    </h4>

                </div>

                <div class="card-body">

                    <p>

                        <strong>Passenger</strong><br>

                        <%= user.getFullName() %>

                    </p>

                    <hr>

                    <p>

                        <strong>Flight</strong><br>

                        <%= flightNumber %>

                    </p>

                    <p>

                        <strong>Route</strong><br>

                        <%= origin %> →

                        <%= destination %>

                    </p>

                    <p>

                        <strong>Seat</strong><br>

                        <span class="badge bg-success">

                            <%= seatNumber %>

                        </span>

                    </p>

                    <hr>

                    <div class="d-flex justify-content-between">

                        <span>Ticket Price</span>

                        <strong>$<%= price %></strong>

                    </div>

                    <div class="d-flex justify-content-between mt-2">

                        <span>Service Fee</span>

                        <strong>$0.00</strong>

                    </div>

                    <hr>

                    <div class="d-flex justify-content-between">

                        <h5>Total</h5>

                        <h5 class="text-primary">

                            $<%= price %>

                        </h5>

                    </div>

                </div>

            </div>

        </div>

        <!-- Payment Form -->

        <div class="col-lg-7">

            <div class="card payment-form-card">

                <div class="card-header bg-success text-white">

                    <h4 class="mb-0">

                        <i class="bi bi-shield-lock-fill"></i>

                        Payment Details

                    </h4>

                </div>

                <div class="card-body">

<form action="../paymentSuccess" method="post">

<input type="hidden" name="flightId" value="<%= flightId %>">
<input type="hidden" name="seatId" value="<%= seatId %>">
<input type="hidden" name="amount" value="<%= price %>">

<div class="mb-3">

    <label class="form-label">

        <i class="bi bi-person-fill"></i>

        Card Holder Name

    </label>

    <input type="text"
           name="cardHolder"
           class="form-control payment-input"
           placeholder="Enter card holder name">

</div>

<div class="mb-3">

    <label class="form-label">

        <i class="bi bi-credit-card-2-front-fill"></i>

        Card Number

    </label>

    <input type="text"
           name="cardNumber"
           class="form-control payment-input"
           placeholder="1234 5678 9012 3456">

</div>

<div class="row">

    <div class="col-md-6 mb-3">

        <label class="form-label">

            <i class="bi bi-calendar-event"></i>

            Expiry Date

        </label>

        <input type="text"
               name="expiry"
               class="form-control payment-input"
               placeholder="MM/YY">

    </div>

    <div class="col-md-6 mb-3">

        <label class="form-label">

            <i class="bi bi-shield-lock-fill"></i>

            CVV

        </label>

        <input type="password"
               name="cvv"
               class="form-control payment-input"
               placeholder="123">

    </div>

</div>

<div class="mb-4">

    <label class="form-label">

        Payment Method

    </label>

    <select name="paymentMethod"
            class="form-select payment-input">

        <option>Visa</option>

        <option>MasterCard</option>

        <option>Debit Card</option>

    </select>

</div>

<div class="alert alert-info">

    <i class="bi bi-shield-check"></i>

    This is a demo payment gateway for the Airline Reservation System.

</div>

<div class="d-grid gap-2">

    <button type="submit"
            class="btn btn-success btn-lg">

        <i class="bi bi-lock-fill"></i>

        Pay $<%= price %>

    </button>

    <a href="selectSeat.jsp?flightId=<%= flightId %>"
       class="btn btn-outline-secondary">

        <i class="bi bi-arrow-left"></i>

        Back to Seat Selection

    </a>

</div>

</form>

                </div>

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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

