<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Skyra Airlines</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="assets/css/style.css">

</head>

<body>

<jsp:include page="components/navbar.jsp"/>

<!-- Hero Section -->
<section class="hero">

    <div class="hero-content">

        <h1>Fly Beyond Your Dreams</h1>

        <p>Book flights quickly, safely, and comfortably with SkyJet Airlines.</p>

        <a href="register.jsp" class="btn btn-warning btn-lg mt-3 me-2">
            Get Started
        </a>

        <a href="login.jsp" class="btn btn-outline-light btn-lg mt-3">
            Login
        </a>

    </div>

</section>

<!-- Destinations -->
<section class="container py-5" id="destinations">

    <h2 class="section-title">Popular Destinations</h2>

    <div class="row g-4">

        <div class="col-md-4">

            <div class="card destination-card h-100">

                <img src="assets/images/dubai.jpg" class="card-img-top" height="230">

                <div class="card-body text-center">

                    <h4>Dubai</h4>

                    <p>Luxury shopping, skyscrapers and unforgettable experiences.</p>

                </div>

            </div>

        </div>

        <div class="col-md-4">

            <div class="card destination-card h-100">

                <img src="assets/images/singapore.jpg" class="card-img-top" height="230">

                <div class="card-body text-center">

                    <h4>Singapore</h4>

                    <p>Modern architecture, amazing food and beautiful city life.</p>

                </div>

            </div>

        </div>

        <div class="col-md-4">

            <div class="card destination-card h-100">

                <img src="assets/images/maldives.jpg" class="card-img-top" height="230">

                <div class="card-body text-center">

                    <h4>Maldives</h4>

                    <p>Crystal-clear beaches, luxury resorts and tropical paradise.</p>

                </div>

            </div>

        </div>

    </div>

</section>

<!-- Why Choose Us -->
<section class="container py-5" id="services">

    <h2 class="section-title">Why Choose SkyJet?</h2>

    <div class="row text-center g-4">

        <div class="col-md-3">

            <div class="card p-4 h-100">

                <i class="bi bi-airplane-engines display-4 text-primary"></i>

                <h5 class="mt-3">Worldwide Flights</h5>

                <p>Travel to destinations around the globe.</p>

            </div>

        </div>

        <div class="col-md-3">

            <div class="card p-4 h-100">

                <i class="bi bi-shield-check display-4 text-success"></i>

                <h5 class="mt-3">Safe Travel</h5>

                <p>Your safety is always our top priority.</p>

            </div>

        </div>

        <div class="col-md-3">

            <div class="card p-4 h-100">

                <i class="bi bi-cash-coin display-4 text-warning"></i>

                <h5 class="mt-3">Affordable Prices</h5>

                <p>Best flight prices with premium service.</p>

            </div>

        </div>

        <div class="col-md-3">

            <div class="card p-4 h-100">

                <i class="bi bi-headset display-4 text-danger"></i>

                <h5 class="mt-3">24/7 Support</h5>

                <p>We're here to help you whenever you need us.</p>

            </div>

        </div>

    </div>

</section>

<!-- Call to Action -->
<section class="bg-primary text-white text-center py-5">

    <div class="container">

        <h2>Ready for Your Next Journey?</h2>

        <p class="mb-4">
            Create your account today and book your next adventure.
        </p>

        <a href="register.jsp" class="btn btn-light btn-lg">
            Book Now
        </a>

    </div>

</section>

<jsp:include page="components/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/script.js"></script>

</body>
</html>