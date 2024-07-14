/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.sun.mail.util.MessageRemovedIOException;
import dal.AccountDAO;
import dal.InfoDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.Account;
import model.InfoDetail;
import org.apache.tomcat.util.http.fileupload.impl.InvalidContentTypeException;

/**
 *
 * @author FPT SHOP
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

        InfoDetailDAO info = new InfoDetailDAO();

        AccountDAO acc = new AccountDAO();

        int accid = 0;
        if (session.getAttribute("aid") != null) {
            accid = (int) session.getAttribute("aid");
        }

        if (info.getInfoDetailByAId(accid) == null) {
            session.setAttribute("accid", accid);
            request.setAttribute("firstpass", acc.getPasswordByID(accid));
            request.getRequestDispatcher("my-account.jsp").forward(request, response);
        } else {
            session.setAttribute("accid", accid);
            request.setAttribute("info", info.getInfoDetailByAId(accid));
            request.getRequestDispatcher("my-account.jsp").forward(request, response);
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
        String validMessage;
        HttpSession session = request.getSession();

        InfoDetailDAO info = new InfoDetailDAO();
        AccountDAO acc = new AccountDAO();
        int accid = info.countInfoDetail() + 1;

        List<InfoDetail> accInfo = info.getAll();

        int male = -1;
        int female = -1;

        String firstName;
        String lastName;
        String email;
        String address;
        String birthday;

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

            firstName = request.getParameter("first-name");
            lastName = request.getParameter("last-name");
            email = request.getParameter("email");
            address = request.getParameter("address");
            birthday = request.getParameter("birthday");
            String oldPass = request.getParameter("oldpassword");
            String newPass = request.getParameter("newpassword");
            String Confirm = request.getParameter("confirm");

            
          //check birthday
            if (!birthday.isBlank()) {
                if (isValidBirthday(birthday) == false) {
                    throw new NullPointerException();
                }
            }
            
            if(birthday.isBlank()){
                birthday=null;
            }
            //check gender
            if (male != -1 && female != -1) {
                throw new MessageRemovedIOException();
            }
            //check email co trung database khong
            for (InfoDetail infoDetail : accInfo) {
                if (!infoDetail.getEmail().isBlank()) {
                    if (email.equals(infoDetail.getEmail()) && infoDetail.getAid() != accid) {
                        throw new NegativeArraySizeException();
                    }
                }
            }
            //check email
            if (!email.isBlank()) {
                if (isValidEmail(email) == false) {
                    throw new InvalidContentTypeException();
                }
            }
            //check pass trung
            if ((newPass != null && Confirm == null) || (newPass == null && Confirm != null) || (oldPass.equals(newPass)) || (!newPass.equals(Confirm))) {
                throw new ArithmeticException();
            }

            if (!newPass.isBlank() && !Confirm.isBlank()) {
                acc.editPassword(accid, newPass);
            }
            
            if (accid == (info.countInfoDetail() + 1)) {
                acc.editPassword(accid, oldPass);
                session.setAttribute("accid", accid);
                if (male != -1 && female == -1) {
                    info.insertInfoDetail(accid, male, email, firstName, lastName, address, birthday);
                    validMessage = "Save Sucessfully!";
                    request.setAttribute("sucess", validMessage);
                    request.setAttribute("info", new InfoDetail(accid, male, email, firstName, lastName, address, birthday));
                    request.getRequestDispatcher("my-account.jsp").forward(request, response);
                } else if (male == -1 && female != -1) {
                    info.insertInfoDetail(accid, male, email, firstName, lastName, address, birthday);
                    validMessage = "Save Sucessfully!";
                    request.setAttribute("sucess", validMessage);
                    request.setAttribute("info", new InfoDetail(accid, female, email, firstName, lastName, address, birthday));
                    request.getRequestDispatcher("my-account.jsp").forward(request, response);
                } else {
                    info.insertInfoDetail(accid, male, email, firstName, lastName, address, birthday);
                    validMessage = "Save Sucessfully!";
                    request.setAttribute("sucess", validMessage);
                    request.setAttribute("info", new InfoDetail(accid, -1, email, firstName, lastName, address, birthday));
                    request.getRequestDispatcher("my-account.jsp").forward(request, response);
                }

            } else {
                session.setAttribute("accid", accid);

                if (male != -1 && female == -1) {
                    info.editInfoDetail(accid, male, email, firstName, lastName, address, birthday);
                } else if (male == -1 && female != -1) {
                    info.editInfoDetail(accid, female, email, firstName, lastName, address, birthday);
                } else {
                    info.editInfoDetail(accid, -1, email, firstName, lastName, address, birthday);
                }

                validMessage = "Change Sucessfully!";
                request.setAttribute("sucess", validMessage);
                request.setAttribute("info", info.getInfoDetailByAId(accid));
                request.getRequestDispatcher("my-account.jsp").forward(request, response);
            }

        } catch (MessageRemovedIOException e) {
            validMessage = "Choose only one gender. Please choose Again!";
            request.setAttribute("firstpass", acc.getPasswordByID(accid));
            request.setAttribute("error", validMessage);
            request.setAttribute("info", info.getInfoDetailByAId(accid));
            request.getRequestDispatcher("my-account.jsp").forward(request, response);
        } catch (InvalidContentTypeException e) {
            validMessage = "Your email not follow format abc@gmail.com. Please enter again!";
            request.setAttribute("firstpass", acc.getPasswordByID(accid));
            request.setAttribute("error", validMessage);
            request.setAttribute("info", info.getInfoDetailByAId(accid));
            request.getRequestDispatcher("my-account.jsp").forward(request, response);
        } catch (NegativeArraySizeException e) {
            validMessage = "Your emails is exist. Please enter again!";
            request.setAttribute("firstpass", acc.getPasswordByID(accid));
            request.setAttribute("error", validMessage);
            request.setAttribute("info", info.getInfoDetailByAId(accid));
            request.getRequestDispatcher("my-account.jsp").forward(request, response);
        } catch (NullPointerException e) {
            validMessage = "Your birthday not follow format YYYY-MM-DD. Please enter again!";
            request.setAttribute("firstpass", acc.getPasswordByID(accid));
            request.setAttribute("error", validMessage);
            request.setAttribute("info", info.getInfoDetailByAId(accid));
            request.getRequestDispatcher("my-account.jsp").forward(request, response);
        } catch (ArithmeticException e) {
            validMessage = "The old password, new password must be different and new password, confirm password must be same";
            request.setAttribute("firstpass", acc.getPasswordByID(accid));
            request.setAttribute("error", validMessage);
            request.setAttribute("info", info.getInfoDetailByAId(accid));
            request.getRequestDispatcher("my-account.jsp").forward(request, response);
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
