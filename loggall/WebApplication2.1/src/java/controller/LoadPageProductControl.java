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
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author FPT SHOP
 */
public class LoadPageProductControl extends HttpServlet {

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
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        ProductDAO proDAO = new ProductDAO();
        CategoryDAO catDAO = new CategoryDAO();

        String page = (String) request.getParameter("page");
        String shop = (String) request.getParameter("shop");
        if (request.getParameter("shop") == null || request.getParameter("shop").equals("")) {
            shop = null;
        }

        String cid = (String) request.getParameter("cid");
        if (request.getParameter("cid") == null || request.getParameter("cid").equals("")) {
            cid = null;
        }

        String color = (String) request.getParameter("color");
        if (request.getParameter("color") == null || request.getParameter("color").equals("")) {
            color = null;
        }
        String name = (String) request.getParameter("name");
        if (request.getParameter("name") == null || request.getParameter("name").equals("")) {
            name = null;
        }
        
        String txtPrice = (String) request.getParameter("text");
        if (request.getParameter("text") == null || request.getParameter("text").equals("")) {
            txtPrice = null;
        }
        String sPrice = null;
        String ePrice = null;
        if (txtPrice != null) {
            String[] priceArr = txtPrice.split("-");
            sPrice = priceArr[0].substring(0, priceArr[0].length() - 2);
            ePrice = priceArr[1].substring(1, priceArr[1].length() - 1);
        }

        String order = (String) request.getParameter("order");
        if (request.getParameter("order") == null || request.getParameter("order").equals("")) {
            order = "0";
        }
//        if (request.getParameter("color") == "") {
//            color = null;
//        }
        int pageNumber;
        if (page == null) {
            pageNumber = 1;
        } else {
            pageNumber = Integer.parseInt(page);
        }
        HttpSession session = request.getSession();
        request.setAttribute("cid", cid);
        request.setAttribute("color", color);
        request.setAttribute("order", order);
        request.setAttribute("text", txtPrice);
        request.setAttribute("name", name);
        
//        cid=(String) session.getAttribute("cid");
        List<Product> proList = proDAO.getNext9ProductAfterSearchAll(cid, color, sPrice, ePrice, name, order, pageNumber);
//        System.out.println(proList.get(0).getName());
        session.setAttribute("productList", proList);
        session.setAttribute("colorList", proDAO.getAllColor());

        session.setAttribute("numberOfProduct", proDAO.countAfterSearchAll(cid, color, sPrice, ePrice, name));
        session.setAttribute("numberOfPage", (int) Math.ceil(proDAO.countAfterSearchAll(cid, color, sPrice, ePrice, name) * 1.0 / 9));

        List<Product> subProList = proDAO.getNext12ProductAfterSearchAll(cid, color, sPrice, ePrice, name, order, pageNumber);

        session.setAttribute("productList2", subProList);

        session.setAttribute("numberOfPage2", (int) Math.ceil(proDAO.countAfterSearchAll(cid, color, sPrice, ePrice, name) * 1.0 / 12));

        List<Category> catList = catDAO.getAllCategory();
        session.setAttribute("categoryList", catList);

