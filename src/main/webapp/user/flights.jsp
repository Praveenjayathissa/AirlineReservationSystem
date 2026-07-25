<%@ page import="java.util.List" %>
<%@ page import="com.airline.dao.FlightDAO" %>
<%@ page import="com.airline.model.Flight" %>
<%@ page import="com.airline.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%
User user = (User) session.getAttribute("loggedUser");

if(user == null){
    response.sendRedirect("../login.jsp");
    return;
}

FlightDAO dao = new FlightDAO();
List<Flight> flights = dao.getAllFlights();
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>Available Flights</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
          rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">

    <style>

        :root{
            --primary:#0a2647;
            --primary-dark:#061a33;
            --accent:#d4af37;
            --accent-dark:#b8952e;
            --available:#2a9d8f;
            --available-dark:#218074;
            --sky:#5fa8d3;
        }

        body{

            font-family:'Poppins',sans-serif;
            background:#edf3fb;

        }

        .top-banner{

            background:linear-gradient(135deg, var(--primary), var(--primary-dark));
            color:white;
            padding:40px;
            border-radius:20px;
            margin-top:30px;
            box-shadow:0 10px 30px rgba(10,38,71,.2);

        }

        .flight-card{

            border:none;
            border-radius:18px;
            margin-bottom:25px;
            box-shadow:0 8px 20px rgba(0,0,0,.08);
            transition:.3s;
            border-top:4px solid var(--accent);

        }

        .flight-card:hover{

            transform:translateY(-6px);

        }

        .price{

            font-size:28px;
            font-weight:bold;
            color:var(--primary);

        }

        .route{

            font-size:22px;
            font-weight:600;

        }

        .airline{

            color:#6c757d;
            font-size:15px;

        }

        .book-btn{

            width:100%;
            padding:12px;
            border-radius:10px;

        }

        .badge-flight{

            font-size:14px;
            padding:8px 15px;

        }

        /* ===== Theme overrides so this page matches the rest of the site ===== */

        .navbar.bg-primary{
            background:var(--primary) !important;
        }

        .bg-primary{
            background:var(--primary) !important;
        }

        .text-primary{
            color:var(--primary) !important;
        }

        .text-success{
            color:var(--available) !important;
        }

        .btn-primary{
            background:var(--primary) !important;
            border-color:var(--primary) !important;
        }

        .btn-primary:hover{
            background:var(--primary-dark) !important;
            border-color:var(--primary-dark) !important;
        }

        .badge.bg-primary{
            background:var(--primary) !important;
        }

        h5.text-primary{
            color:var(--accent) !important;
        }

    </style>

</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">

    <div class="container">

        <a class="navbar-brand fw-bold"
           href="../dashboard.jsp">

              Skyra Airlines

        </a>

        <button class="navbar-toggler"
                data-bs-toggle="collapse"
                data-bs-target="#menu">

            <span class="navbar-toggler-icon"></span>

        </button>

        <div class="collapse navbar-collapse"
             id="menu">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">

                    <a class="nav-link"
                       href="../dashboard.jsp">

                        Dashboard

                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link active"
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



            </ul>

        </div>

    </div>

</nav>

<div class="container">

    <div class="top-banner">

        <div class="row align-items-center">

            <div class="col-lg-8">

                <h1>

                    Find Your Perfect Flight

                </h1>

                <p class="lead">

                    Welcome,

                    <%= user.getFullName() %>

                    👋

                    Browse available flights and reserve your seat in just a few clicks.

                </p>

            </div>

            <div class="col-lg-4 text-center">

                <i class="bi bi-airplane-engines"
                   style="font-size:110px;"></i>

            </div>

        </div>

    </div>

    <h2 class="mt-5 mb-4">

        Available Flights

    </h2>

<%
for(Flight flight : flights){
%>

<div class="card flight-card">

    <div class="card-body">

        <div class="row align-items-center">

                    <!-- Left Side -->

                    <div class="col-lg-8">

                        <span class="badge bg-primary badge-flight">

                            <%= flight.getFlightNumber() %>

                        </span>

                        <span class="ms-2 airline">

                            <i class="bi bi-building"></i>

                            <%= flight.getAirline() %>

                        </span>

                        <h3 class="route mt-3">

                            <i class="bi bi-geo-alt-fill text-danger"></i>

                            <%= flight.getOrigin() %>

                            <i class="bi bi-arrow-right mx-2 text-primary"></i>

                            <%= flight.getDestination() %>

                        </h3>

                        <div class="row mt-4">

                            <div class="col-md-4">

                                <strong>

                                    <i class="bi bi-calendar-event text-primary"></i>

                                    Date

                                </strong>

                                <br>

                                <%= flight.getDepartureDate() %>

                            </div>

                            <div class="col-md-4">

                                <strong>

                                    <i class="bi bi-clock text-success"></i>

                                    Departure

                                </strong>

                                <br>

                                <%= flight.getDepartureTime() %>

                            </div>

                            <div class="col-md-4">

                                <strong>

                                    <i class="bi bi-clock-history text-danger"></i>

                                    Arrival

                                </strong>

                                <br>

                                <%= flight.getArrivalTime() %>

                            </div>

                        </div>

                    </div>

                    <!-- Right Side -->

                    <div class="col-lg-4 text-center">

                        <div class="price">

                            $<%= flight.getPrice() %>

                        </div>

                        <p class="text-muted">

                            Economy Class

                        </p>

                        <a href="selectSeat.jsp?flightId=<%= flight.getFlightId() %>"
                           class="btn btn-primary book-btn">

                            <i class="bi bi-ticket-perforated-fill"></i>

                            Book Seat

                        </a>

                    </div>

                </div>

            </div>

        </div>

        <%
        }
        %>

        <!-- Footer -->

        <div class="text-center mt-5 mb-4">

            <hr>

            <h5 class="text-primary">

                Skyra Airlines

            </h5>

            <p class="text-muted">

                Fly Safe • Fly Smart • Fly Worldwide

            </p>

        </div>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        </body>

        </html>
