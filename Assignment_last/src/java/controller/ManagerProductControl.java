/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author FPT SHOP
 */
public class ManagerProductControl extends HttpServlet {

    public static boolean isValidDay(String day) {
        try {
            LocalDate parsedDate = LocalDate.parse(day);

            LocalDate currentDate = LocalDate.now();
            return !parsedDate.isAfter(currentDate);
        } catch (DateTimeParseException e) {
            return false;
        }
    }

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
            out.println("<title>Servlet ManagerProductControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerProductControl at " + request.getContextPath() + "</h1>");
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

        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();

        List<Product> listProduct;
        List<Category> listCategory = categoryDAO.getAllCategory();

        HttpSession session = request.getSession();

        int index = 0;

        if (request.getParameter("index") != null) {
            index = Integer.parseInt(request.getParameter("index"));
        } else {
            index = 1;
            if (session.getAttribute("index") != null) {
                index = (int) session.getAttribute("index");
            }
        }
        if (index != 1 && productDAO.getNext9Product(index).isEmpty()) {
            index = index - 1;
        }
        session.setAttribute("nop", (int) Math.ceil(productDAO.countProduct() * 1.0 / 9));

        listProduct = productDAO.getNext9Product(index);

        session.setAttribute("index", index);

        request.setAttribute("listpro", listProduct);
        session.setAttribute("listcate", listCategory);
        request.getRequestDispatcher("manager-product.jsp").forward(request, response);
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

        ProductDAO productDAO = new ProductDAO();

        CategoryDAO categoryDAO = new CategoryDAO();

        List<Category> listCategory = categoryDAO.getAllCategory();

        List<Product> listProduct;

        HttpSession session = request.getSession();

        String name;
        float price;
        String type;
        String date;
        int amount;
        int cid;
        float discount;
        String img;
        String alt;
        String description;

        String validMessage;

        try {
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

            if (!isValidDay(date)) {
                throw new NegativeArraySizeException();
            }
            if (discount < 0 || discount >= 1) {
                throw new NumberFormatException();
            }

            if (price <= 0) {
                throw new NullPointerException();
            }

            if (amount <= 0) {
                throw new ArithmeticException();
            }

            int index = 0;

            String getIndex = request.getParameter("index");

            if (getIndex != null) {
                index = Integer.parseInt(getIndex);
            } else {
                index = 1;
            }

            productDAO.insertProduct(name, price, type, date, amount, cid, discount, img, alt, description);

            index = (int) Math.ceil(productDAO.countProduct() * 1.0 / 9);

            session.setAttribute("nop", index);

            listProduct = productDAO.getNext9Product(index);

            request.setAttribute("listpro", listProduct);
            session.setAttribute("index", index);

            request.getRequestDispatcher("manager-product.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            validMessage = "The discount need to be: 0 <= discount < 1. Please input again!";
            request.setAttribute("error3", validMessage);
            session.setAttribute("listcate", listCategory);
            request.getRequestDispatcher("add.jsp").forward(request, response);
        } catch (NullPointerException e) {
            validMessage = "The price need to be: price > 0. Please input again!";
            request.setAttribute("error", validMessage);
            session.setAttribute("listcate", listCategory);
            request.getRequestDispatcher("add.jsp").forward(request, response);

        } catch (ArithmeticException e) {
            validMessage = "The amount need to be: amount > 0. Please input again!";
            request.setAttribute("error2", validMessage);
            session.setAttribute("listcate", listCategory);
            request.getRequestDispatcher("add.jsp").forward(request, response);

        } catch (NegativeArraySizeException e) {
            validMessage = "The day isn't valid. Please input again!";
            request.setAttribute("error1", validMessage);
            session.setAttribute("listcate", listCategory);
            request.getRequestDispatcher("add.jsp").forward(request, response);

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
