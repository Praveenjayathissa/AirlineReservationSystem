<%@ page import="com.airline.dao.FlightDAO" %>
<%@ page import="com.airline.model.Flight" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%
String admin = (String) session.getAttribute("admin");

if(admin == null){
    response.sendRedirect("adminLogin.jsp");
    return;
}

int id = Integer.parseInt(request.getParameter("id"));

FlightDAO dao = new FlightDAO();
Flight flight = dao.getFlightById(id);
%>

<!DOCTYPE html>
<html>

<head>

    <title>Edit Flight</title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

    <link rel="stylesheet" href="../assets/css/style.css">

</head>

<body class="bg-light d-flex flex-column min-vh-100">

<main class="flex-grow-1">

<!-- Navbar -->

<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow">

    <div class="container">

        <a class="navbar-brand fw-bold" href="dashboard.jsp">

            ✈ Skyra Airlines Admin

        </a>

        <div>

            <a href="flights.jsp" class="btn btn-light btn-sm">

                <i class="bi bi-arrow-left"></i>

                Back to Flights

            </a>

        </div>

    </div>

</nav>

<div class="container mt-5 mb-5">

    <div class="card shadow border-0">

        <div class="card-header bg-warning">

            <h3 class="mb-0 text-dark">

                <i class="bi bi-pencil-square"></i>

                Edit Flight

            </h3>

        </div>

        <div class="card-body p-4">

            <form action="../editFlight" method="post">

                <input type="hidden"
                       name="flightId"
                       value="<%= flight.getFlightId() %>">

                <div class="row">

                    <div class="col-md-6 mb-3">

                        <label class="form-label">Flight Number</label>

                        <input
                                type="text"
                                class="form-control"
                                name="flightNumber"
                                value="<%= flight.getFlightNumber() %>"
                                required>

                    </div>

                    <div class="col-md-6 mb-3">

                        <label class="form-label">Airline</label>

                        <input
                                type="text"
                                class="form-control"
                                name="airline"
                                value="<%= flight.getAirline() %>"
                                required>

                    </div>

                    <div class="col-md-6 mb-3">

                        <label class="form-label">Origin</label>

                        <input
                                type="text"
                                class="form-control"
                                name="origin"
                                value="<%= flight.getOrigin() %>"
                                required>

                    </div>

                    <div class="col-md-6 mb-3">

                        <label class="form-label">Destination</label>

                        <input
                                type="text"
                                class="form-control"
                                name="destination"
                                value="<%= flight.getDestination() %>"
                                required>

                    </div>

                    <div class="col-md-4 mb-3">

                        <label class="form-label">Departure Date</label>

                        <input
                                type="date"
                                class="form-control"
                                name="departureDate"
                                value="<%= flight.getDepartureDate() %>"
                                required>

                    </div>

                    <div class="col-md-4 mb-3">

                        <label class="form-label">Departure Time</label>

                        <input
                                type="time"
                                class="form-control"
                                name="departureTime"
                                value="<%= flight.getDepartureTime() %>"
                                required>

                    </div>

                    <div class="col-md-4 mb-3">

                        <label class="form-label">Arrival Time</label>

                        <input
                                type="time"
                                class="form-control"
                                name="arrivalTime"
                                value="<%= flight.getArrivalTime() %>"
                                required>

                    </div>

                    <div class="col-md-6 mb-4">

                        <label class="form-label">Ticket Price ($)</label>

                        <input
                                type="number"
                                step="0.01"
                                class="form-control"
                                name="price"
                                value="<%= flight.getPrice() %>"
                                required>

                    </div>

                </div>

                <div class="d-flex justify-content-between">

                    <a href="flights.jsp" class="btn btn-secondary">

                        <i class="bi bi-arrow-left"></i>

                        Cancel

                    </a>

                    <button class="btn btn-warning text-dark">

                        <i class="bi bi-check-circle"></i>

                        Update Flight

                    </button>

                </div>

            </form>

        </div>

    </div>

</div>

</main>

<footer class="bg-dark text-white text-center p-3">

    © 2026 Skyra Airlines | Admin Portal

</footer>

</body>

</html>