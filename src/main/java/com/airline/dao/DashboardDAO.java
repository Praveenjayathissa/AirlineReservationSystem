package com.airline.dao;

import com.airline.database.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DashboardDAO {

    public int getTotalFlights() {

        int count = 0;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT COUNT(*) FROM flights";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

                count = rs.getInt(1);

            }

            rs.close();
            ps.close();
            con.close();

        }catch(Exception e){

            e.printStackTrace();

        }

        return count;

    }

    public int getTotalUsers() {

        int count = 0;

        try{

            Connection con = DBConnection.getConnection();

            String sql = "SELECT COUNT(*) FROM users";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

                count = rs.getInt(1);

            }

            rs.close();
            ps.close();
            con.close();

        }catch(Exception e){

            e.printStackTrace();

        }

        return count;

    }

    public int getTotalBookings() {

        int count = 0;

        try{

            Connection con = DBConnection.getConnection();

            String sql = "SELECT COUNT(*) FROM bookings";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

                count = rs.getInt(1);

            }

            rs.close();
            ps.close();
            con.close();

        }catch(Exception e){

            e.printStackTrace();

        }

        return count;

    }

    public double getTotalRevenue() {

        double revenue = 0;

        try{

            Connection con = DBConnection.getConnection();

            String sql = "SELECT SUM(amount) FROM payments";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

                revenue = rs.getDouble(1);

            }

            rs.close();
            ps.close();
            con.close();

        }catch(Exception e){

            e.printStackTrace();

        }

        return revenue;

    }

}
