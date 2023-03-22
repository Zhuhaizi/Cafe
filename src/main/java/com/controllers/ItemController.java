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
import com.models.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
public class ItemController extends HttpServlet {

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
            out.println("<title>Servlet ItemController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ItemController at " + request.getContextPath() + "</h1>");
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
        if (request.getParameter("btnMenu") != null) {
            String[] plist = request.getParameterValues("chkItems"); //if empty --> null
            String othername = request.getParameter("othername");    //if empty --> ""
            String otherprice = request.getParameter("otherprice");
            String b_id = request.getParameter("b_id");

            if (plist == null && othername.equals("") && otherprice.equals("")) {
                OrderItemDAO oiDao = new OrderItemDAO();
                int oi_id = oiDao.generateID();

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
            } else {
                if (plist != null) {
                    ArrayList<Product> BookingList = new ArrayList<>();
                    ProductDAO dao = new ProductDAO();
                    for (int i = 0; i < plist.length; i++) {
                        BookingList.add(dao.getProduct(Integer.parseInt(plist[i])));
                    }
                    request.setAttribute("plist", BookingList);
                }

                if (!othername.equals("") && !otherprice.equals("")) {
                    request.setAttribute("othername", othername);
                    request.setAttribute("otherprice", otherprice);
                }
                request.setAttribute("b_id", b_id);
                request.getRequestDispatcher("booking.jsp").forward(request, response);
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
