/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.daos;

import com.db.DBConnection;
import com.models.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class OrderDAO {

    private Connection conn = null;

    public OrderDAO() {
        conn = DBConnection.getConnection();
    }

    public int add(Order o) {
        int count = 0;
        Date date = new Date();
        Object datetime = new Timestamp(date.getTime());
        try {
            PreparedStatement pst = conn.prepareStatement("insert into orders values (null,?,?,?,null,?,null,null,null)");
            pst.setInt(1, o.getOi_id());
            pst.setInt(2, o.getB_id());
            pst.setObject(3, datetime);
            pst.setString(4, o.getO_status());
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public Order getOrderByOrderID(int o_id) {
        Order o = null;
        ResultSet rs = null;
        try {
            PreparedStatement pst = conn.prepareStatement("select * from orders where o_id=?");
            pst.setInt(1, o_id);
            rs = pst.executeQuery();
            while (rs.next()) {
                o = new Order(rs.getInt("o_id"), rs.getInt("oi_id"), rs.getInt("b_id"), rs.getTimestamp("o_time_start"), rs.getTimestamp("o_time_end"), rs.getString("o_status"), rs.getInt("o_product_price"), rs.getInt("o_time_price"), rs.getInt("o_totalprice"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return o;
    }

    public Order getOrderByOrderItemID(int oi_id) {
        Order o = null;
        ResultSet rs = null;
        try {
            PreparedStatement pst = conn.prepareStatement("select * from orders where oi_id=?");
            pst.setInt(1, oi_id);
            rs = pst.executeQuery();
            while (rs.next()) {
                o = new Order(rs.getInt("o_id"), rs.getInt("oi_id"), rs.getInt("b_id"), rs.getTimestamp("o_time_start"), rs.getTimestamp("o_time_end"), rs.getString("o_status"), rs.getInt("o_product_price"), rs.getInt("o_time_price"), rs.getInt("o_totalprice"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return o;
    }

//    long milliseconds = date_1.getTime() - date_2.getTime();
//        if (value.equals("second"))
//            return milliseconds / 1000;
//        if (value.equals("minute"))
//            return milliseconds / 1000 / 60;
//        if (value.equals("hours"))
//            return milliseconds / 1000 / 3600;
    public int getTimePrice(Timestamp o_time_start, int b_price) {
        int price = 0;
        Date date = new Date();
        Timestamp o_time_end = new Timestamp(date.getTime());
        long milliseconds = o_time_end.getTime() - o_time_start.getTime();
        int minutes = (int) milliseconds / 1000 / 60;
        price = (b_price / 60) * minutes;
        return price;
    }

    public int updateTimeAndPrice(int total_price, int o_id, int product_price, int time_price) {
        int count = 0;
        Date date = new Date();
        Object datetime = new Timestamp(date.getTime());
        try {
            PreparedStatement pst = conn.prepareStatement("UPDATE orders SET o_product_price=?, o_time_price=?, o_totalprice=?, o_time_end=?, o_status = 'yes' WHERE o_id =?");
            pst.setInt(1, product_price);
            pst.setInt(2, time_price);
            pst.setInt(3, total_price);
            pst.setObject(4, datetime);
            pst.setInt(5, o_id);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public Order getOrderByBID(int b_id) {
        Order o = null;
        ResultSet rs = null;
        try {
            PreparedStatement pst = conn.prepareStatement("SELECT * from orders o INNER JOIN board b ON o.b_id = b.b_id WHERE o.o_status = 'no' ANd b.b_id=?");
            pst.setInt(1, b_id);
            rs = pst.executeQuery();
            while (rs.next()) {
                o = new Order(rs.getInt("o_id"), rs.getInt("oi_id"), rs.getInt("b_id"), rs.getTimestamp("o_time_start"), rs.getTimestamp("o_time_end"), rs.getString("o_status"), rs.getInt("o_product_price"), rs.getInt("o_time_price"), rs.getInt("o_totalprice"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return o;
    }

    public int updateStartTime(int o_id, Object time) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("UPDATE orders SET o_time_start=? WHERE o_id =?");
            pst.setObject(1, time);
            pst.setInt(2, o_id);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
}
