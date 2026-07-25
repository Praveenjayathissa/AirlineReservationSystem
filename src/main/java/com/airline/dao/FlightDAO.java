package com.airline.dao;

import com.airline.database.DBConnection;
import com.airline.model.Flight;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.airline.dao.SeatDAO;

public class FlightDAO {

    // Add Flight
    public boolean addFlight(Flight flight) {

        boolean success = false;

        String sql = "INSERT INTO flights(flight_number, airline, origin, destination, departure_date, departure_time, arrival_time, price) VALUES(?,?,?,?,?,?,?,?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, flight.getFlightNumber());
            ps.setString(2, flight.getAirline());
            ps.setString(3, flight.getOrigin());
            ps.setString(4, flight.getDestination());
            ps.setString(5, flight.getDepartureDate());
            ps.setString(6, flight.getDepartureTime());
            ps.setString(7, flight.getArrivalTime());
            ps.setDouble(8, flight.getPrice());

            int rows = ps.executeUpdate();

            if (rows > 0) {

                ResultSet rs = ps.getGeneratedKeys();

                if (rs.next()) {

                    int flightId = rs.getInt(1);

                    SeatDAO seatDAO = new SeatDAO();
                    seatDAO.createSeats(flightId);

                }

                success = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    // View All Flights
    public List<Flight> getAllFlights() {

        List<Flight> list = new ArrayList<>();

        String sql = "SELECT * FROM flights ORDER BY flight_id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Flight flight = new Flight();

                flight.setFlightId(rs.getInt("flight_id"));
                flight.setFlightNumber(rs.getString("flight_number"));
                flight.setAirline(rs.getString("airline"));
                flight.setOrigin(rs.getString("origin"));
                flight.setDestination(rs.getString("destination"));
                flight.setDepartureDate(rs.getString("departure_date"));
                flight.setDepartureTime(rs.getString("departure_time"));
                flight.setArrivalTime(rs.getString("arrival_time"));
                flight.setPrice(rs.getDouble("price"));

                list.add(flight);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Get One Flight
    public Flight getFlightById(int id) {

        Flight flight = null;

        String sql = "SELECT * FROM flights WHERE flight_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                flight = new Flight();

                flight.setFlightId(rs.getInt("flight_id"));
                flight.setFlightNumber(rs.getString("flight_number"));
                flight.setAirline(rs.getString("airline"));
                flight.setOrigin(rs.getString("origin"));
                flight.setDestination(rs.getString("destination"));
                flight.setDepartureDate(rs.getString("departure_date"));
                flight.setDepartureTime(rs.getString("departure_time"));
                flight.setArrivalTime(rs.getString("arrival_time"));
                flight.setPrice(rs.getDouble("price"));
            }

            rs.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flight;
    }

    // Update Flight
    public boolean updateFlight(Flight flight) {

        boolean success = false;

        String sql = "UPDATE flights SET flight_number=?, airline=?, origin=?, destination=?, departure_date=?, departure_time=?, arrival_time=?, price=? WHERE flight_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, flight.getFlightNumber());
            ps.setString(2, flight.getAirline());
            ps.setString(3, flight.getOrigin());
            ps.setString(4, flight.getDestination());
            ps.setString(5, flight.getDepartureDate());
            ps.setString(6, flight.getDepartureTime());
            ps.setString(7, flight.getArrivalTime());
            ps.setDouble(8, flight.getPrice());
            ps.setInt(9, flight.getFlightId());

            success = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    // Delete Flight
    public boolean deleteFlight(int id) {

        boolean success = false;

        String sql = "DELETE FROM flights WHERE flight_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            success = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }
}