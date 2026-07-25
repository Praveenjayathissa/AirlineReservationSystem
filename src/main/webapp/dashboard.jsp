<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.airline.model.User" %>
<%@ page import="com.airline.database.DBConnection" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.airline.dao.BookingDAO" %>
<%@ page import="com.airline.model.Booking" %>

<%
User user = (User) session.getAttribute("loggedUser");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}

int totalBookings = 0;
int totalFlights = 0;

try{

    Connection con = DBConnection.getConnection();

    PreparedStatement ps1 =
            con.prepareStatement("SELECT COUNT(*) FROM bookings WHERE user_id=?");

    ps1.setInt(1,user.getUserId());

    ResultSet rs1 = ps1.executeQuery();

    if(rs1.next()){
        totalBookings = rs1.getInt(1);
    }

    PreparedStatement ps2 =
            con.prepareStatement("SELECT COUNT(*) FROM flights");

    ResultSet rs2 = ps2.executeQuery();

    if(rs2.next()){
        totalFlights = rs2.getInt(1);
    }

    rs1.close();
    rs2.close();
    ps1.close();
    ps2.close();
    con.close();

}catch(Exception e){
    e.printStackTrace();
}

BookingDAO bookingDAO = new BookingDAO();
List<Booking> bookingList = bookingDAO.getBookingsByUser(user.getUserId());

%>

<!DOCTYPE html>

<html>

<head>

    <title>User Dashboard</title>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

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
            background:#f4f7fb;

        }

        .hero{

            background:linear-gradient(135deg, var(--primary), var(--primary-dark));

            color:white;

            padding:40px;

            border-radius:15px;

            margin-top:25px;

        }

        .card-box{

            border:none;

            border-radius:15px;

            box-shadow:0 5px 15px rgba(0,0,0,.1);

            transition:.3s;

        }

        .card-box:hover{

            transform:translateY(-5px);

        }

        .action-btn{

            width:100%;

            padding:18px;

            font-size:18px;

        }

        /* ===== Theme overrides so this page matches the rest of the site ===== */

        .navbar.bg-primary{
            background:var(--primary) !important;
        }

        .bg-primary{
            background:var(--primary) !important;
        }

        .bg-success{
            background:var(--available) !important;
        }

        .bg-warning{
            background:var(--accent) !important;
        }

        .bg-info{
            background:var(--sky) !important;
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

        .btn-success{
            background:var(--available) !important;
            border-color:var(--available) !important;
        }

        .btn-success:hover{
            background:var(--available-dark) !important;
            border-color:var(--available-dark) !important;
        }

        .btn-warning{
            background:var(--accent) !important;
            border-color:var(--accent) !important;
            color:#1b1b1b !important;
        }

        .btn-warning:hover{
            background:var(--accent-dark) !important;
            border-color:var(--accent-dark) !important;
            color:#1b1b1b !important;
        }

        .badge.bg-primary{
            background:var(--primary) !important;
        }

    </style>

</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">

    <div class="container">

        <a class="navbar-brand fw-bold"
           href="dashboard.jsp">

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

                    <a class="nav-link active"
                       href="dashboard.jsp">

                        Dashboard

                    </a>

                </li>

                <li class="nav-item">

                                    <a class="nav-link"
                                       href="user/flights.jsp">

                                        Flights

                                    </a>

                                </li>

                <li class="nav-item">

                    <a class="nav-link"
                       href="user/myBookings.jsp">

                        My Bookings

                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link"
                       href="index.jsp">

                        Logout

                    </a>

                </li>

            </ul>

        </div>

    </div>

</nav>

<div class="container">

    <div class="hero">

        <h2>

            Welcome,

            <%= user.getFullName() %>

        </h2>

        <p>

            Book flights, manage your reservations and enjoy your journey.

        </p>

    </div>

    <div class="row mt-4">

        <div class="col-md-6">

            <div class="card card-box">

                <div class="card-body text-center">

                    <h1 class="text-primary">

                        <%= totalBookings %>

                    </h1>

                    <h5>

                        My Bookings

                    </h5>

                </div>

            </div>

        </div>

        <div class="col-md-6">

            <div class="card card-box">

                <div class="card-body text-center">

                    <h1 class="text-success">

                        <%= totalFlights %>

                    </h1>

                    <h5>

                        Available Flights

                    </h5>

                </div>

            </div>

        </div>

    </div>

    <h3 class="mt-5 mb-3">

        Quick Actions

    </h3>

    <div class="row">

        <div class="col-md-4 mb-3">

            <a href="user/flights.jsp"
               class="btn btn-primary action-btn">

                <i class="bi bi-airplane"></i>

                Book Flight

            </a>

        </div>

        <div class="col-md-4 mb-3">

            <a href="user/myBookings.jsp"
               class="btn btn-success action-btn">

                <i class="bi bi-ticket"></i>

                My Bookings

            </a>

        </div>

    </div>

        <!-- Recent Bookings -->

        <div class="card card-box mt-5">

            <div class="card-header bg-primary text-white">

                <h4 class="mb-0">

                    <i class="bi bi-ticket-perforated"></i>

                    Recent Bookings

                </h4>

            </div>

            <div class="card-body">

                <div class="table-responsive">

                    <table class="table table-hover">

                        <thead class="table-light">

                        <tr>

                            <th>Flight</th>
                            <th>Origin</th>
                            <th>Destination</th>
                            <th>Date</th>
                            <th>Seat</th>

                        </tr>

                        </thead>

                        <tbody>

                        <%

                            if(bookingList.isEmpty()){

                        %>

                        <tr>

                            <td colspan="5" class="text-center">

                                No bookings found.

                            </td>

                        </tr>

                        <%

                            }else{

                                for(Booking booking : bookingList){

                        %>

                        <tr>

                            <td>

                                <%= booking.getFlightNumber() %>

                            </td>

                            <td>

                                <%= booking.getOrigin() %>

                            </td>

                            <td>

                                <%= booking.getDestination() %>

                            </td>

                            <td>

                                <%= booking.getDepartureDate() %>

                            </td>

                            <td>

                                <span class="badge bg-primary">

                                    <%= booking.getSeatNumber() %>

                                </span>

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


        <!-- User Information -->

        <div class="row mt-5">

            <div class="col-lg-4">

                <div class="card card-box">

                    <div class="card-header bg-success text-white">

                        My Information

                    </div>

                    <div class="card-body">

                        <p>

                            <strong>Name :</strong>

                            <%= user.getFullName() %>

                        </p>

                        <p>

                            <strong>Email :</strong>

                            <%= user.getEmail() %>

                        </p>

                        <p>

                            <strong>Phone :</strong>

                            <%= user.getPhone() %>

                        </p>

                        <p>

                            <strong>Passport :</strong>

                            <%= user.getPassportNo() %>

                        </p>

                    </div>

                </div>

            </div>

            <div class="col-lg-8">

                <div class="card card-box">

                    <div class="card-header bg-info text-white">

                        Travel Tips

                    </div>

                    <div class="card-body">

                        <ul>

                            <li>Arrive at the airport at least 2 hours before departure.</li>

                            <li>Carry your passport and travel documents.</li>

                            <li>Check baggage limits before your flight.</li>

                            <li>Keep your booking confirmation with you.</li>

                        </ul>

                    </div>

                </div>

            </div>

        </div>


        <footer class="text-center mt-5 mb-4">

            <hr>

            <p>

                © 2026 Skyra Airlines

            </p>

        </footer>

    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    </body>

    </html>
