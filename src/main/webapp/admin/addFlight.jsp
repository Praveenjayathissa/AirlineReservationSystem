<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <title>Add Flight</title>

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

        <div class="card-header bg-primary text-white">

            <h3 class="mb-0">

                <i class="bi bi-airplane-fill"></i>

                Add New Flight

            </h3>

        </div>

        <div class="card-body p-4">

            <form action="../addFlight" method="post">

                <div class="row">

                    <div class="col-md-6 mb-3">

                        <label class="form-label">Flight Number</label>

                        <input
                                type="text"
                                class="form-control"
                                name="flightNumber"
                                placeholder="UL101"
                                required>

                    </div>

                    <div class="col-md-6 mb-3">

                        <label class="form-label">Airline</label>

                        <input
                                type="text"
                                class="form-control"
                                name="airline"
                                placeholder="SriLankan Airlines"
                                required>

                    </div>

                    <div class="col-md-6 mb-3">

                        <label class="form-label">Origin</label>

                        <input
                                type="text"
                                class="form-control"
                                name="origin"
                                placeholder="Colombo"
                                required>

                    </div>

                    <div class="col-md-6 mb-3">

                        <label class="form-label">Destination</label>

                        <input
                                type="text"
                                class="form-control"
                                name="destination"
                                placeholder="Dubai"
                                required>

                    </div>

                    <div class="col-md-4 mb-3">

                        <label class="form-label">Departure Date</label>

                        <input
                                type="date"
                                class="form-control"
                                name="departureDate"
                                required>

                    </div>

                    <div class="col-md-4 mb-3">

                        <label class="form-label">Departure Time</label>

                        <input
                                type="time"
                                class="form-control"
                                name="departureTime"
                                required>

                    </div>

                    <div class="col-md-4 mb-3">

                        <label class="form-label">Arrival Time</label>

                        <input
                                type="time"
                                class="form-control"
                                name="arrivalTime"
                                required>

                    </div>

                    <div class="col-md-6 mb-4">

                        <label class="form-label">Ticket Price ($)</label>

                        <input
                                type="number"
                                step="0.01"
                                class="form-control"
                                name="price"
                                placeholder="350.00"
                                required>

                    </div>

                </div>

                <div class="d-flex justify-content-between">

                    <a href="flights.jsp" class="btn btn-secondary">

                        <i class="bi bi-arrow-left"></i>

                        Cancel

                    </a>

                    <button class="btn btn-success">

                        <i class="bi bi-check-circle"></i>

                        Add Flight

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