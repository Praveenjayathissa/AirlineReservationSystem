<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Register | SkyJet Airlines</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="assets/css/style.css">

</head>

<body>

<jsp:include page="components/navbar.jsp"/>

<div class="container-fluid">

    <div class="row vh-100">

        <!-- Left Side -->

        <div class="col-lg-6 d-none d-lg-block login-image">

            <div class="overlay">

                <div class="hero-text">

                    <h1>Start Your Journey</h1>

                    <p>

                        Join thousands of travelers booking flights safely
                        with Skyra Airlines.

                    </p>

                </div>

            </div>

        </div>

        <!-- Right Side -->

        <div class="col-lg-6 bg-light d-flex align-items-center justify-content-center">

            <div class="register-card">

                <div class="text-center mb-4">

                    <img src="assets/images/logo.png"
                         width="90">

                    <h2 class="fw-bold mt-3">

                        Create Account

                    </h2>

                    <p class="text-muted">

                        Register to start booking flights

                    </p>

                </div>

                <form action="<%= request.getContextPath() %>/register" method="post">

                    <div class="mb-3">

                        <label class="form-label">

                            Full Name

                        </label>

                        <div class="input-group">

<span class="input-group-text">

<i class="bi bi-person-fill"></i>

</span>

<input
type="text"
class="form-control"
name="fullName"
required>

                        </div>

                    </div>

                    <div class="mb-3">

<label>Email Address</label>

<div class="input-group">

<span class="input-group-text">

<i class="bi bi-envelope-fill"></i>

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

<i class="bi bi-lock-fill"></i>

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

                    <div class="mb-3">

<label>Phone Number</label>

<div class="input-group">

<span class="input-group-text">

<i class="bi bi-telephone-fill"></i>

</span>

<input
type="text"
class="form-control"
name="phone"
required>

</div>

                    </div>

                    <div class="mb-4">

<label>Passport Number</label>

<div class="input-group">

<span class="input-group-text">

<i class="bi bi-credit-card-fill"></i>

</span>

<input
type="text"
class="form-control"
name="passportNo"
required>

</div>

                    </div>

                  <button
                  type="submit"
                  class="btn btn-primary btn-lg w-100">

                  Create Account

                  </button>

                </form>

                <hr>

                <p class="text-center">

Already have an account?

<a href="login.jsp">

Login Here

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