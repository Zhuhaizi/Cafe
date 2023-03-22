/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controllers;

import com.daos.BoardDAO;
import com.daos.OrderDAO;
import com.daos.OrderItemDAO;
import com.daos.ProductDAO;
import com.models.Order;
import com.models.OrderItem;
import com.models.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author DELL
 */
public class BookingController extends HttpServlet {

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
            out.println("<title>Servlet BookingController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingController at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        if (request.getParameter("btnBooking") != null) {
            String[] productID = request.getParameterValues("productID");
            String[] quantity = request.getParameterValues("quantity");
            String b_id = request.getParameter("b_id");
            String othername = request.getParameter("othername");
            String otherprice = request.getParameter("otherprice");

            OrderItemDAO oiDao = new OrderItemDAO();
            int oi_id = oiDao.generateID();

            if (productID != null && quantity != null) {
                for (int i = 0; i < productID.length; i++) {
                    int oi_price = oiDao.calculateItemPrice(Integer.parseInt(productID[i]), Integer.parseInt(quantity[i]));
                    OrderItem oi = new OrderItem(oi_id, Integer.parseInt(productID[i]), Integer.parseInt(quantity[i]), oi_price);
                    oiDao.add(oi);
                }
            }

            if (othername != null && otherprice != null) {
                Product p = new Product(othername, Integer.parseInt(otherprice), "", 5);
                ProductDAO pDao = new ProductDAO();
                int count3 = pDao.addProductNoImg(p);
                if (count3 > 0) {
                    int id = pDao.getBiggestID();
                    oiDao.add(new OrderItem(oi_id, id, 1, p.getP_price()));
                }
            }

            Order o = new Order(oi_id, Integer.parseInt(b_id));

            OrderDAO oDao = new OrderDAO();
            int count = oDao.add(o);
            if (count > 0) {
                BoardDAO bDao = new BoardDAO();
                int count2 = bDao.setNotEmpty(Integer.parseInt(b_id));
                if (count2 > 0) {
                    response.sendRedirect("main");
                }
            } else {
                response.sendRedirect("menu");
            }
        }
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
