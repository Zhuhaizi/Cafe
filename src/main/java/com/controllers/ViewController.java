/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controllers;

import com.daos.BoardDAO;
import com.daos.OrderDAO;
import com.daos.OrderItemDAO;
import com.models.Board;
import com.models.Order;
import com.models.OrderItem;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class ViewController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ViewController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int b_id = Integer.parseInt(request.getParameter("b_id"));
        request.setAttribute("b_id", b_id);
        
        BoardDAO bDao = new BoardDAO();
        Board b = bDao.getBoard(b_id);
        int o_product_price = 0;

        OrderDAO oDao = new OrderDAO();
        Order o = oDao.getOrderByBID(b_id);

        OrderItemDAO oiDao = new OrderItemDAO();
        ArrayList<OrderItem> oiList = new ArrayList<>();
        oiList = oiDao.getListOrderItem(o.getOi_id());

        if (!oiList.isEmpty()) {

            ResultSet rs = oiDao.getBoardInfo(b_id);

            for (int i = 0; i < oiList.size(); i++) {
                o_product_price += oiList.get(i).getOi_price();
            }

            int timePrice = oDao.getTimePrice(o.getO_time_start(), b.getB_price());
            String o_time_start = new SimpleDateFormat("HH : mm").format(o.getO_time_start());

            request.setAttribute("info", rs);
            request.setAttribute("o_id", o.getO_id());
            request.setAttribute("oi_id", o.getOi_id());
            request.setAttribute("o_time_price", timePrice);
            request.setAttribute("o_product_price", o_product_price);
            request.setAttribute("o_time_start", o_time_start);
            request.getRequestDispatcher("view.jsp").forward(request, response);
        } else {
            int timePrice = oDao.getTimePrice(o.getO_time_start(), b.getB_price());
            String o_time_start = new SimpleDateFormat("HH : mm").format(o.getO_time_start());

            request.setAttribute("noitem", "Không có sản phẩm nào!");
            request.setAttribute("o_id", o.getO_id());
            request.setAttribute("oi_id", o.getOi_id());
            request.setAttribute("o_time_price", timePrice);
            request.setAttribute("o_product_price", 0);
            request.setAttribute("o_time_start", o_time_start);
            request.getRequestDispatcher("view.jsp").forward(request, response);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
