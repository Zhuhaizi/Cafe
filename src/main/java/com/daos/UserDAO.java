/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.daos;

import com.db.DBConnection;
import com.models.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class UserDAO {

    private Connection conn = null;

    public UserDAO() {
        conn = DBConnection.getConnection();
    }

    public User checkLogin(String username, String pass) {
        User user = null;
        try {
            PreparedStatement pst = conn.prepareStatement("select * from user where u_username = ? and u_pass = ?");
            pst.setString(1, username);
            pst.setString(2, pass);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                user = new User(rs.getInt("u_id"), rs.getString("u_fullname"), rs.getString("u_username"), rs.getString("u_pass"), rs.getString("u_type"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

}
