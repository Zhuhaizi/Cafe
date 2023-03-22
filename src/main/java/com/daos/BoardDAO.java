/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.daos;

import com.db.DBConnection;
import com.models.Board;
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
public class BoardDAO {

    private Connection conn = null;

    public BoardDAO() {
        conn = DBConnection.getConnection();
    }

    public ArrayList<Board> getAll() {
        ResultSet rs = null;
        ArrayList<Board> list = new ArrayList();
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("select * from board");
            while (rs.next()) {
                Board board = new Board(rs.getInt("b_id"), rs.getInt("b_name"), rs.getInt("b_price"), rs.getInt("b_empty"));
                list.add(board);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BoardDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int setNotEmpty(int id) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareCall("update board set b_empty = 0 where b_id=?");
            pst.setInt(1, id);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BoardDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }

    public int setEmpty(int id) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareCall("update board set b_empty = 1 where b_id=?");
            pst.setInt(1, id);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BoardDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }

    public Board getBoard(int id) {
        Board b = null;
        ResultSet rs = null;
        try {
            PreparedStatement pst = conn.prepareStatement("select * from board where b_id=?");
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {                
                b = new Board(rs.getInt("b_id"), rs.getInt("b_name"), rs.getInt("b_price"), rs.getInt("b_empty"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BoardDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return b;
    }
}
