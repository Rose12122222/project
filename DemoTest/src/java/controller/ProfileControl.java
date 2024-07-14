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
public class ProfileControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int role = 0;
        int accid = 0;
        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("role") != null) {
                role = (int) session.getAttribute("role");
                if (role == 5) {
                    StudentDAO stu = new StudentDAO();

                    if (session.getAttribute("sid") != null) {
                        accid = (int) session.getAttribute("sid");
                    }
                    if (stu.getById(accid) == null) {
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    } else {
                        session.setAttribute("accid", accid);
                        request.setAttribute("USER", stu.getById(accid));
                        request.getRequestDispatcher("profile.jsp").forward(request, response);
                    }

                } else if (role == 1) {

                    AdminDAO ad = new AdminDAO();
                    if (session.getAttribute("aid") != null) {
                        accid = (int) session.getAttribute("aid");
                    }
                    if (ad.getById(accid) == null) {
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    } else {
                        session.setAttribute("accid", accid);
                        request.setAttribute("USER", ad.getById(accid));
                        request.getRequestDispatcher("profile.jsp").forward(request, response);
                    }

                } else if (role == 2) {
                 
                    
                } else if (role == 3) {
                    LecturerDAO lec = new LecturerDAO();
                    if (session.getAttribute("lid") != null) {
                        accid = (int) session.getAttribute("lid");
                    }
                    if (lec.getById(accid) == null) {
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    } else {
                        session.setAttribute("lid", accid);
                        request.setAttribute("USER", lec.getById(accid));
                        request.getRequestDispatcher("profile.jsp").forward(request, response);
                    }
                } else if (role == 4) {
                    LecturerDAO lec = new LecturerDAO();
                    if (session.getAttribute("lid") != null) {
                        accid = (int) session.getAttribute("lid");
                    }
                    if (lec.getById(accid) == null) {
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    } else {
                        session.setAttribute("lid", accid);
                        request.setAttribute("USER", lec.getById(accid));
                        request.getRequestDispatcher("profile.jsp").forward(request, response);
                    }
                }
            } else {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("profile.jsp").forward(request, response);
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
        int role = 0;
        try {
            String url = "profile.jsp";
            String ids = (String) request.getParameter("id");
            String fullName = (String) request.getParameter("name");
            String genderS = (String) request.getParameter("gender");
            String Dob = (String) request.getParameter("dob");
            String email = (String) request.getParameter("email");
            String Phone = (String) request.getParameter("phone");
            String Address = (String) request.getParameter("address");
            int gender = 0;

            if (genderS.equals("male")) {
                gender = 1;
            }
            int id = Integer.parseInt(ids);
            HttpSession session = request.getSession(false);
            if (session.getAttribute("role") != null) {
                role = (int) session.getAttribute("role");
                if (role == 5) {
                    StudentDAO stuDAO = new StudentDAO();
                    Students stu = new Students();
                    stu.setFullName(fullName);
                    stu.setId(id);
                    stu.setBirthDate(Dob);
                    stu.setEmail(email);
                    stu.setPhoneNumber(Phone);
                    stu.setAddress(Address);
                    stu.setGender(gender);

                    Students updatedStudent = stuDAO.Update(stu);
                    if (updatedStudent != null) {
                        request.setAttribute("USER", updatedStudent);
                        request.setAttribute("MESSAGE", "Update Successfully");
                    } else {
                        request.setAttribute("ERROR", "Update Failed");
                    }
                } else if (role == 1) {
                    AdminDAO adminDAO = new AdminDAO();
                    Admins stu = new Admins();
                    stu.setFullName(fullName);
                    stu.setId(id);
                    stu.setBirthDate(Dob);
                    stu.setEmail(email);
                    stu.setPhoneNumber(Phone);
                    stu.setAddress(Address);
                    stu.setGender(gender);

                    Admins adminUpdated = adminDAO.Update(stu);
                    if (adminUpdated != null) {
                        request.setAttribute("USER", adminUpdated);
                        request.setAttribute("MESSAGE", "Update Successfully");
                    } else {
                        request.setAttribute("ERROR", "Update Failed");
                    }
                } else if (role == 3 || role == 4) {
                    Lecturers lectures = new Lecturers();
                    LecturerDAO lecturesDAO = new LecturerDAO();
                    lectures.setFullName(fullName);
                    lectures.setId(id);
                    lectures.setBirthDate(Dob);
                    lectures.setEmail(email);
                    lectures.setPhoneNumber(Phone);
                    lectures.setAddress(Address);
                    lectures.setGender(gender);

                    Lecturers updatedStudent = lecturesDAO.Update(lectures);
                    if (updatedStudent != null) {
                        request.setAttribute("USER", updatedStudent);
                        request.setAttribute("MESSAGE", "Update Successfully");
                    } else {
                        request.setAttribute("ERROR", "Update Failed");
                    }

                } else if (role == 2) {
                    Managers managers = new Managers();
                    ManagerDAO managersDAO = new ManagerDAO();
                    managers.setFullName(fullName);
                    managers.setId(id);
                    managers.setBirthDate(Dob);
                    managers.setEmail(email);
                    managers.setPhoneNumber(Phone);
                    managers.setAddress(Address);
                    managers.setGender(gender);

                    Managers updatedStudent = managersDAO.Update(managers);
                    if (updatedStudent != null) {
                        request.setAttribute("USER", updatedStudent);
                        request.setAttribute("MESSAGE", "Update Successfully");
                    } else {
                        request.setAttribute("ERROR", "Update Failed");
                    }
                }
            }
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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
