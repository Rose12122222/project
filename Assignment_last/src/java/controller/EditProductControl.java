/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import static controller.ManagerProductControl.isValidDay;
import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author FPT SHOP
 */
public class EditProductControl extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet EditProductControl</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProductControl at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();

        List<Category> listCategory = categoryDAO.getAllCategory();

        HttpSession session = request.getSession();

        int cid;
        int id;
        String name;
        float price;
        String type;
        String date;
        int amount;
        float discount;
        String img;
        String alt;
        String description;

        String validMessage;
        try {
            id = Integer.parseInt(request.getParameter("pid"));
            name = request.getParameter("name");
            price = Float.parseFloat(request.getParameter("price"));
            type = request.getParameter("type");
            date = request.getParameter("date");
            amount = Integer.parseInt(request.getParameter("amount"));
            cid = Integer.parseInt(request.getParameter("category"));
            discount = Float.parseFloat(request.getParameter("discount"));
            img = request.getParameter("img");
            alt = request.getParameter("alt");
            description = request.getParameter("description");

            if (discount < 0 || discount >= 1) {
                throw new NumberFormatException();
            }

            if (!isValidDay(date)) {
                throw new NegativeArraySizeException();
            }

            if (price <= 0) {
                throw new NullPointerException();
            }

            if (amount <= 0) {
                throw new ArithmeticException();
            }

            productDAO.editProduct(id, name, price, type, date, amount, cid, discount, img, alt, description);

            response.sendRedirect("manage-product");

        } catch (NumberFormatException e) {
            validMessage = "The discount need to be: 0 <= discount < 1. Please input again!";
            request.setAttribute("error3", validMessage);
            session.setAttribute("listcate", listCategory);
            request.getRequestDispatcher("edit.jsp").forward(request, response);
        } catch (NullPointerException e) {
            validMessage = "The price need to be: price > 0. Please input again!";
            request.setAttribute("error", validMessage);
            session.setAttribute("listcate", listCategory);
            request.getRequestDispatcher("edit.jsp").forward(request, response);

        } catch (ArithmeticException e) {
            validMessage = "The amount need to be: amount > 0. Please input again!";
            request.setAttribute("error2", validMessage);
            session.setAttribute("listcate", listCategory);
            request.getRequestDispatcher("edit.jsp").forward(request, response);

        } catch (NegativeArraySizeException e) {
            validMessage = "The day isn't valid. Please input again!";
            request.setAttribute("error1", validMessage);
            session.setAttribute("listcate", listCategory);
            request.getRequestDispatcher("edit.jsp").forward(request, response);

        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
