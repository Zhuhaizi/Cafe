/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controllers;

import com.daos.OrderItemDAO;
import com.daos.ProductDAO;
import com.models.OrderItem;
import com.models.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author DELL
 */
public class EditItemController extends HttpServlet {

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
            out.println("<title>Servlet EditItemController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditItemController at " + request.getContextPath() + "</h1>");
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
        int id = Integer.parseInt(request.getParameter("id"));
        int b_id = Integer.parseInt(request.getParameter("b_id"));

        OrderItemDAO oiDao = new OrderItemDAO();
        OrderItem oi = oiDao.getOrderItem(id);

        ProductDAO pDao = new ProductDAO();
        ArrayList<Product> list = pDao.getAll();

        Product p = pDao.getProduct(oi.getP_id());
        if (p.getC_id() != 5) {
            request.setAttribute("oi", oi);
            request.setAttribute("plist", list);
            request.setAttribute("b_id", b_id);
            request.getRequestDispatcher("edititem.jsp").forward(request, response);
        } else {
            request.setAttribute("oi_general_id", id);
            request.setAttribute("b_id", b_id);
            request.setAttribute("p", p);
            request.getRequestDispatcher("editotheritem.jsp").forward(request, response);
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
        if (request.getParameter("btnEdit") != null) {
            int oi_general_id = Integer.parseInt(request.getParameter("oi_general_id"));
            int oi_id = Integer.parseInt(request.getParameter("oi_id"));
            int p_id = Integer.parseInt(request.getParameter("p_id"));
            int oi_quantity = Integer.parseInt(request.getParameter("oi_quantity"));
            int b_id = Integer.parseInt(request.getParameter("b_id"));

            OrderItemDAO oiDao = new OrderItemDAO();
            int oi_price = oiDao.calculateItemPrice(p_id, oi_quantity);

            OrderItem oi = new OrderItem(oi_general_id, oi_id, p_id, oi_quantity, oi_price);
            int count = oiDao.updateItem(oi);
            if (count > 0) {
                response.sendRedirect("view?b_id=" + b_id);
            } else {
                response.sendRedirect("main");
            }
        }
        if (request.getParameter("btnOtherEdit") != null) {
            int p_id = Integer.parseInt(request.getParameter("p_id"));
            String p_name = request.getParameter("p_name");
            int p_price = Integer.parseInt(request.getParameter("p_price"));
            int b_id = Integer.parseInt(request.getParameter("b_id"));
            int oi_general_id = Integer.parseInt(request.getParameter("oi_general_id"));
                    
            ProductDAO dao = new ProductDAO();
            int count = dao.updateOtherProduct(p_id, p_name, p_price);
            
            OrderItemDAO oiDao = new OrderItemDAO();
            OrderItem o = oiDao.getOrderItem(oi_general_id);
            o.setOi_price(p_price);
            int count2 = oiDao.updateItem(o);
            if (count > 0 && count2 > 0) {
                response.sendRedirect("view?b_id=" + b_id);
            } else {
                response.sendRedirect("main");
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
