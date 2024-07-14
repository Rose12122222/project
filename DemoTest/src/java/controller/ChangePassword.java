/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.StudentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Students;

/**
 *
 * @author nguye
 */
public class ChangePassword extends HttpServlet {

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
            out.println("<title>Servlet ChangePassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassword at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("changepass.jsp").forward(request, response);
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
        String validMessage;
        String getemail;
        String password;
        String confirm;
        try {
            getemail = request.getParameter("getemail");
            password = request.getParameter("password");
            confirm = request.getParameter("confirm");

            StudentDAO student = new StudentDAO();
            List<Students> listStudent = student.getAllStudent();

            if (!password.equals(confirm)) {
                throw new NumberFormatException();
            }
            int sid = 0;
            for (Students students : listStudent) {
                if (students.getEmail().equals(getemail)) {
                    if (students.getPassword().equals(password)) {
                        throw new NullPointerException();
                    } else {
                        sid = students.getId();
                    }
                }
            }
            if (sid != 0) {
                student.editPassword(sid, password);
                response.sendRedirect("login");
            }

        } catch (NumberFormatException e) {
            validMessage = "The password and confirm must be same, Please not enter space !";
            request.setAttribute("error", validMessage);
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
        } catch (NullPointerException e) {
            validMessage = "The new password and old password must be different,Please not enter space !";
            request.setAttribute("error", validMessage);
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
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
