<%@ page import="java.util.List" %>
<%@ page import="com.airline.dao.UserDAO" %>
<%@ page import="com.airline.model.UserDetails" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%
String admin = (String) session.getAttribute("admin");

if(admin == null){
    response.sendRedirect("adminLogin.jsp");
    return;
}

UserDAO userDAO = new UserDAO();

String search = request.getParameter("search");

List<UserDetails> users;

if(search != null && !search.trim().isEmpty()){
    users = userDAO.searchUsers(search);
}else{
    users = userDAO.getAllUsers();
}

int totalUsers = users.size();
%>

<!DOCTYPE html>
<html>

<head>

    <title>Manage Users</title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

    <link rel="stylesheet" href="../assets/css/style.css">

</head>

<body class="bg-light d-flex flex-column min-vh-100">

<main class="flex-grow-1">

<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow">

    <div class="container">

        <a class="navbar-brand fw-bold" href="dashboard.jsp">

            ✈ Skyra Airlines Admin

        </a>

        <div>

            <a href="dashboard.jsp"
               class="btn btn-light btn-sm me-2">

                <i class="bi bi-speedometer2"></i>

                Dashboard

            </a>

            <a href="../index.jsp"
               class="btn btn-outline-light btn-sm">

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

Manage Users

</h2>

<p class="text-muted">

View, search and manage all registered users.

</p>

</div>

</div>

<div class="row mb-4">

<div class="col-md-4">

<div class="card shadow border-0 dashboard-card">

<div class="card-body text-center">

<i class="bi bi-people-fill text-primary fs-1"></i>

<h2 class="mt-2">

<%= totalUsers %>

</h2>

<p class="text-muted mb-0">

Registered Users

</p>

</div>

</div>

</div>

<div class="col-md-4">

<div class="card shadow border-0 dashboard-card">

<div class="card-body text-center">

<i class="bi bi-person-check-fill text-success fs-1"></i>

<h2 class="mt-2">

<%= totalUsers %>

</h2>

<p class="text-muted mb-0">

Active Users

</p>

</div>

</div>

</div>

<div class="col-md-4">

<div class="card shadow border-0 dashboard-card">

<div class="card-body text-center">

<i class="bi bi-person-plus-fill text-warning fs-1"></i>

<h2 class="mt-2">

<%= totalUsers %>

</h2>

<p class="text-muted mb-0">

Total Accounts

</p>

</div>

</div>

</div>

</div>

<div class="card shadow border-0 mb-4">

<div class="card-body">

<form method="get">

<div class="row">

<div class="col-md-10">

<input
type="text"
name="search"
class="form-control"
placeholder="Search by name, email or passport number..."
value="<%= search == null ? "" : search %>">

</div>

<div class="col-md-2 d-grid">

<button class="btn btn-primary">

<i class="bi bi-search"></i>

Search

</button>

</div>

</div>

</form>

</div>

</div>

<div class="card shadow border-0">

    <div class="card-body">

        <div class="table-responsive">

            <table class="table table-hover align-middle">

                <thead class="table-primary">

                <tr>

                    <th>User ID</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Passport No</th>
                    <th>Registered On</th>

                </tr>

                </thead>

                <tbody>

                <%

                if(users.isEmpty()){

                %>

                <tr>

                    <td colspan="6" class="text-center py-5">

                        <i class="bi bi-people fs-1 text-secondary"></i>

                        <h5 class="mt-3">

                            No Users Found

                        </h5>

                    </td>

                </tr>

                <%

                }else{

                    for(UserDetails user : users){

                %>

                <tr>

                    <td>

                        <%= user.getUserId() %>

                    </td>

                    <td>

                        <strong>

                            <%= user.getFullName() %>

                        </strong>

                    </td>

                    <td>

                        <%= user.getEmail() %>

                    </td>

                    <td>

                        <%= user.getPhone() %>

                    </td>

                    <td>

                        <span class="badge bg-secondary">

                            <%= user.getPassportNo() %>

                        </span>

                    </td>

                    <td>

                        <%= user.getCreatedAt() %>

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

</main>

<footer class="bg-dark text-white text-center mt-5 p-3">

    © 2026 Skyra Airlines | Admin Portal

</footer>

</body>

</html>