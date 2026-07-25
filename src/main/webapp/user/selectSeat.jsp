<%@ page import="java.util.List" %>
<%@ page import="com.airline.dao.SeatDAO" %>
<%@ page import="com.airline.model.Seat" %>
<%@ page import="com.airline.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%
User user = (User) session.getAttribute("loggedUser");

if(user == null){
    response.sendRedirect("../login.jsp");
    return;
}

int flightId = Integer.parseInt(request.getParameter("flightId"));

SeatDAO dao = new SeatDAO();
List<Seat> seats = dao.getSeatsByFlight(flightId);
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>Select Your Seat</title>

    <!-- Bootstrap -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Bootstrap Icons -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
          rel="stylesheet">

    <!-- Google Font -->

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">

    <!-- Your CSS -->

    <link rel="stylesheet"
          href="../assets/css/style.css">

</head>

<body>

<!-- Navbar -->

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">

    <div class="container">

        <a class="navbar-brand fw-bold"
           href="../dashboard.jsp">

              Skyra Airlines

        </a>

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbar">

            <span class="navbar-toggler-icon"></span>

        </button>

        <div class="collapse navbar-collapse"
             id="navbar">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">

                    <a class="nav-link"
                       href="../dashboard.jsp">

                        Dashboard

                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link"
                       href="flights.jsp">

                        Flights

                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link active"
                       href="#">

                        Select Seat

                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link"
                       href="../logout">

                        Logout

                    </a>

                </li>

            </ul>

        </div>

    </div>

</nav>

<div class="container py-5">

    <!-- Header -->

    <div class="seat-header text-center">

        <h1>

            <i class="bi bi-airplane-engines-fill"></i>

            Select Your Seat

        </h1>

        <p class="text-muted">

            Welcome,

            <strong><%= user.getFullName() %></strong>

            • Choose an available seat to continue to payment.

        </p>

    </div>

    <!-- Legend -->

    <div class="seat-legend">

        <div>

            <span class="seat-demo available-demo"></span>

            Available

        </div>

        <div>

            <span class="seat-demo booked-demo"></span>

            Booked

        </div>

    </div>

    <!-- Aircraft -->

    <div class="aircraft">

        <div class="cockpit">

            ✈ COCKPIT

        </div>

        <div class="aircraft-body">

            <div class="seat-label-row">

                <span>A</span>
                <span>B</span>

                <span class="aisle-label">AISLE</span>

                <span>C</span>
                <span>D</span>

            </div>

            <div class="seat-grid"><%
                                   for(int row=1; row<=5; row++){
                                   %>

                                   <div class="seat-row">

                                       <%
                                       for(Seat seat : seats){

                                           String seatNumber = seat.getSeatNumber();

                                           if(seatNumber.equals("A"+row) || seatNumber.equals("B"+row)){
                                       %>

                                           <% if(seat.getStatus().equals("Available")){ %>

                                               <a href="payment.jsp?seatId=<%=seat.getSeatId()%>&flightId=<%=flightId%>"
                                                  class="seat-btn available">

                                                   <%= seatNumber %>

                                               </a>

                                           <% }else{ %>

                                               <button class="seat-btn booked"
                                                       disabled>

                                                   <%= seatNumber %>

                                               </button>

                                           <% } %>

                                       <%
                                           }
                                       }
                                       %>

                                       <div class="aisle"></div>

                                       <%
                                       for(Seat seat : seats){

                                           String seatNumber = seat.getSeatNumber();

                                           if(seatNumber.equals("C"+row) || seatNumber.equals("D"+row)){
                                       %>

                                           <% if(seat.getStatus().equals("Available")){ %>

                                               <a href="payment.jsp?seatId=<%=seat.getSeatId()%>&flightId=<%=flightId%>"
                                                  class="seat-btn available">

                                                   <%= seatNumber %>

                                               </a>

                                           <% }else{ %>

                                               <button class="seat-btn booked"
                                                       disabled>

                                                   <%= seatNumber %>

                                               </button>

                                           <% } %>

                                       <%
                                           }
                                       }
                                       %>

                                   </div>

                                   <%
                                   }
                                   %>

                                           </div>

                                       </div>

                                       <div class="text-center mt-5">

                                           <a href="flights.jsp"
                                              class="btn btn-outline-secondary btn-lg">

                                               <i class="bi bi-arrow-left"></i>

                                               Back to Flights

                                           </a>

                                       </div>

                                   </div>

                                   <footer class="footer-simple mt-5">

                                       <h5>

                                             Skyra Airlines

                                       </h5>

                                       <p>

                                           Fly Safe • Fly Smart • Fly Worldwide

                                       </p>

                                   </footer>

                                   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

                                   </body>

                                   </html>