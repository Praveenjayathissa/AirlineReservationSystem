package com.airline.dao;

import com.airline.database.DBConnection;
import com.airline.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.airline.model.UserDetails;
import java.util.List;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    public boolean registerUser(User user) {

        boolean success = false;

        String sql = "INSERT INTO users(full_name,email,password,phone,passport_no) VALUES(?,?,?,?,?)";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getPassportNo());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                success = true;
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;

    }

    public User loginUser(String email, String password) {

        User user = null;

        String sql = "SELECT * FROM users WHERE email=? AND password=?";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                user = new User();

                user.setUserId(rs.getInt("user_id"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setPassportNo(rs.getString("passport_no"));

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;

    }

    public List<UserDetails> getAllUsers(){

        List<UserDetails> list = new ArrayList<>();

        try{

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM users ORDER BY user_id DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                UserDetails user = new UserDetails();

                user.setUserId(rs.getInt("user_id"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setPassportNo(rs.getString("passport_no"));
                user.setCreatedAt(rs.getString("created_at"));

                list.add(user);

            }

            rs.close();
            ps.close();
            con.close();

        }catch(Exception e){

            e.printStackTrace();

        }

        return list;

    }

    public List<UserDetails> searchUsers(String keyword){

        List<UserDetails> list = new ArrayList<>();

        try{

            Connection con = DBConnection.getConnection();

            String sql =
                    "SELECT * FROM users " +
                            "WHERE full_name LIKE ? " +
                            "OR email LIKE ? " +
                            "OR passport_no LIKE ?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1,"%"+keyword+"%");
            ps.setString(2,"%"+keyword+"%");
            ps.setString(3,"%"+keyword+"%");

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                UserDetails user = new UserDetails();

                user.setUserId(rs.getInt("user_id"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setPassportNo(rs.getString("passport_no"));
                user.setCreatedAt(rs.getString("created_at"));

                list.add(user);

            }

            rs.close();
            ps.close();
            con.close();

        }catch(Exception e){

            e.printStackTrace();

        }

        return list;

    }

    public boolean deleteUser(int userId){

        boolean success=false;

        try{

            Connection con = DBConnection.getConnection();

            String sql="DELETE FROM users WHERE user_id=?";

            PreparedStatement ps=con.prepareStatement(sql);

            ps.setInt(1,userId);

            success=ps.executeUpdate()>0;

            ps.close();
            con.close();

        }catch(Exception e){

            e.printStackTrace();

        }

        return success;

    }


}
