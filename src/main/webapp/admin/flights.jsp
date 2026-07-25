<%@ page import="java.util.List" %>
<%@ page import="com.airline.dao.FlightDAO" %>
<%@ page import="com.airline.model.Flight" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%
String admin = (String) session.getAttribute("admin");

if(admin == null){
    response.sendRedirect("adminLogin.jsp");
    return;
}

FlightDAO dao = new FlightDAO();
List<Flight> flights = dao.getAllFlights();
%>

<!DOCTYPE html>
<html>

<head>

    <title>Manage Flights</title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

    <link rel="stylesheet" href="../assets/css/style.css">

</head>

<body class="bg-light d-flex flex-column min-vh-100">

<!-- Navbar -->
<main class="flex-grow-1">

<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow">

    <div class="container">

        <a class="navbar-brand fw-bold" href="dashboard.jsp">
            ✈ Skyra Airlines Admin
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

                Manage Flights

            </h2>

            <p class="text-muted mb-0">

                Add, edit or remove airline flights.

            </p>

        </div>

        <a href="addFlight.jsp" class="btn btn-success">

            <i class="bi bi-plus-circle"></i>

            Add Flight

        </a>

    </div>

    <div class="card shadow border-0">

        <div class="card-body">

            <div class="table-responsive">

                <table class="table table-hover align-middle">

                    <thead class="table-primary">

                    <tr>

                        <th>ID</th>
                        <th>Flight No</th>
                        <th>Airline</th>
                        <th>Origin</th>
                        <th>Destination</th>
                        <th>Date</th>
                        <th>Departure</th>
                        <th>Arrival</th>
                        <th>Price</th>
                        <th class="text-center">Actions</th>

                    </tr>

                    </thead>

                    <tbody>

                    <%

                        if(flights.isEmpty()){

                    %>

                    <tr>

                        <td colspan="10" class="text-center py-5">

                            <i class="bi bi-airplane fs-1 text-secondary"></i>

                            <h5 class="mt-3">

                                No Flights Available

                            </h5>

                            <p class="text-muted">

                                Click "Add Flight" to create your first flight.

                            </p>

                        </td>

                    </tr>

                    <%

                        }else{

                            for(Flight flight : flights){

                    %>

                    <tr>

                        <td><%= flight.getFlightId() %></td>

                        <td>

                            <strong>

                                <%= flight.getFlightNumber() %>

                            </strong>

                        </td>

                        <td><%= flight.getAirline() %></td>

                        <td><%= flight.getOrigin() %></td>

                        <td><%= flight.getDestination() %></td>

                        <td><%= flight.getDepartureDate() %></td>

                        <td><%= flight.getDepartureTime() %></td>

                        <td><%= flight.getArrivalTime() %></td>

                        <td>

                            <strong>

                                $<%= flight.getPrice() %>

                            </strong>

                        </td>

                        <td class="text-center">

                            <a href="editFlight.jsp?id=<%= flight.getFlightId() %>"
                               class="btn btn-warning btn-sm">

                                <i class="bi bi-pencil-square"></i>

                                Edit

                            </a>

                            <a href="../deleteFlight?id=<%= flight.getFlightId() %>"
                               class="btn btn-danger btn-sm"
                               onclick="return confirm('Delete this flight?');">

                                <i class="bi bi-trash"></i>

                                Delete

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

</div>

</main>

<footer class="bg-dark text-white text-center py-4">

    © 2026 Skyra Airlines | Admin Portal

</footer>

</body>

</html>
