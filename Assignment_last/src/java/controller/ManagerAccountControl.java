/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Account;

/**
 *
 * @author FPT SHOP
 */
public class ManagerAccountControl extends HttpServlet {

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
            out.println("<title>Servlet ManagerAccountControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerAccountControl at " + request.getContextPath() + "</h1>");
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
        int index1 = 0;

        int aid = 0;

        String a = request.getParameter("index1");

        if (a != null) {
            index1 = Integer.parseInt(a);
        } else {
            index1 = 1;
        }

        AccountDAO acc = new AccountDAO();
        List<Account> list;
        HttpSession session = request.getSession();

        if (request.getParameter("aid") != null) {
            if (request.getParameter("action") == null) {
                aid = Integer.parseInt(request.getParameter("aid"));
                acc.deleteAccount(aid);
            } else if (request.getParameter("action").equals("unblock")) {
                aid = Integer.parseInt(request.getParameter("aid"));
                acc.blockAccount(aid, 0);
            } else {
                aid = Integer.parseInt(request.getParameter("aid"));
                acc.blockAccount(aid,1);
            }
        }

        session.setAttribute("nop2", (int) Math.ceil(acc.countAccount() * 1.0 / 9));

        list = acc.getNext9Account(index1);

        request.setAttribute("listacc", list);
        session.setAttribute("index1", index1);
        request.getRequestDispatcher("manager-account.jsp").forward(request, response);
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
