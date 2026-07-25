package com.airline.dao;

import com.airline.database.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDAO {

    public boolean login(String username,String password){

        boolean success = false;

        String sql =
                "SELECT * FROM admin WHERE username=? AND password=?";

        try{

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1,username);
            ps.setString(2,password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

                success = true;

            }

            rs.close();
            ps.close();
            con.close();

        }catch(Exception e){

            e.printStackTrace();

        }

        return success;

    }

}
