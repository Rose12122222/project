/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.sun.mail.util.MessageRemovedIOException;
import dal.StudentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.Students;
import org.apache.tomcat.util.http.fileupload.impl.InvalidContentTypeException;

/**
 *
 * @author FPT SHOP
 */
public class SignUpControl extends HttpServlet {

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
            out.println("<title>Servlet SignUpControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    public static boolean isValidEmail(String email) {
        String emailPattern = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";

        Pattern pattern = Pattern.compile(emailPattern);
        Matcher matcher = pattern.matcher(email);

        return matcher.matches();
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
        request.getRequestDispatcher("signup.jsp").forward(request, response);
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
        int service = 0;
        String email;
        String username;
        String password;
        String cfpassword;
        StudentDAO dao = new StudentDAO();
        List<Students> studentList = dao.getAllStudent();
        try {
            service = Integer.parseInt(request.getParameter("service"));
            email = (String) request.getParameter("email");
            username = (String) request.getParameter("username");
            password = (String) request.getParameter("password");
            cfpassword = (String) request.getParameter("cfpassword");

            if (service != 1) {
                throw new MessageRemovedIOException();
            }

            for (Students student : studentList) {
                if (!student.getEmail().isBlank()) {
                    if (email.equals(student.getEmail())) {
                        throw new NegativeArraySizeException();
                    }
                }
            }

            if (!email.isBlank()) {
                if (isValidEmail(email) == false) {
                    throw new InvalidContentTypeException();
                }
            }

            if (!password.equals(cfpassword)) {
                throw new NullPointerException();
            }
            for (int i = 0; i < studentList.size(); i++) {
                if (studentList.get(i).getUsername().equals(username)) {
                    throw new ArithmeticException();
                }
            }

            if (email.isBlank() || username.isBlank() || password.isBlank() || cfpassword.isBlank()) {
                throw new NumberFormatException();
            } else {
                dao.insertStudent(username, password, email);
                response.sendRedirect("login");

            }
//            response.getWriter().write("Sign up successful!");
        } catch (NumberFormatException e) {
            validMessage = "Please enter all infomation and click on term of service to register!";
            request.setAttribute("error1", validMessage);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } catch (ArithmeticException e) {
            validMessage = "The username has been exists, Please change your username!";
            request.setAttribute("error1", validMessage);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } catch (InvalidContentTypeException e) {
            validMessage = "Your email not follow format abc@gmail.com. Please enter again!";
            request.setAttribute("error", validMessage);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } catch (NegativeArraySizeException e) {
            validMessage = "Your emails is exist. Please enter again!";
            request.setAttribute("error", validMessage);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } catch (NullPointerException e) {
            validMessage = "The password and confirmed password need to be at the same!";
            request.setAttribute("error1", validMessage);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } catch (MessageRemovedIOException e) {
            validMessage = "Please click on term of service to register!";
            request.setAttribute("error1", validMessage);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
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
