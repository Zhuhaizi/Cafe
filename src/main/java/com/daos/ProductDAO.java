/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.daos;

import com.db.DBConnection;
import com.models.Product;
import com.mysql.cj.xdevapi.PreparableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class ProductDAO {

    private Connection conn = null;

    public ProductDAO() {
        conn = DBConnection.getConnection();
    }

    public ArrayList<Product> getAllByC_ID(int c_id) {
        ArrayList<Product> list = new ArrayList<>();
        ResultSet rs = null;
        try {
            PreparedStatement pst = conn.prepareStatement("select * from product where c_id=?");
            pst.setInt(1, c_id);
            rs = pst.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("p_id"), rs.getString("p_name"), rs.getInt("p_price"), rs.getString("p_img"), rs.getInt("c_id"));
                list.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<Product> getAll() {
        ArrayList<Product> list = new ArrayList<>();
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("select * from product where c_id != 5");
            while (rs.next()) {
                Product p = new Product(rs.getInt("p_id"), rs.getString("p_name"), rs.getInt("p_price"), rs.getString("p_img"), rs.getInt("c_id"));
                list.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Product getProduct(int p_id) {
        Product p = null;
        try {
            PreparedStatement pst = conn.prepareStatement("select * from product where p_id=?");
            pst.setInt(1, p_id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                p = new Product(rs.getInt("p_id"), rs.getString("p_name"), rs.getInt("p_price"), rs.getString("p_img"), rs.getInt("c_id"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }

    public int addProduct(Product p) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("insert into product values (null,?,?,?,?)");
            pst.setString(1, p.getP_name());
            pst.setInt(2, p.getP_price());
            pst.setInt(3, p.getC_id());
            pst.setString(4, p.getP_img());
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
    public int addProductNoImg(Product p) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("insert into product values (null,?,?,?,null)");
            pst.setString(1, p.getP_name());
            pst.setInt(2, p.getP_price());
            pst.setInt(3, p.getC_id());
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int getBiggestID() {
        ResultSet rs = null;
        int id = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("select MAX(p_id) as maxid from product");
            rs = pst.executeQuery();
            while (rs.next()) {
                id = rs.getInt("maxid");
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }
    
    public int updateProduct(Product p){
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("update product set p_name=?, p_price=?, p_img=?, c_id=? where p_id=?");
            pst.setString(1, p.getP_name());
            pst.setInt(2, p.getP_price());
            pst.setString(3, p.getP_img());
            pst.setInt(4, p.getC_id());
            pst.setInt(5, p.getP_id());
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
    public int deleteProduct(int id){
    int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("delete from product where p_id=?");
            pst.setInt(1, id);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    return count;
    }
    
    public int updateOtherProduct(int p_id, String p_name, int p_price){
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("update product set p_name=?, p_price=? where p_id=?");
            pst.setString(1, p_name);
            pst.setInt(2, p_price);
            pst.setInt(3, p_id );
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
}
