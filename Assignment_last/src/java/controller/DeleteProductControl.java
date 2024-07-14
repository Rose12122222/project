/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CartDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Product;

/**
 *
 * @author FPT SHOP
 */
public class DeleteProductControl extends HttpServlet {

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
            out.println("<title>Servlet DeleteProductControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteProductControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    protected void deleteMoreCart(HttpServletRequest request, HttpServletResponse response, String[] pid) throws ServletException, IOException {
        CartDAO dao = new CartDAO();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        Cookie c;
        for (int k = 0; k < pid.length; k++) {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split("/");
                String afterTxt = "";
                for (int i = 0; i < s.length; i++) {
                    String[] n = s[i].split(":");
                    if (Integer.parseInt(pid[k]) != Integer.parseInt(n[0])) {
                        afterTxt += (s[i] + "/");
                    }
                }
                if (dao.getNumberOfCart(txt) == 1) {
                    int tmp = 1;
                    for (int i = 0; i < s.length; i++) {
                        if (i + 1 == s.length) {
                            break;
                        }
                        String[] n = s[i].split(":");
                        String[] m = s[i + 1].split(":");
                        if (!n[0].equals(m[0])) {
                            tmp = 0;
                            break;
                        }
                    }
                    if (tmp == 1) {
                        txt = "";
                        c = new Cookie("cart", txt);
                        c.setMaxAge(0);
                        response.addCookie(c);
                    } else {
                        txt = afterTxt.substring(0, afterTxt.length() - 1);
                        c = new Cookie("cart", txt);
                        c.setMaxAge(60);
                        response.addCookie(c);
                    }
                } else if (afterTxt.endsWith("/")) {
                    txt = afterTxt.substring(0, afterTxt.length() - 1);
                    c = new Cookie("cart", txt);
                    c.setMaxAge(60);
                    response.addCookie(c);
                }
            }
        }
    }
    
    protected void deleteCart(HttpServletRequest request, HttpServletResponse response, int pid) throws ServletException, IOException {
        CartDAO dao = new CartDAO();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        Cookie c;
        if (txt != null && txt.length() != 0) {
            String[] s = txt.split("/");
            String afterTxt = "";
            for (int i = 0; i < s.length; i++) {
                String[] n = s[i].split(":");
                if (pid != Integer.parseInt(n[0])) {
                    afterTxt += (s[i] + "/");
                }
            }
            if (dao.getNumberOfCart(txt) == 1) {
                int tmp = 1;
                for (int i = 0; i < s.length; i++) {
                    if (i + 1 == s.length) {
                        break;
                    }
                    String[] n = s[i].split(":");
                    String[] m = s[i + 1].split(":");
                    if (!n[0].equals(m[0])) {
                        tmp = 0;
                        break;
                    }
                }
                if (tmp == 1) {
                    txt = "";
                    c = new Cookie("cart", txt);
                    c.setMaxAge(0);
                    response.addCookie(c);
                } else {
                    txt = afterTxt.substring(0, afterTxt.length() - 1);
                    c = new Cookie("cart", txt);
                    c.setMaxAge(60);
                    response.addCookie(c);
                }
            } else 
                if (afterTxt.endsWith("/")) {
                txt = afterTxt.substring(0, afterTxt.length() - 1);
                c = new Cookie("cart", txt);
                c.setMaxAge(60);
                response.addCookie(c);
            }
        }
    }

    protected void deleteMoreProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ProductDAO productDAO = new ProductDAO();

        HttpSession session = request.getSession();

        int index = 0;

        if (request.getParameter("index") != null) {
            index = Integer.parseInt(request.getParameter("index"));
        } else {
            index = 1;
        }

        String[] selectedProducts = request.getParameterValues("option");

        if (selectedProducts == null) {
            session.setAttribute("indexpage", index);
            response.sendRedirect("manage-product");
        } else {
            deleteMoreCart(request, response, selectedProducts);
            for (String pro1 : selectedProducts) {
                productDAO.deleteProduct(Integer.parseInt(pro1));
            }
            session.setAttribute("index", index);
            response.sendRedirect("manage-product");
        }

    }

    protected void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        int index = 0;

        if (request.getParameter("index") != null) {
            index = Integer.parseInt(request.getParameter("index"));
        } else {
            index = 1;
        }
        
        ProductDAO productDAO = new ProductDAO();
        int productID = Integer.parseInt(request.getParameter("pid"));
        deleteCart(request, response, productID);
        productDAO.deleteProduct(productID);
        session.setAttribute("index", index);
        response.sendRedirect("manage-product");
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
        String action = request.getParameter("action");
        if (action != null && action.equals("deletemore")) {
            deleteMoreProduct(request, response);
        } else {
            deleteProduct(request, response);
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
        processRequest(request, response);
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
