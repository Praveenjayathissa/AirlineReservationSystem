<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Login | Skyra Airlines</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="assets/css/style.css">

</head>

<body>

<!-- Navbar -->
<jsp:include page="components/navbar.jsp"/>

<div class="container-fluid">

    <div class="row vh-100">

        <!-- Left Side -->
        <div class="col-lg-7 d-none d-lg-block login-image">

            <div class="overlay">

                <div class="hero-text">

                    <h1>Welcome Back</h1>

                    <p>

                        Book flights easily, travel safely,
                        and explore the world with SkyJet Airlines.

                    </p>

                </div>

            </div>

        </div>

        <!-- Right Side -->
        <div class="col-lg-5 d-flex align-items-center justify-content-center bg-light">

            <div class="login-card">

                <div class="text-center mb-4">

                    <img src="assets/images/logo.png"
                         width="90">

                    <h2 class="mt-3 fw-bold">

                        User Login

                    </h2>

                    <p class="text-muted">

                        Sign in to continue

                    </p>

                </div>

                <% if(request.getParameter("error") != null){ %>

                <div class="alert alert-danger">

                    Invalid Email or Password

                </div>

                <% } %>

                <form action="login" method="post">

                    <div class="mb-3">

                        <label>Email Address</label>

                        <div class="input-group">

                            <span class="input-group-text">

                                <i class="bi bi-envelope"></i>

                            </span>

                            <input
                                    type="email"
                                    class="form-control"
                                    name="email"
                                    required>

                        </div>

                    </div>

                    <div class="mb-3">

                        <label>Password</label>

                        <div class="input-group">

                            <span class="input-group-text">

                                <i class="bi bi-lock"></i>

                            </span>

                            <input
                                    type="password"
                                    id="password"
                                    class="form-control"
                                    name="password"
                                    required>

                            <button
                                    class="btn btn-outline-secondary"
                                    type="button"
                                    onclick="togglePassword()">

                                <i class="bi bi-eye"></i>

                            </button>

                        </div>

                    </div>

                    <button
                            class="btn btn-primary w-100 btn-lg">

                        Login

                    </button>

                </form>

                <hr>

                <p class="text-center">

                    Don't have an account?

                    <a href="register.jsp">

                        Register Here

                    </a>

                </p>

            </div>

        </div>

    </div>

</div>

<script>

    function togglePassword(){

        let password=document.getElementById("password");

        if(password.type==="password"){

            password.type="text";

        }else{

            password.type="password";

        }

    }

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>