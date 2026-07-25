package com.airline.dao;

import com.airline.database.DBConnection;
import com.airline.model.Seat;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SeatDAO {

    // Create seats for a flight
    public void createSeats(int flightId) {

        String[] rows = {"A","B","C","D"};

        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO seats(flight_id,seat_number,status) VALUES(?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            for(String row : rows){

                for(int i=1;i<=5;i++){

                    ps.setInt(1, flightId);
                    ps.setString(2, row+i);
                    ps.setString(3,"Available");

                    ps.executeUpdate();
                }
            }

            ps.close();
            con.close();

        }catch(Exception e){
            e.printStackTrace();
        }
    }

    // Get seats for a flight
    public List<Seat> getSeatsByFlight(int flightId){

        List<Seat> list = new ArrayList<>();

        try{

            Connection con = DBConnection.getConnection();

            String sql="SELECT * FROM seats WHERE flight_id=? ORDER BY seat_number";

            PreparedStatement ps=con.prepareStatement(sql);

            ps.setInt(1,flightId);

            ResultSet rs=ps.executeQuery();

            while(rs.next()){

                Seat seat=new Seat();

                seat.setSeatId(rs.getInt("seat_id"));
                seat.setFlightId(rs.getInt("flight_id"));
                seat.setSeatNumber(rs.getString("seat_number"));
                seat.setStatus(rs.getString("status"));

                list.add(seat);

            }

            rs.close();
            ps.close();
            con.close();

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }

    public boolean bookSeat(int seatId){

        boolean success = false;

        try{

            Connection con = DBConnection.getConnection();

            String sql = "UPDATE seats SET status='Booked' WHERE seat_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, seatId);

            success = ps.executeUpdate() > 0;

            ps.close();
            con.close();

        }catch(Exception e){
            e.printStackTrace();
        }

        return success;
    }

    public boolean makeSeatAvailable(int seatId){

        boolean success = false;

        try{

            Connection con = DBConnection.getConnection();

            String sql = "UPDATE seats SET status='Available' WHERE seat_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, seatId);

            success = ps.executeUpdate() > 0;

            ps.close();
            con.close();

        }catch(Exception e){
            e.printStackTrace();
        }

        return success;
    }
}
