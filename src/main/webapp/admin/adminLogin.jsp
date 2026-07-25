<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <title>Admin Login</title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

    <link rel="stylesheet" href="../assets/css/style.css">

</head>

<body class="bg-light">

<!-- Navbar -->

<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow">

    <div class="container">

        <a class="navbar-brand fw-bold" href="../index.jsp">
            ✈ Skyra Airlines
        </a>

        <a href="../index.jsp" class="btn btn-light btn-sm">
            Home
        </a>

    </div>

</nav>

<!-- Login Card -->

<div class="container">

    <div class="row justify-content-center align-items-center" style="min-height:85vh;">

        <div class="col-lg-5 col-md-7">

            <div class="card border-0 shadow-lg rounded-4">

                <div class="card-body p-5">

                    <div class="text-center mb-4">

                        <i class="bi bi-shield-lock-fill text-primary" style="font-size:60px;"></i>

                        <h2 class="fw-bold mt-3">
                            Administrator Login
                        </h2>

                        <p class="text-muted">
                            Sign in to access the Admin Dashboard
                        </p>

                    </div>

                    <form action="../adminLogin" method="post">

                        <div class="mb-3">

                            <label class="form-label">
                                Username
                            </label>

                            <input
                                    type="text"
                                    name="username"
                                    class="form-control form-control-lg"
                                    placeholder="Enter Username"
                                    required>

                        </div>

                        <div class="mb-4">

                            <label class="form-label">
                                Password
                            </label>

                            <input
                                    type="password"
                                    name="password"
                                    class="form-control form-control-lg"
                                    placeholder="Enter Password"
                                    required>

                        </div>

                        <button class="btn btn-primary w-100 btn-lg">

                            <i class="bi bi-box-arrow-in-right"></i>

                            Login

                        </button>

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>

<footer class="bg-dark text-white text-center mt-5 py-4 w-100">

    © 2026 Skyra Airlines | Admin Portal

</footer>

</body>

</html>