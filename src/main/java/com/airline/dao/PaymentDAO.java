package com.airline.dao;

import com.airline.database.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class PaymentDAO {

    public boolean savePayment(int bookingId,
                               String transactionId,
                               double amount,
                               String paymentMethod){

        boolean success = false;

        try{

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO payments(booking_id,transaction_id,amount,payment_method) VALUES(?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, bookingId);
            ps.setString(2, transactionId);
            ps.setDouble(3, amount);
            ps.setString(4, paymentMethod);

            success = ps.executeUpdate() > 0;

            ps.close();
            con.close();

        }catch(Exception e){
            e.printStackTrace();
        }

        return success;
    }

    public boolean deletePaymentByBookingId(int bookingId) {

        boolean success = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "DELETE FROM payments WHERE booking_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, bookingId);

            success = ps.executeUpdate() > 0;

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

}