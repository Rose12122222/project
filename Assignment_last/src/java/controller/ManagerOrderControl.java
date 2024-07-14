/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import dal.PaymentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Orders;

/**
 *
 * @author FPT SHOP
 */
public class ManagerOrderControl extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManagerOrderControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerOrderControl at " + request.getContextPath() + "</h1>");
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
        String action = (String) request.getParameter("action");
        HttpSession session = request.getSession();
        OrderDAO dao = new OrderDAO();
        String page = (String) request.getParameter("page");
        int pageNumber;
        if (page == null || page.equals("")) {
            pageNumber = 1;
        } else {
            pageNumber = Integer.parseInt(page);
        }
        if (action != null) {
            switch (action) {
                case "update":
                    if (request.getParameter("id") != null) {
                        int id = Integer.parseInt(request.getParameter("id"));
                        if (dao.checkUpdateByOid(id)) {
                            dao.setStatusById(id);
                            dao.updateProductByOid(id);
                        } else {
                            request.setAttribute("error", "The quantity is exceed the amount! The order can't completed!");
                        }
                    }
                    response.sendRedirect("manage-order?page=" + pageNumber);
                    break;
                default:
                    break;
            }
        } else {
            List<Orders> list = dao.getNext10Orders(pageNumber);
            session.setAttribute("numberOfPageOrder", (int) Math.ceil(dao.countOrders() * 1.0 / 10));
            request.setAttribute("listorder", list);
            request.getRequestDispatcher("manager-order.jsp").forward(request, response);
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
