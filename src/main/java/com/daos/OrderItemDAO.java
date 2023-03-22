/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.daos;

import com.db.DBConnection;
import com.models.OrderItem;
import com.models.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class OrderItemDAO {

    private Connection conn = null;

    public OrderItemDAO() {
        conn = DBConnection.getConnection();
    }

    public int add(OrderItem oi) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("insert into order_items values (null,?,?,?,?)");
            pst.setInt(1, oi.getOi_id());
            pst.setInt(2, oi.getP_id());
            pst.setInt(3, oi.getOi_quantity());
            pst.setInt(4, oi.getOi_price());
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public boolean isIDExist(int id) {
        ResultSet rs = null;
        try {
            PreparedStatement pst = conn.prepareStatement("select * from orders where oi_id=?");
            pst.setInt(1, id);
            rs = pst.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public int generateID() {
        int count = 1;
        while (isIDExist(count) == true) {
            count++;
        }
        return count;
    }

    public int calculateItemPrice(int id, int quantity) {
        int price = 0;
        ProductDAO dao = new ProductDAO();
        Product p = dao.getProduct(id);
        price = p.getP_price() * quantity;
        return price;
    }

    public ResultSet getBoardInfo(int id) {
        ResultSet rs = null;
        try {
            PreparedStatement pst = conn.prepareStatement("SELECT o.o_id AS o_id, oi.oi_general_id AS oi_general_id, oi.oi_id AS oi_id, p.p_id AS p_id, p.p_name AS p_name, oi.oi_quantity AS oi_quantity, oi.oi_price AS oi_price\n"
                    + "FROM order_items oi \n"
                    + "INNER JOIN orders o ON oi.oi_id = o.oi_id \n"
                    + "INNER JOIN product p ON p.p_id = oi.p_id \n"
                    + "INNER JOIN board b ON b.b_id = o.b_id \n"
                    + "WHERE b.b_id = ? and o.o_status = 'no';", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pst.setInt(1, id);
            rs = pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public OrderItem getOrderItem(int id) {
        OrderItem oi = null;
        ResultSet rs = null;
        try {
            PreparedStatement pst = conn.prepareStatement("select * from order_items where oi_general_id=?");
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                oi = new OrderItem(rs.getInt("oi_general_id"), rs.getInt("oi_id"), rs.getInt("p_id"), rs.getInt("oi_quantity"), rs.getInt("oi_price"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return oi;
    }
    
    public ArrayList<OrderItem> getListOrderItem(int id) {
        OrderItem oi = null;
        ResultSet rs = null;
        ArrayList<OrderItem> list = new ArrayList<>();
        try {
            PreparedStatement pst = conn.prepareStatement("select * from order_items where oi_id=?");
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                oi = new OrderItem(rs.getInt("oi_general_id"), rs.getInt("oi_id"), rs.getInt("p_id"), rs.getInt("oi_quantity"), rs.getInt("oi_price"));
                list.add(oi);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int updateItem(OrderItem oi) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("update order_items set p_id=?, oi_quantity=?, oi_price=? where oi_general_id=?");
            pst.setInt(1, oi.getP_id());
            pst.setInt(2, oi.getOi_quantity());
            pst.setInt(3, oi.getOi_price());
            pst.setInt(4, oi.getOi_general_id());
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int deleteItem(int id) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("delete from order_items where oi_general_id=?");
            pst.setInt(1, id);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
}