        PrintWriter out = response.getWriter();
        if (shop != null) {
            switch (shop) {
                case "shop-list":
                    request.getRequestDispatcher("shop-list.jsp").forward(request, response);
                    break;
                case "shop-fullwidth":
                    request.getRequestDispatcher("shop-fullwidth.jsp").forward(request, response);
                    break;
                case "shop-fullwidth-list":
                    request.getRequestDispatcher("shop-fullwidth-list.jsp").forward(request, response);
                    break;
                default:
                    break;
            }
        } else {
            request.getRequestDispatcher("shop.jsp").forward(request, response);
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
        CategoryDAO catDAO = new CategoryDAO();
        String page = (String) request.getParameter("page");
        String shop = (String) request.getParameter("shop");

        String cid = (String) request.getParameter("cid");
        String type = (String) request.getParameter("color");
        String name = (String) request.getParameter("name");
//        String sPrice = (String) request.getParameter("");
//        String ePrice = (String) request.getParameter("");
        String sort = (String) request.getParameter("orderby");

        int pageNumber;
        if (page == null) {
            pageNumber = 1;
        } else {
            pageNumber = Integer.parseInt(page);
        }
        HttpSession session = request.getSession();
//        session.setAttribute("cid",cid);
        List<Product> proList = proDAO.getNext9ProductAfterSearchAll(cid, null, null, null, name, null, pageNumber);

        session.setAttribute("productList", proList);
        session.setAttribute("colorList", proDAO.getAllColor());

        session.setAttribute("numberOfProduct", proDAO.countAfterSearchAll(cid, type, null, null, name));
        session.setAttribute("numberOfPage", (int) Math.ceil(proDAO.countAfterSearchAll(cid, type, null, null, name) * 1.0 / 9));

        List<Product> subProList = proDAO.getNext12ProductAfterSearchAll(cid, type, null, null, name, sort, pageNumber);

        session.setAttribute("productList2", subProList);

        session.setAttribute("numberOfPage2", (int) Math.ceil(proDAO.countAfterSearchAll(cid, type, null, null, name) * 1.0 / 12));

        List<Category> catList = catDAO.getAllCategory();
        session.setAttribute("categoryList", catList);
        PrintWriter out = response.getWriter();
        if (shop != null) {
            switch (shop) {
                case "shop-list":
                    out.println("<!--banner slider start-->\n"
                            + "                                <div class=\"banner_slider mb-35\" hidden=\"\">\n"
                            + "                                    <img src=\"\" alt=\"\">\n"
                            + "                                </div> \n"
                            + "                                <!--banner slider start-->\n"
                            + "\n"
                            + "                                <!--shop toolbar start-->\n"
                            + "                                <div class=\"shop_toolbar list_toolbar mb-35\">\n"
                            + "                                    <div class=\"list_button\" style=\"visibility: hidden\">\n"
                            + "                                        <ul class=\"nav\" role=\"tablist\">\n"
                            + "                                            <li>\n"
                            + "                                                <a data-toggle=\"tab\" href=\"#large\" role=\"tab\" aria-controls=\"large\" aria-selected=\"true\"><i class=\"fa fa-th-large\"></i></a>\n"
                            + "                                            </li>\n"
                            + "                                            <li>\n"
                            + "                                                <a class=\"active\" data-toggle=\"tab\" href=\"#list\" role=\"tab\" aria-controls=\"list\" aria-selected=\"false\"><i class=\"fa fa-th-list\"></i></a>\n"
                            + "                                            </li>\n"
                            + "                                        </ul>\n"
                            + "                                    </div>\n");
                    if ((int) session.getAttribute("numberOfProduct") != 0) {
                        out.println("                                    <div class=\"page_amount\">\n"
                                + "                                        <p>Showing 1–" + session.getAttribute("numberOfPage") + " of " + session.getAttribute("numberOfProduct") + " results</p>\n"
                                + "                                    </div>\n");
                    } else {
                        out.println("                                    <div class=\"page_amount\">\n"
                                + "                                        <h3>Not found product!</h3>"
                                + "                                    </div>\n");
                    }
                    out.println("                                    <div class=\"select_option\">\n"
                            + "                                    </div>\n"
                            + "                                </div>\n"
                            + "                                <!--shop toolbar end-->\n"
                            + "\n"
                            + "                                <!--shop tab product-->\n"
                            + "                                <div class=\"shop_tab_product\">   \n"
                            + "                                    <div class=\"tab-content\" id=\"myTabContent\">                               \n"
                            + "                                        <div class=\"tab-pane fade show active\" id=\"list\" role=\"tabpanel\">");
                    for (Product i : proList) {
                        out.println("<div class=\"product_list_item mb-35\">\n"
                                + "                                                    <div class=\"row align-items-center\">\n"
                                + "                                                        <div class=\"col-lg-4 col-md-6 col-sm-6\">\n"
                                + "                                                            <div class=\"product_thumb\">\n"
                                + "                                                                <a href=\"single-product.jsp\"><img src=\"" + i.getImg() + "\" alt=\"" + i.getAlt() + "\"></a> \n"
                                + "                                                                <div class=\"hot_img\">\n"
                                + "                                                                    <img src=\"assets\\img\\cart\\span-hot.png\" alt=\"\">\n"
                                + "                                                                </div>\n"
                                + "                                                            </div>\n"
                                + "                                                        </div>\n"
                                + "                                                        <div class=\"col-lg-8 col-md-6 col-sm-6\">\n"
                                + "                                                            <div class=\"list_product_content\">                                           \n"
                                + "                                                                <div class=\"list_title\">\n"
                                + "                                                                    <h3><a href=\"single-product.jsp\">" + i.getName() + "</a></h3>\n"
                                + "                                                                </div>\n"
                                + "                                                                <p class=\"design\">" + i.getDescription() + "</p>\n"
                                + "\n"
                                + "                                                                <div class=\"content_price\">\n"
                                + "                                                                    <span>" + i.getPrice() + " đ</span>\n"
                                + "                                                                    <span class=\"old-price\">" + i.getPrice() + " đ</span>\n"
                                + "                                                                </div>\n"
                                + "                                                                <div class=\"add_links\">\n"
                                + "                                                                    <ul>\n"
                                + "                                                                        <li><a href=\"#\" title=\"add to cart\"><i class=\"fa fa-shopping-cart\" aria-hidden=\"true\"></i></a></li>\n"
                                + "                                                                        <li><a href=\"#\" title=\"add to wishlist\"><i class=\"fa fa-heart\" aria-hidden=\"true\"></i></a></li>\n"
                                + "\n"
                                + "                                                                    </ul>\n"
                                + "                                                                </div>\n"
                                + "                                                            </div>\n"
                                + "                                                        </div>\n"
                                + "                                                    </div> \n"
                                + "                                                </div>");
                    }
                    out.println("</div>\n"
                            + "                                    </div>\n"
                            + "                                </div>    \n"
                            + "                                <!--shop tab product end-->\n"
                            + "\n"
                            + "                                <!--pagination style start--> \n"
                            + "                                <div class=\"pagination_style\">\n"
                            + "                                    <div class=\"item_page\" style=\"visibility: hidden\">\n"
                            + "                                        <form action=\"#\">\n"
                            + "                                            <label for=\"page_select\">show</label>\n"
                            + "                                            <select id=\"page_select\">\n"
                            + "\n"
                            + "                                            </select>\n"
                            + "                                            <span>Products by page</span>\n"
                            + "                                        </form>\n"
                            + "                                    </div>\n"
                            + "                                    <div class=\"page_number\">\n"
                            + "                                        <span>Pages: </span>\n"
                            + "                                        <ul>\n"
                            + "                                            <li>«</li>");
                    for (int i = 1; i <= (int) session.getAttribute("numberOfPage"); i++) {
                        out.println("<li><a href=\"page?shop=shop-list&&page=" + i + "&&name=" + name + "\">" + i + "</a></li>");
                    }
                    out.println("<li>»</li>\n"
                            + "                                        </ul>\n"
                            + "                                    </div>\n"
                            + "                                </div>\n"
                            + "                                <!--pagination style end--> \n"
                            + "                            </div>");
                    break;
                case "shop-fullwidth":
                    out.println("<div class=\"row\">\n"
                            + "                            <div class=\"col-12\">\n"
                            + "                                <!--shop toolbar start-->\n"
                            + "                                <div class=\"shop_toolbar mb-35\">\n"
                            + "                                    <div class=\"list_button\">\n"
                            + "\n"
                            + "                                    </div>");
                    if ((int) session.getAttribute("numberOfProduct") != 0) {
                        out.println("                                    <div class=\"page_amount\">\n"
                                + "                                        <p>Showing 1–" + session.getAttribute("numberOfPage2") + " of " + session.getAttribute("numberOfProduct") + " results</p>\n"
                                + "                                    </div>\n");
                    } else {
                        out.println("                                    <div class=\"page_amount\">\n"
                                + "                                        <h3>Not found product!</h3>"
                                + "                                    </div>\n");
                    }
                    out.println("<div class=\"select_option\">\n"
                            + "\n"
                            + "                                    </div>\n"
                            + "                                </div>\n"
                            + "                                <!--shop toolbar end-->\n"
                            + "                            </div>\n"
                            + "                        </div>        \n"
                            + "\n"
                            + "                        <!--shop tab product-->\n"
                            + "                        <div class=\"shop_tab_product shop_fullwidth\">   \n"
                            + "                            <div class=\"tab-content\" id=\"myTabContent\">                  \n"
                            + "                                <div class=\"tab-pane fade show active\" id=\"large\" role=\"tabpanel\">\n"
                            + "                                    <div class=\"row\">");
                    for (Product i : subProList) {
                        out.println("<div class=\"col-lg-3 col-md-4 col-sm-6\">\n"
                                + "                                                <div class=\"single_product\">\n"
                                + "                                                    <div class=\"product_thumb\">\n"
                                + "                                                        <a href=\"single-product.jsp\"><img src=\"" + i.getImg() + "\" alt=\"" + i.getAlt() + "\"></a> \n"
                                + "                                                        <div class=\"img_icone\">\n"
                                + "                                                            <img src=\"assets\\img\\cart\\span-new.png\" alt=\"\">\n"
                                + "                                                        </div>\n"
                                + "                                                        <div class=\"product_action\">\n"
                                + "                                                            <a href=\"#\"> <i class=\"fa fa-shopping-cart\"></i> Add to cart</a>\n"
                                + "                                                        </div>\n"
                                + "                                                    </div>\n"
                                + "                                                    <div class=\"product_content\">\n"
                                + "                                                        <span class=\"product_price\">" + i.getPrice() + " đ</span>\n"
                                + "                                                        <h3 class=\"product_title\"><a href=\"single-product.jsp\">" + i.getName() + "</a></h3>\n"
                                + "                                                    </div>\n"
                                + "                                                    <div class=\"product_info\">\n"
                                + "                                                        <ul>\n"
                                + "                                                            <li><a href=\"#\" title=\" Add to Wishlist \">Add to Wishlist</a></li>\n"
                                + "                                                            <li><a href=\"single-product.jsp\">View Detail</a></li>\n"
                                + "                                                        </ul>\n"
                                + "                                                    </div>\n"
                                + "                                                </div>\n"
                                + "                                            </div>");
                    }
                    out.print("</div>  \n"
                            + "                                </div>\n"
                            + "                            </div>\n"
                            + "                        </div>    \n"
                            + "                        <!--shop tab product end-->\n"
                            + "\n"
                            + "                        <!--pagination style start--> \n"
                            + "                        <div class=\"pagination_style shop_page\">\n"
                            + "                            <div class=\"item_page\">\n"
                            + "                                \n"
                            + "                            </div>\n"
                            + "                            <div class=\"page_number\">\n"
                            + "                                <span>Pages: </span>\n"
                            + "                                <ul>\n"
                            + "                                    <li>«</li>\n"
                            + "                                    <!--<li class=\"current_number\">1</li>-->");
                    for (int i = 1; i <= (int) session.getAttribute("numberOfPage2"); i++) {
                        out.println("<li><a href=\"page?shop=shop-fullwidth&&page=" + i + "&&name=" + name + "\">" + i + "</a></li>");
                    }
                    out.println("<li>»</li>\n"
                            + "                                </ul>\n"
                            + "                            </div>\n"
                            + "                        </div>\n"
                            + "                        <!--pagination style end-->   \n"
                            + "                    </div>");
                    break;
                case "shop-fullwidth-list":
                    out.println("<div class=\"row\">\n"
                            + "                            <div class=\"col-12\">\n"
                            + "                                <!--shop toolbar start-->\n"
                            + "                                <div class=\"shop_toolbar list_toolbar mb-35\">\n"
                            + "                                    <div class=\"list_button\">\n"
                            + "                                        \n"
                            + "                                    </div>");
                    if ((int) session.getAttribute("numberOfProduct") != 0) {
                        out.println("                                    <div class=\"page_amount\">\n"
                                + "                                        <p>Showing 1–" + session.getAttribute("numberOfPage2") + " of " + session.getAttribute("numberOfProduct") + " results</p>\n"
                                + "                                    </div>\n");
                    } else {
                        out.println("                                    <div class=\"page_amount\">\n"
                                + "                                        <h3>Not found product!</h3>"
                                + "                                    </div>\n");
                    }
                    out.println("<div class=\"select_option\">\n"
                            + "                                        \n"
                            + "                                    </div>\n"
                            + "                                </div>\n"
                            + "                                <!--shop toolbar end-->\n"
                            + "                            </div>\n"
                            + "                        </div>        \n"
                            + "\n"
                            + "                        <!--shop tab product-->\n"
                            + "                        <div class=\"shop_tab_product shop_fullwidth\">   \n"
                            + "                            <div class=\"tab-content\" id=\"myTabContent\">                             \n"
                            + "                                <div class=\"tab-pane fade show active\" id=\"list\" role=\"tabpanel\">");
                    for (Product i : subProList) {
                        out.println("<div class=\"product_list_item mb-35\">    \n"
                                + "                                            <div class=\"row align-items-center\">\n"
                                + "                                                <div class=\"col-lg-3 col-md-5 col-sm-6\">\n"
                                + "                                                    <div class=\"product_thumb\">\n"
                                + "                                                        <a href=\"single-product.jsp\"><img src=\"" + i.getImg() + "\" alt=\"" + i.getAlt() + "\"></a> \n"
                                + "                                                        <div class=\"hot_img\">\n"
                                + "                                                            <img src=\"assets\\img\\cart\\span-hot.png\" alt=\"\">\n"
                                + "                                                        </div>\n"
                                + "                                                    </div>\n"
                                + "                                                </div>\n"
                                + "                                                <div class=\"col-lg-9 col-md-7 col-sm-6\">\n"
                                + "                                                    <div class=\"list_product_content\">\n"
                                + "                                                        <div class=\"list_title\">\n"
                                + "                                                            <h3><a href=\"single-product.jsp\">" + i.getName() + "</a></h3>\n"
                                + "                                                        </div>\n"
                                + "                                                        <p class=\"design\">" + i.getDescription() + "</p>\n"
                                + "                                                        <div class=\"content_price\">\n"
                                + "                                                            <span>" + i.getPrice() + " đ</span>\n"
                                + "                                                        </div>\n"
                                + "                                                        <div class=\"add_links\">\n"
                                + "                                                            <ul>\n"
                                + "                                                                <li><a href=\"#\" title=\"add to cart\"><i class=\"fa fa-shopping-cart\" aria-hidden=\"true\"></i></a></li>\n"
                                + "                                                                <li><a href=\"#\" title=\"add to wishlist\"><i class=\"fa fa-heart\" aria-hidden=\"true\"></i></a></li>\n"
                                + "\n"
                                + "                                                            </ul>\n"
                                + "                                                        </div>\n"
                                + "                                                    </div>\n"
                                + "                                                </div>\n"
                                + "                                            </div>\n"
                                + "                                        </div>");
                    }
                    out.println("</div>\n"
                            + "                            </div>\n"
                            + "                        </div>    \n"
                            + "                        <!--shop tab product end-->\n"
                            + "\n"
                            + "                        <!--pagination style start--> \n"
                            + "                        <div class=\"pagination_style shop_page\">\n"
                            + "                            <div class=\"item_page\">\n"
                            + "                                \n"
                            + "                            </div>\n"
                            + "                            <div class=\"page_number\">\n"
                            + "                                <span>Pages: </span>\n"
                            + "                                <ul>\n"
                            + "                                    <li>«</li>\n"
                            + "                                    <!--<li class=\"current_number\">1</li>-->");
                    for (int i = 1; i <= (int) session.getAttribute("numberOfPage2"); i++) {
                        out.println("<li><a href=\"page?shop=shop-fullwidth-list&&page=" + i + "&&name=" + name + "\">" + i + "</a></li>");
                    }
                    out.println("<li>»</li>\n"
                            + "                                </ul>\n"
                            + "                            </div>\n"
                            + "                        </div>\n"
                            + "                        <!--pagination style end-->  \n"
                            + "                    </div>");
                    break;
                default:
                    break;
            }
        } else {
            out.println("<!--banner slider start-->\n"
                    + "                                <div hidden class=\"banner_slider mb-35\">\n"
                    + "                                    <img src=\"assets\\img\\banner\\bannner10.jpg\" alt=\"\">\n"
                    + "                                </div>\n"
                    + "                                <!--banner slider start-->\n"
                    + "                                <!--shop toolbar start-->\n"
                    + "                                <div class=\"shop_toolbar mb-35\">\n"
                    + "                                 <div class=\"list_button\" style=\"visibility: hidden\">\n"
                    + "                                        <ul class=\"nav\" role=\"tablist\">\n"
                    + "                                            <li>\n"
                    + "                                                <a class=\"active\" data-toggle=\"tab\" href=\"#large\" role=\"tab\" aria-controls=\"large\" aria-selected=\"true\"><i class=\"fa fa-th-large\"></i></a>\n"
                    + "                                            </li>\n"
                    + "                                            <li>\n"
                    + "                                                <a data-toggle=\"tab\" href=\"#list\" role=\"tab\" aria-controls=\"list\" aria-selected=\"false\"><i class=\"fa fa-th-list\"></i></a>\n"
                    + "                                            </li>\n"
                    + "                                        </ul>\n"
                    + "                                    </div>");
            if ((int) session.getAttribute("numberOfProduct") != 0) {
                out.println("                                    <div class=\"page_amount\">\n"
                        + "                                        <p>Showing 1–" + session.getAttribute("numberOfPage") + " of " + session.getAttribute("numberOfProduct") + " results</p>\n"
                        + "                                    </div>\n");
            } else {
                out.println("                                    <div class=\"page_amount\">\n"
                        + "                                        <h3>Not found product!</h3>"
                        + "                                    </div>\n");
            }
            out.println("\n"
                    + "                                    <div class=\"select_option\">\n"
                    + "                                    </div>"
                    + "                                </div>\n"
                    + "                                <!--shop toolbar end-->\n"
                    + "\n"
                    + "                                <!--shop tab product-->\n"
                    + "                                <div class=\"shop_tab_product\">\n"
                    + "                                    <div class=\"tab-content\" id=\"myTabContent\">\n"
                    + "                                        <div class=\"tab-pane fade show active\" id=\"large\" role=\"tabpanel\">\n"
                    + "                                            <div class=\"row\">"
            );
            for (Product i : proList) {
                out.println("<div class=\"col-lg-4 col-md-6\">\n"
                        + "                                                        <div class=\"single_product\">\n"
                        + "                                                            <div class=\"product_thumb\">\n"
                        + "                                                                <a href=\"single-product.jsp\"><img src=\"" + i.getImg() + "\" alt=\"" + i.getAlt() + "\"></a>\n"
                        + "                                                                <div class=\"img_icone\">\n"
                        + "                                                                    <img src=\"assets\\img\\cart\\span-new.png\" alt=\"\">\n"
                        + "                                                                </div>\n"
                        + "                                                                <div class=\"product_action\">\n"
                        + "                                                                    <a href=\"#\"> <i class=\"fa fa-shopping-cart\"></i> Add to cart</a>\n"
                        + "                                                                </div>\n"
                        + "                                                            </div>\n"
                        + "                                                            <div class=\"product_content\">\n"
                        + "                                                                <span class=\"product_price\">" + i.getPrice() + " đ</span>\n"
                        + "                                                                <h3 class=\"product_title\"><a href=\"single-product.jsp\">" + i.getName() + "</a></h3>\n"
                        + "                                                            </div>\n"
                        + "                                                            <div class=\"product_info\">\n"
                        + "                                                                <ul>\n"
                        + "                                                                    <li><a href=\"#\" title=\" Add to Wishlist \">Add to Wishlist</a></li>\n"
                        + "                                                                    <li><a href=\"single-product.jsp\">View Detail</a></li>\n"
                        + "                                                                </ul>\n"
                        + "                                                            </div>\n"
                        + "                                                        </div>\n"
                        + "                                                    </div>");
            }
            out.println("</div>\n"
                    + "                                            </div>\n"
                    + "\n"
                    + "                                        </div>\n"
                    + "                                    </div>\n"
                    + "                                    <!--shop tab product end-->\n"
                    + "\n"
                    + "                                    <!--pagination style start-->\n"
                    + "                                    <div class=\"pagination_style\">\n"
                    + "                                        <div class=\"item_page\">\n"
                    + "                                        </div>\n"
                    + "                                        <div class=\"page_number\">\n"
                    + "                                            <span>Pages: </span>\n"
                    + "                                            <ul>\n"
                    + "                                                <li>«</li>");
            for (int i = 1; i <= (int) session.getAttribute("numberOfPage"); i++) {
                out.println("<li><a href=\"page?page=" + i + "&&name=" + name + "\">" + i + "</a></li>");
            }
            out.print("<li>»</li>\n"
                    + "                                        </ul>\n"
                    + "                                    </div>\n"
                    + "                                    <!--pagination style end-->\n"
                    + "                                </div>");
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
