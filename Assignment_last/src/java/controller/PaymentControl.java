/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CartDAO;
import dal.OrderDAO;
import dal.PaymentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import model.Cart;
import model.Payment;

/**
 *
 * @author FPT SHOP
 */
public class PaymentControl extends HttpServlet {

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
            out.println("<title>Servlet PaymentControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PaymentControl at " + request.getContextPath() + "</h1>");
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
        response.sendRedirect("checkout");
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
       int aid = 0;
        HttpSession session = request.getSession();
        if (session.getAttribute("aid") != null) {
            aid = (int) session.getAttribute("aid");
        }
        if ((int) session.getAttribute("role") != 3) {
            Cookie[] arr = request.getCookies();
            String txt = "";
            if (arr != null) {
                for (Cookie o : arr) {
                    if (o.getName().equals("cart")) {
                        txt += o.getValue();
                    }
                }
            }
            int tmp = 0;
            if (txt != null && !txt.equals("")) {
                List<Payment> listPayment = new ArrayList<>();
                String s[] = txt.split("/");
                Map<Integer, Payment> paymentMap = new HashMap<>();

                for (String i : s) {
                    String[] n = i.split(":");

                    int pid = Integer.parseInt(n[0]);
                    int quantity = Integer.parseInt(n[1]);

                    if (paymentMap.containsKey(pid)) {
                        Payment existingPayment = paymentMap.get(pid);
                        existingPayment.addQuantity(quantity);
                    } else {
                        Payment payment = new Payment(0, pid, quantity, 0);
                        paymentMap.put(pid, payment);
                    }
                }
                listPayment.addAll(paymentMap.values());
                SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, yyyy", Locale.ENGLISH);
                String formattedDate = sdf.format(new Date());

                PaymentDAO paymentDAO = new PaymentDAO();
                int cnt = 0;
                float total = 0;
                for (Payment payment : listPayment) {
                    ++cnt;
                    total += (payment.getPriceByPid() * payment.getQuantity() * (1 - payment.getDiscountByPid()));
                    tmp = 1;
                }
                OrderDAO orderDAO = new OrderDAO();
                if (cnt != 0 && total != 0) {
                    orderDAO.insertOrder(aid, formattedDate, total, cnt, 0);
                }

                for (Payment payment : listPayment) {
                    paymentDAO.insertPayment(payment.getPid(), payment.getQuantity(), orderDAO.getMaxId());
                }

                Cookie cart = new Cookie("cart", txt);
                cart.setMaxAge(0);
                response.addCookie(cart);
            }
            if (tmp == 1) {
                response.sendRedirect("checkout?action=res");
            } else {
                response.sendRedirect("checkout?action=err");
            }
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
