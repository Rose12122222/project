/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AdminDAO;
import dal.LecturerDAO;
import dal.ManagerDAO;
import dal.StudentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Base64;
import java.util.List;
import model.Admins;
import model.Lecturers;
import model.Managers;
import model.Students;

/**
 *
 * @author FPT SHOP
 */
public class SignInControl extends HttpServlet {

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
            out.println("<title>Servlet LoginControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginControl at " + request.getContextPath() + "</h1>");
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
        Cookie[] cookies = request.getCookies();
        String username = "";
        String password = "";
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("cuser".equals(cookie.getName())) {
                    byte[] decodedBytes = Base64.getDecoder().decode(cookie.getValue());
                    username = new String(decodedBytes, "UTF-8");
                } else if ("cpass".equals(cookie.getName())) {
                    byte[] decodedBytes = Base64.getDecoder().decode(cookie.getValue());
                    password = new String(decodedBytes, "UTF-8");
                }
            }
        }

        request.setAttribute("username", username);
        request.setAttribute("password", password);
        request.getRequestDispatcher("login.jsp").forward(request, response);
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

        String txt = (String) request.getParameter("text");
        String password = (String) request.getParameter("password");
        String remember = (String) request.getParameter("remember");

        String encodedTXT = Base64.getEncoder().encodeToString(txt.getBytes("UTF-8"));
        String encodedPassword = Base64.getEncoder().encodeToString(password.getBytes("UTF-8"));

        Cookie cuser = new Cookie("cuser", encodedTXT);
        Cookie cpass = new Cookie("cpass", encodedPassword);
        Cookie crem = new Cookie("crem", remember);
        if (remember != null) {
            cuser.setMaxAge(10);
            cpass.setMaxAge(10);
            crem.setMaxAge(10);
        } else {
            cuser.setMaxAge(0);
            cpass.setMaxAge(0);
            crem.setMaxAge(0);
        }
        response.addCookie(cuser);
        response.addCookie(cpass);
        response.addCookie(crem);

        String decodedTXT = new String(Base64.getDecoder().decode(encodedTXT), "UTF-8");
        String decodedPassword = new String(Base64.getDecoder().decode(encodedPassword), "UTF-8");

        StudentDAO student = new StudentDAO();
        LecturerDAO lecturer =  new LecturerDAO();
        AdminDAO admin = new AdminDAO();
        ManagerDAO manager = new ManagerDAO();

        List<Students> listStudent = student.getAllStudent();
        List<Lecturers> listLecturer = lecturer.getAllLecturer();
        List<Admins> listAdmin = admin.getAllAdmin();
        List<Managers> listManager = manager.getAllManager();
        
        int tmp = 0;
        for (Students list1 : listStudent) {
            if((decodedTXT.equals(list1.getUsername()) && decodedPassword.equals(list1.getPassword())) || (decodedTXT.equals(list1.getEmail()) && decodedPassword.equals(list1.getPassword()))){
                HttpSession session = request.getSession();
                session.setAttribute("role", list1.getRoll_ID());
                session.setAttribute("sid", list1.getId());
                session.setMaxInactiveInterval(60 * 60 * 60 * 60);
                response.sendRedirect("home.jsp");
                tmp = 1;
            }
        }
        for (Lecturers list2 : listLecturer) {
            if((decodedTXT.equals(list2.getUsername()) && decodedPassword.equals(list2.getPassword())) || (decodedTXT.equals(list2.getEmail()) && decodedPassword.equals(list2.getPassword()))){
                HttpSession session = request.getSession();
                session.setAttribute("role", list2.getRoll_ID());
                session.setAttribute("lid", list2.getId());
                session.setMaxInactiveInterval(60 * 60 * 60 * 60);
                response.sendRedirect("home.jsp");
                tmp = 1;
            }
        }
        for (Admins list3 : listAdmin) {
            if((decodedTXT.equals(list3.getUsername()) && decodedPassword.equals(list3.getPassword())) || (decodedTXT.equals(list3.getEmail()) && decodedPassword.equals(list3.getPassword()))){
                HttpSession session = request.getSession();
                session.setAttribute("role", list3.getRoll_ID());
                session.setAttribute("aid", list3.getId());
                session.setMaxInactiveInterval(60 * 60 * 60 * 60);
                response.sendRedirect("home.jsp");
                tmp = 1;
            }
        }
        for (Managers list4 : listManager) {
            if((decodedTXT.equals(list4.getUsername()) && decodedPassword.equals(list4.getPassword())) || (decodedTXT.equals(list4.getEmail()) && decodedPassword.equals(list4.getPassword()))){
                HttpSession session = request.getSession();
                session.setAttribute("role", list4.getRoll_ID());
                session.setAttribute("mid", list4.getId());
                session.setMaxInactiveInterval(60 * 60 * 60 * 60);
                response.sendRedirect("home.jsp");
                tmp = 1;
            }
        }
        if (tmp == 0) {
            request.setAttribute("error", "The username or password isn't valid!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
