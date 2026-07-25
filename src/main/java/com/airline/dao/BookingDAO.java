package com.airline.dao;

import com.airline.database.DBConnection;
import com.airline.model.Booking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.airline.model.BookingDetails;

public class BookingDAO {

    public boolean createBooking(int userId, int flightId, int seatId) {

        boolean success = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO bookings(user_id,flight_id,seat_id) VALUES(?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);
            ps.setInt(2, flightId);
            ps.setInt(3, seatId);

            success = ps.executeUpdate() > 0;

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    public List<Booking> getBookingsByUser(int userId){

        List<Booking> list = new ArrayList<>();

        try{

            Connection con = DBConnection.getConnection();

            String sql =
                    "SELECT b.booking_id, f.flight_number, f.origin, f.destination, " +
                            "f.departure_date, s.seat_number " +
                            "FROM bookings b " +
                            "JOIN flights f ON b.flight_id = f.flight_id " +
                            "JOIN seats s ON b.seat_id = s.seat_id " +
                            "WHERE b.user_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Booking booking = new Booking();

                booking.setBookingId(rs.getInt("booking_id"));
                booking.setFlightNumber(rs.getString("flight_number"));
                booking.setOrigin(rs.getString("origin"));
                booking.setDestination(rs.getString("destination"));
                booking.setDepartureDate(rs.getString("departure_date"));
                booking.setSeatNumber(rs.getString("seat_number"));

                list.add(booking);
            }

            rs.close();
            ps.close();
            con.close();

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }

    public int getSeatIdByBooking(int bookingId){

        int seatId = 0;

        try{

            Connection con = DBConnection.getConnection();

            String sql = "SELECT seat_id FROM bookings WHERE booking_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, bookingId);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                seatId = rs.getInt("seat_id");
            }

            rs.close();
            ps.close();
            con.close();

        }catch(Exception e){
            e.printStackTrace();
        }

        return seatId;
    }

    public boolean deleteBooking(int bookingId){

        boolean success = false;

        try{

            Connection con = DBConnection.getConnection();

            String sql = "DELETE FROM bookings WHERE booking_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, bookingId);

            success = ps.executeUpdate() > 0;

            ps.close();
            con.close();

        }catch(Exception e){
            e.printStackTrace();
        }

        return success;
    }

    public int getLatestBookingId(int userId){

        int bookingId = 0;

        try{

            Connection con = DBConnection.getConnection();

            String sql = "SELECT booking_id FROM bookings WHERE user_id=? ORDER BY booking_id DESC LIMIT 1";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                bookingId = rs.getInt("booking_id");
            }

            rs.close();
            ps.close();
            con.close();

        }catch(Exception e){
            e.printStackTrace();
        }

        return bookingId;
    }

    public List<BookingDetails> getAllBookingDetails() {

        List<BookingDetails> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "SELECT b.booking_id, u.full_name, f.flight_number, " +
                            "f.origin, f.destination, s.seat_number, " +
                            "p.amount, p.payment_method, b.booking_date " +
                            "FROM bookings b " +
                            "JOIN users u ON b.user_id = u.user_id " +
                            "JOIN flights f ON b.flight_id = f.flight_id " +
                            "JOIN seats s ON b.seat_id = s.seat_id " +
                            "JOIN payments p ON b.booking_id = p.booking_id " +
                            "ORDER BY b.booking_date DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                BookingDetails booking = new BookingDetails();

                booking.setBookingId(rs.getInt("booking_id"));
                booking.setPassengerName(rs.getString("full_name"));
                booking.setFlightNumber(rs.getString("flight_number"));
                booking.setOrigin(rs.getString("origin"));
                booking.setDestination(rs.getString("destination"));
                booking.setSeatNumber(rs.getString("seat_number"));
                booking.setAmount(rs.getDouble("amount"));
                booking.setPaymentMethod(rs.getString("payment_method"));
                booking.setBookingDate(rs.getString("booking_date"));

                list.add(booking);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<BookingDetails> searchBookings(String keyword) {

        List<BookingDetails> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "SELECT b.booking_id, u.full_name, f.flight_number, " +
                            "f.origin, f.destination, s.seat_number, " +
                            "p.amount, p.payment_method, b.booking_date " +
                            "FROM bookings b " +
                            "JOIN users u ON b.user_id = u.user_id " +
                            "JOIN flights f ON b.flight_id = f.flight_id " +
                            "JOIN seats s ON b.seat_id = s.seat_id " +
                            "JOIN payments p ON b.booking_id = p.booking_id " +
                            "WHERE u.full_name LIKE ? OR f.flight_number LIKE ? " +
                            "ORDER BY b.booking_date DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                BookingDetails booking = new BookingDetails();

                booking.setBookingId(rs.getInt("booking_id"));
                booking.setPassengerName(rs.getString("full_name"));
                booking.setFlightNumber(rs.getString("flight_number"));
                booking.setOrigin(rs.getString("origin"));
                booking.setDestination(rs.getString("destination"));
                booking.setSeatNumber(rs.getString("seat_number"));
                booking.setAmount(rs.getDouble("amount"));
                booking.setPaymentMethod(rs.getString("payment_method"));
                booking.setBookingDate(rs.getString("booking_date"));

                list.add(booking);
            }

            rs.close();
            ps.close();
            con.close();

        } catch(Exception e){

            e.printStackTrace();

        }

        return list;
    }

}