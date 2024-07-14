/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dal.InfoDetailStudentsDAO;
import jakarta.servlet.http.HttpSession;
import java.nio.channels.AsynchronousCloseException;
import java.nio.file.AccessDeniedException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import model.InfoDetailStudents;

/**
 *
 * @author Windows
 */
@WebServlet(name = "adminServlet", urlPatterns = {"/profile"})
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
            out.println("<title>Servlet adminServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
//    InfoDetailAdminDAO adminDAO = new InfoDetailAdminDAO();
//    List<InfoDetailAdmin> admins = adminDAO.getAll();
//    request.setAttribute("admins", admins);
//    request.getRequestDispatcher("profile.jsp").forward(request, response);

        InfoDetailStudentsDAO info = new InfoDetailStudentsDAO();
        InfoDetailStudents admin = new InfoDetailStudents();// You need to implement this method in InfoDetailAdminDAO
        int accid = 0;
        if (session.getAttribute("aid") != null) {
            accid = (int) session.getAttribute("aid");
        }
        if (info.getByID(accid) == null) {
            session.setAttribute("accid", accid);
            request.setAttribute("firstpass", admin.getPassword());
            request.getRequestDispatcher("profile.jsp").forward(request, response);

        } else {
            session.setAttribute("accid", accid);
            request.setAttribute("info", info.getByID(accid));
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
//        processRequest(request, response);
        String validMessage;
        HttpSession session = request.getSession();

        InfoDetailStudentsDAO info = new InfoDetailStudentsDAO();
        InfoDetailStudents acc = new InfoDetailStudents();
        int accid = info.countInfoDetail() + 1;
        List<InfoDetailStudents> accInfo = info.getAll();
        int male = -1;
        int female = -1;
        String fullName;
        String BirthofDate;
        String email;
        String phone;
        String address;
        try {

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

            fullName = request.getParameter("fullName");
            BirthofDate = request.getParameter("BirthofDate");
            
            email = request.getParameter("email");
            phone = request.getParameter("phone");
            address = request.getParameter("address");

            //check birthday
//            if (!BirthofDate.isBlank()) {
//                if (isValidBirthday(BirthofDate) == false) {
//                    throw new NullPointerException();
//                }
//            }
//
//            if (BirthofDate.isBlank()) {
//                BirthofDate = null;
//            }
            //check gender
            if (male != -1 && female != -1) {
                throw new AsynchronousCloseException();
            }
            //check email co trung database khong
            for (InfoDetailStudents infoDetail : accInfo) {
                if (!infoDetail.getEmail().isBlank()) {
                    if (email.equals(infoDetail.getEmail()) && acc.getID() != accid) {
                        throw new NegativeArraySizeException();
                    }
                }
            }
            //check email
            if (!email.isBlank()) {
                if (isValidEmail(email) == false) {
                    throw new AsynchronousCloseException();
                }
            }
            //check pass trung
//            if ((newPass != null && Confirm == null) || (newPass == null && Confirm != null) || (oldPass.equals(newPass)) || (!newPass.equals(Confirm))) {
//                throw new ArithmeticException();
//            }

//            if (!newPass.isBlank() && !Confirm.isBlank()) {
//                acc.editPassword(accid, newPass);
//            }
            if (accid == (info.countInfoDetail() + 1)) {
                // acc.editPassword(accid, oldPass);
                session.setAttribute("accid", accid);
                if (male != -1 && female == -1) {
                    info.insertInfoDetail(accid, fullName, phone, fullName, female, address, email, phone, BirthofDate, male, phone);
                    validMessage = "Save Sucessfully!";
                    request.setAttribute("sucess", validMessage);
                    request.setAttribute("info", new InfoDetailStudents(accid, fullName, phone, male, fullName, female, address, email, phone, BirthofDate, male, phone));
                    request.getRequestDispatcher("profile.jsp").forward(request, response);
                } else if (male == -1 && female != -1) {
                    info.insertInfoDetail(accid, fullName, phone, fullName, female, address, email, phone, BirthofDate, male, phone);
                    validMessage = "Save Sucessfully!";
                    request.setAttribute("sucess", validMessage);
                    request.setAttribute("info", new InfoDetailStudents(accid, fullName, phone, male, fullName, female, address, email, phone, BirthofDate, male, phone));
                    request.getRequestDispatcher("profile.jsp").forward(request, response);
                } else {
                    info.insertInfoDetail(accid, fullName, phone, fullName, female, address, email, phone, BirthofDate, male, phone);
                    validMessage = "Save Sucessfully!";
                    request.setAttribute("sucess", validMessage);
                    request.setAttribute("info", new InfoDetailStudents(accid, fullName, phone, male, fullName, female, address, email, phone, BirthofDate, male, phone));
                    request.getRequestDispatcher("profile.jsp").forward(request, response);
                }

            } else {
                session.setAttribute("accid", accid);

                if (male != -1 && female == -1) {
                    info.updateStudent(accid, phone, male, fullName, female, address, email, phone, BirthofDate, male, phone);
                } else if (male == -1 && female != -1) {
                    info.updateStudent(accid, phone, male, fullName, female, address, email, phone, BirthofDate, male, phone);
                } else {
                    info.updateStudent(accid, phone, male, fullName, -1, address, email, phone, BirthofDate, male, phone);
                }

                validMessage = "Change Sucessfully!";
                request.setAttribute("sucess", validMessage);
                request.setAttribute("info", info.getByID(accid));
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            }

        } catch (IOException e) {
            validMessage = "Choose only one gender. Please choose Again!";
            request.setAttribute("firstpass", info.getPasswordByID(accid));
            request.setAttribute("error", validMessage);
            request.setAttribute("info", info.getByID(accid));
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } catch (NegativeArraySizeException e) {
            validMessage = "Your email not follow format abc@gmail.com. Please enter again!";
            request.setAttribute("firstpass", info.getPasswordByID(accid));
            request.setAttribute("error", validMessage);
            request.setAttribute("info", info.getByID(accid));
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            validMessage = "Your emails is exist. Please enter again!";
            request.setAttribute("firstpass", info.getPasswordByID(accid));
            request.setAttribute("error", validMessage);
            request.setAttribute("info", info.getByID(accid));
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } catch (NullPointerException e) {
            validMessage = "Your birthday not follow format YYYY-MM-DD. Please enter again!";
            request.setAttribute("firstpass", info.getPasswordByID(accid));
            request.setAttribute("error", validMessage);
            request.setAttribute("info", info.getByID(accid));
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }
//        catch (ArithmeticException e) {
//            validMessage = "The old password, new password must be different and new password, confirm password must be same";
//            request.setAttribute("firstpass", acc.getPasswordByID(accid));
//            request.setAttribute("error", validMessage);
//            request.setAttribute("info", info.getByID(accid));
//            request.getRequestDispatcher("profile.jsp").forward(request, response);
//        }
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
