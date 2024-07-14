
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
import java.net.URLEncoder;
import java.util.List;
import model.Cart;
import model.Product;

/**
 *
 * @author FPT SHOP
 */
public class CartControl extends HttpServlet {

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
            out.println("<title>Servlet CartControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartControl at " + request.getContextPath() + "</h1>");
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
        ProductDAO proDAO = new ProductDAO();
        int id = 0;
        int pid = 0;
        if (request.getParameter("id") != null) {
            id = Integer.parseInt(request.getParameter("id"));
        }
        if (request.getParameter("pid") != null) {
            pid = Integer.parseInt(request.getParameter("pid"));
        }
        Product pro = proDAO.getProductById(pid);

        int quantity = 0;
        if (request.getParameter("quantity") != null) {
            quantity = Integer.parseInt(request.getParameter("quantity"));
        }
        String action = (String) request.getParameter("action");
        if (action != null) {
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
            switch (action) {
                case "add":
                    if (txt.isEmpty()) {
                        txt = pid + ":" + quantity;
                    } else {
                        txt = txt + "/" + pid + ":" + quantity;
                    }
                    c = new Cookie("cart", txt);
                    c.setMaxAge(60);
                    response.addCookie(c);
                    response.sendRedirect("cart");
                    break;
                case "delete":
                    if (txt != null && txt.length() != 0) {
                        String[] s = txt.split("/");
                        String afterTxt = "";
                        for (int i = 0; i < s.length; i++) {
                            String[] n = s[i].split(":");
                            if (pid != Integer.parseInt(n[0])) {
                                afterTxt += (s[i] + "/");
                            }
                        }
                        if (id == 0) {
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
                            if (id != 0) {
                                tmp = 0;
                                break;
                            }

                            System.out.println(tmp);
                            if (tmp == 1) {
                                txt = "";
                                c = new Cookie("cart", txt);
                                c.setMaxAge(0);
                                response.addCookie(c);
                                response.sendRedirect("cart");
                            } else {
                                txt = afterTxt.substring(0, afterTxt.length() - 1);
                                c = new Cookie("cart", txt);
                                c.setMaxAge(60);
                                response.addCookie(c);
                                response.sendRedirect("cart");
                            }
                        } else if (afterTxt.endsWith("/")) {
                            txt = afterTxt.substring(0, afterTxt.length() - 1);
                            c = new Cookie("cart", txt);
                            c.setMaxAge(60);
                            response.addCookie(c);
                            response.sendRedirect("cart");
                        }
                    }
                default:
                    break;
            }
        } else {
            CartDAO DAO = new CartDAO();
            Cookie[] arr = request.getCookies();
            String txt = "";
            if (arr != null) {
                for (Cookie o : arr) {
                    if (o.getName().equals("cart")) {
                        txt += o.getValue();
                    }
                }
            }
            if (txt != null || !txt.equals("")) {
                List<Cart> cartList = DAO.getAllCart(txt);
                int sumPrice = 0;
                for (Cart cart : cartList) {
                    sumPrice += (cart.getPriceByPid() * cart.getQuantity() *(1- cart.getDiscountByPid()));
                }
                request.setAttribute("sumPrice", sumPrice);
            }
            request.getRequestDispatcher("cart.jsp").forward(request, response);
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
        ProductDAO proDAO = new ProductDAO();

        if (request.getParameterValues("pid") == null) {
//            request.setAttribute("error", "You need to add cart before update cart");
            request.getRequestDispatcher("cart.jsp").forward(request, response);
            return;
        }
        String[] pidList = request.getParameterValues("pid");
        String[] quantityList = request.getParameterValues("quantity");
        String[] oldQuantityList = request.getParameterValues("oldQuantity");

        int quantity = 0;
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        for (int i = 0; i < pidList.length; i++) {
            Product pro = proDAO.getProductById(Integer.parseInt(pidList[i]));
            quantity = Integer.parseInt(quantityList[i]) - Integer.parseInt(oldQuantityList[i]);
            if (txt.isEmpty()) {
                txt = pidList[i] + ":" + quantity;
            } else {
                txt = txt + "/" + pidList[i] + ":" + quantity;
            }
        }
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(60);
        response.addCookie(c);
        response.sendRedirect("cart");
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
