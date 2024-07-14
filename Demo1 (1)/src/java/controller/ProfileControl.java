/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.sun.mail.util.MessageRemovedIOException;
import dal.AdminDAO;
import dal.LecturerDAO;
import dal.ManagerDAO;
import dal.StudentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.List;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.Admins;
import model.Lecturers;
import model.Managers;
import model.Students;

/**
 *
 * @author Windows
 */
public class ProfileControl extends HttpServlet {

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
            out.println("<title>Servlet ProfileControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileControl at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        HttpSession session = request.getSession();
        StudentDAO student = new StudentDAO();
        LecturerDAO lecturer = new LecturerDAO();
        AdminDAO admin = new AdminDAO();
        ManagerDAO manager = new ManagerDAO();

        int accid = 0;
        if (session.getAttribute("aid") != null) {
            accid = (int) session.getAttribute("aid");
        } else if (session.getAttribute("sid") != null) {
            accid = (int) session.getAttribute("sid");
        } else if (session.getAttribute("lid") != null) {
            accid = (int) session.getAttribute("lid");
        } else {
            accid = (int) session.getAttribute("mid");
        }
        if (student.getByID(accid) == null) {
            session.setAttribute("accid", accid);
            request.getRequestDispatcher("profile.jsp").forward(request, response);

        } else if (lecturer.getById(accid) == null) {
            session.setAttribute("accid", accid);
            request.getRequestDispatcher("profile.jsp").forward(request, response);

        } else if (admin.getByID(accid) == null) {
            session.setAttribute("accid", accid);
            request.getRequestDispatcher("profile.jsp").forward(request, response);

        } else if (manager.getById(accid) == null) {
            session.setAttribute("accid", accid);
            request.getRequestDispatcher("profile.jsp").forward(request, response);

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
//        HttpSession session = request.getSession();
        HttpSession session = request.getSession();
        String validMessage;
        StudentDAO student = new StudentDAO();
        LecturerDAO lecturer = new LecturerDAO();
        AdminDAO admin = new AdminDAO();
        ManagerDAO manager = new ManagerDAO();
        List<Students> listStudent = student.getAllStudent();
        List<Lecturers> listLecturer = lecturer.getAllLecturer();
        List<Admins> listAdmin = admin.getAllAdmin();
        List<Managers> listManager = manager.getAllManager();
        String fullName;
        int male = -1;
        int female = -1;
        String BoD;
        String email;

        String phone;
        String address;
     
        for (Students list1 : listStudent) {
           
            try {

                int accid = student.countInfoDetail() + 1;
                fullName = request.getParameter("fullName");
                if (request.getParameter("accid") != null) {
                    accid = Integer.parseInt(request.getParameter("accid"));
                }
                if (session.getAttribute("aid") != null) {
                    accid = (int) session.getAttribute("aid");
                }
                if (request.getParameter("gender1") != null) {
                    male = Integer.parseInt(request.getParameter("gender1"));
                }
                if (request.getParameter("gender2") != null) {
                    female = Integer.parseInt(request.getParameter("gender2"));
                }
                BoD = request.getParameter("Birthday");
                email = request.getParameter("email");
                phone = request.getParameter("phone");
                address = request.getParameter("address");
                if (male != -1 && female != -1) {
                    throw new MessageRemovedIOException();
                }
                if (!BoD.isBlank()) {
                    if (isValidBirthday(BoD) == false) {
                        throw new NullPointerException();
                    }
                }

                if (BoD.isBlank()) {
                    BoD = null;
                }
                if (male != -1 && female != -1) {
                    throw new MessageRemovedIOException();
                }

            } catch (Exception e) {

            }
        }

        for (Lecturers list2 : listLecturer) {
           
            try {

                int accid = student.countInfoDetail() + 1;
                fullName = request.getParameter("fullName");
                if (request.getParameter("accid") != null) {
                    accid = Integer.parseInt(request.getParameter("accid"));
                }
                if (session.getAttribute("aid") != null) {
                    accid = (int) session.getAttribute("aid");
                }
                if (request.getParameter("gender1") != null) {
                    male = Integer.parseInt(request.getParameter("gender1"));
                }
                if (request.getParameter("gender2") != null) {
                    female = Integer.parseInt(request.getParameter("gender2"));
                }
                BoD = request.getParameter("Birthday");
                email = request.getParameter("email");
                phone = request.getParameter("phone");
                address = request.getParameter("address");
                if (male != -1 && female != -1) {
                    throw new MessageRemovedIOException();
                }
                if (!BoD.isBlank()) {
                    if (isValidBirthday(BoD) == false) {
                        throw new NullPointerException();
                    }
                }

                if (BoD.isBlank()) {
                    BoD = null;
                }
                if (male != -1 && female != -1) {
                    throw new MessageRemovedIOException();
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
         for (Admins list3 : listAdmin) {
            
            try {

                int accid = student.countInfoDetail() + 1;
                fullName = request.getParameter("fullName");
                if (request.getParameter("accid") != null) {
                    accid = Integer.parseInt(request.getParameter("accid"));
                }
                if (session.getAttribute("aid") != null) {
                    accid = (int) session.getAttribute("aid");
                }
                if (request.getParameter("gender1") != null) {
                    male = Integer.parseInt(request.getParameter("gender1"));
                }
                if (request.getParameter("gender2") != null) {
                    female = Integer.parseInt(request.getParameter("gender2"));
                }
                BoD = request.getParameter("Birthday");
                email = request.getParameter("email");
                phone = request.getParameter("phone");
                address = request.getParameter("address");
                if (male != -1 && female != -1) {
                    throw new MessageRemovedIOException();
                }
                if (!BoD.isBlank()) {
                    if (isValidBirthday(BoD) == false) {
                        throw new NullPointerException();
                    }
                }

                if (BoD.isBlank()) {
                    BoD = null;
                }
                if (male != -1 && female != -1) {
                    throw new MessageRemovedIOException();
                }

            } catch (Exception e) {

            }
        }
          for (Managers list4 : listManager) {
             
            try {

                int accid = student.countInfoDetail() + 1;
                fullName = request.getParameter("fullName");
                if (request.getParameter("accid") != null) {
                    accid = Integer.parseInt(request.getParameter("accid"));
                }
                if (session.getAttribute("aid") != null) {
                    accid = (int) session.getAttribute("aid");
                }
                if (request.getParameter("gender1") != null) {
                    male = Integer.parseInt(request.getParameter("gender1"));
                }
                if (request.getParameter("gender2") != null) {
                    female = Integer.parseInt(request.getParameter("gender2"));
                }
                BoD = request.getParameter("Birthday");
                email = request.getParameter("email");
                phone = request.getParameter("phone");
                address = request.getParameter("address");
                if (male != -1 && female != -1) {
                    throw new MessageRemovedIOException();
                }
                if (!BoD.isBlank()) {
                    if (isValidBirthday(BoD) == false) {
                        throw new NullPointerException();
                    }
                }

                if (BoD.isBlank()) {
                    BoD = null;
                }
                if (male != -1 && female != -1) {
                    throw new MessageRemovedIOException();
                }

            } catch (Exception e) {

            }
        }

    }

    public static boolean isValidEmail(String email) {
        String emailPattern = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";

        Pattern pattern = Pattern.compile(emailPattern);
        Matcher matcher = pattern.matcher(email);

        return matcher.matches();
    }

    public static boolean isValidBirthday(String birthday) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);

        try {
            dateFormat.parse(birthday);
            return true;
        } catch (ParseException e) {
            return false;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
