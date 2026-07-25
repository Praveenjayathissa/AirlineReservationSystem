<%@ page import="com.airline.dao.DashboardDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%
String admin = (String) session.getAttribute("admin");

if(admin == null){
    response.sendRedirect("adminLogin.jsp");
    return;
}

DashboardDAO dao = new DashboardDAO();

int totalFlights = dao.getTotalFlights();
int totalUsers = dao.getTotalUsers();
int totalBookings = dao.getTotalBookings();
double totalRevenue = dao.getTotalRevenue();
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>Skyra Airlines | Admin Dashboard</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <link rel="stylesheet"
          href="../assets/css/style.css">

</head>

<body class="bg-light d-flex flex-column min-vh-100">

<main class="flex-grow-1">

<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow">

    <div class="container">

        <a class="navbar-brand fw-bold"
           href="dashboard.jsp">

            <i class="bi bi-airplane-engines-fill"></i>

            Skyra Airlines Admin

        </a>

        <div>

            <a href="../index.jsp"
               class="btn btn-outline-light">

                <i class="bi bi-box-arrow-right"></i>

                Logout

            </a>

        </div>

    </div>

</nav>

<div class="container mt-5">

<div class="row align-items-center mb-5">

<div class="col-lg-8">

<h1 class="display-4 fw-bold">

Welcome Administrator

</h1>

<p class="lead text-muted">

Skyra Airlines Reservation Management System

</p>

<p class="text-secondary">

Manage flights, passengers, reservations and payments
from one professional dashboard.

</p>

</div>

<div class="col-lg-4 text-end">

<i class="bi bi-airplane-engines-fill text-primary"
style="font-size:110px;"></i>

</div>

</div>

<div class="row g-4">

<div class="col-md-6 col-xl-3">

<div class="card dashboard-card border-0 shadow h-100">

<div class="card-body text-center">

<i class="bi bi-airplane-fill text-primary fs-1"></i>

<h2 class="fw-bold mt-3">

<%= totalFlights %>

</h2>

<p class="text-muted">

Total Flights

</p>

<a href="flights.jsp"
class="btn btn-primary">

Manage Flights

</a>

</div>

</div>

</div>

<div class="col-md-6 col-xl-3">

<div class="card dashboard-card border-0 shadow h-100">

<div class="card-body text-center">

<i class="bi bi-people-fill text-success fs-1"></i>

<h2 class="fw-bold mt-3">

<%= totalUsers %>

</h2>

<p class="text-muted">

Registered Users

</p>

<a href="users.jsp"
class="btn btn-success">

Manage Users

</a>

</div>

</div>

</div>

<div class="col-md-6 col-xl-3">

<div class="card dashboard-card border-0 shadow h-100">

<div class="card-body text-center">

<i class="bi bi-ticket-perforated-fill text-warning fs-1"></i>

<h2 class="fw-bold mt-3">

<%= totalBookings %>

</h2>

<p class="text-muted">

Total Bookings

</p>

<a href="bookings.jsp"
class="btn btn-warning">

View Bookings

</a>

</div>

</div>

</div>

<div class="col-md-6 col-xl-3">

<div class="card dashboard-card border-0 shadow h-100">

<div class="card-body text-center">

<i class="bi bi-cash-stack text-danger fs-1"></i>

<h2 class="fw-bold mt-3">

$<%= String.format("%.2f", totalRevenue) %>

</h2>

<p class="text-muted">

Total Revenue

</p>

</div>

</div>

</div>

</div>

<br><br>

<div class="row mt-5">

    <!-- Quick Access -->

    <div class="col-lg-6 mb-4">

        <div class="card shadow border-0 h-100">

            <div class="card-header bg-primary text-white">

                <h4 class="mb-0">

                    <i class="bi bi-lightning-charge-fill"></i>

                    Quick Access

                </h4>

            </div>

            <div class="card-body">

                <div class="d-grid gap-3">

                    <a href="addFlight.jsp"
                       class="btn btn-outline-primary btn-lg">

                        <i class="bi bi-plus-circle-fill"></i>

                        Add New Flight

                    </a>

                    <a href="flights.jsp"
                       class="btn btn-outline-info btn-lg">

                        <i class="bi bi-airplane-fill"></i>

                        Manage Flights

                    </a>

                    <a href="bookings.jsp"
                       class="btn btn-outline-warning btn-lg">

                        <i class="bi bi-ticket-perforated-fill"></i>

                        Manage Bookings

                    </a>

                    <a href="users.jsp"
                       class="btn btn-outline-success btn-lg">

                        <i class="bi bi-people-fill"></i>

                        Manage Users

                    </a>

                </div>

            </div>

        </div>

    </div>

    <!-- System Information -->

    <div class="col-lg-6 mb-4">

        <div class="card shadow border-0 h-100">

            <div class="card-header bg-dark text-white">

                <h4 class="mb-0">

                    <i class="bi bi-info-circle-fill"></i>

                    System Information

                </h4>

            </div>

            <div class="card-body">

                <table class="table table-borderless align-middle">

                    <tr>

                        <th width="40%">Airline</th>

                        <td>Skyra Airlines</td>

                    </tr>

                    <tr>

                        <th>Application</th>

                        <td>Airline Reservation System</td>

                    </tr>

                    <tr>

                        <th>Version</th>

                        <td>1.0</td>

                    </tr>

                    <tr>

                        <th>Technology</th>

                        <td>Java 22 • JSP • MySQL • Bootstrap 5</td>

                    </tr>

                    <tr>

                        <th>Server</th>

                        <td>Apache Tomcat 10</td>

                    </tr>

                    <tr>

                        <th>Status</th>

                        <td>

                            <span class="badge bg-success">

                                <i class="bi bi-check-circle-fill"></i>

                                System Online

                            </span>

                        </td>

                    </tr>

                </table>

            </div>

        </div>

    </div>

</div>

<!-- Admin Tips -->

<div class="card shadow border-0 mt-2">

    <div class="card-header bg-success text-white">

        <h4 class="mb-0">

            <i class="bi bi-stars"></i>

            Administrator Dashboard

        </h4>

    </div>

    <div class="card-body">

        <div class="row text-center">

            <div class="col-md-3">

                <i class="bi bi-airplane-fill fs-1 text-primary"></i>

                <h5 class="mt-3">

                    Flights

                </h5>

                <p class="text-muted">

                    Add, edit and remove airline flights.

                </p>

            </div>

            <div class="col-md-3">

                <i class="bi bi-people-fill fs-1 text-success"></i>

                <h5 class="mt-3">

                    Users

                </h5>

                <p class="text-muted">

                    View all registered passengers.

                </p>

            </div>

            <div class="col-md-3">

                <i class="bi bi-ticket-perforated-fill fs-1 text-warning"></i>

                <h5 class="mt-3">

                    Bookings

                </h5>

                <p class="text-muted">

                    Manage reservations and bookings.

                </p>

            </div>

            <div class="col-md-3">

                <i class="bi bi-cash-stack fs-1 text-danger"></i>

                <h5 class="mt-3">

                    Revenue

                </h5>

                <p class="text-muted">

                    Monitor income and payment records.

                </p>

            </div>

        </div>

    </div>

</div>

</main>

<footer class="bg-dark text-white text-center mt-5 p-4">

    <h5 class="mb-2">

        ✈ Skyra Airlines

    </h5>

    <p class="mb-1">

        Airline Reservation Management System

    </p>

    <small>

        © 2026 Skyra Airlines. All Rights Reserved.

    </small>

</footer>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>