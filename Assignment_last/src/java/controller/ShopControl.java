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
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author FPT SHOP
 */
public class ShopControl extends HttpServlet {

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
        if (request.getParameter("cid") == null || request.getParameter("cid").equals("")
                || request.getParameter("cid").equals("null") || request.getParameter("cid").equals("none")) {
            cid = null;
        }

        String color = (String) request.getParameter("color");
        if (request.getParameter("color") == null || request.getParameter("color").equals("")
                || request.getParameter("color").equals("null") || request.getParameter("color").equals("none")) {
            color = null;
        }
        String name = (String) request.getParameter("name");
//        if (request.getParameter("nonlive") != null && (request.getParameter("name") == null || request.getParameter("name").equals(""))) {
//            return;
//        }
        if (request.getParameter("name") == null || request.getParameter("name").equals("")) {
            name = null;
        }

        String sPrice = (String) request.getParameter("minValue");
        String ePrice = (String) request.getParameter("maxValue");
        if (request.getParameter("maxValue") != null && request.getParameter("minValue") != null) {
            if (request.getParameter("minValue").equals("") || request.getParameter("maxValue").equals("")
                    || request.getParameter("minValue").equals("null") || request.getParameter("maxValue").equals("null")) {
                sPrice = null;
                ePrice = null;
            }
        }
        String order = (String) request.getParameter("order");
        if (request.getParameter("order") == null || request.getParameter("order").equals("")
                || request.getParameter("order").equals("null") || request.getParameter("order").equals("0")) {
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
//        int currentPage;
        HttpSession session = request.getSession();
        request.setAttribute("cid", cid);
        request.setAttribute("color", color);
        request.setAttribute("order", order);
        request.setAttribute("sPrice", sPrice);
        request.setAttribute("ePrice", ePrice);
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

        session.setAttribute("totalProduct", proDAO.countProduct());
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
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        ProductDAO proDAO = new ProductDAO();

        String page = (String) request.getParameter("page");
        String shop = (String) request.getParameter("shop");

        String cid = (String) request.getParameter("cid");

        String type = (String) request.getParameter("color");

        String name = (String) request.getParameter("name");

        String sPrice = (String) request.getParameter("minValue");
        String ePrice = (String) request.getParameter("maxValue");

        HttpSession session = request.getSession();

        if (session.getAttribute("min") != null && session.getAttribute("max") != null && ((sPrice.equals("") || ePrice.equals("")))) {
            sPrice = (String) session.getAttribute("min");
            ePrice = (String) session.getAttribute("max");
        }
        System.out.println(name);
        if ((sPrice.equals("") || ePrice.equals(""))) {
            sPrice = null;
            ePrice = null;
        }

        String sort = (String) request.getParameter("order");

        int pageNumber;
        if (page == null) {
            pageNumber = 1;
        } else {
            pageNumber = Integer.parseInt(page);
        }

        if (ePrice != null && sPrice != null) {
            session.setAttribute("min", sPrice);
            session.setAttribute("max", ePrice);
        }
        String currentPage;
        List<Product> proList = proDAO.getNext9ProductAfterSearchAll(cid, type, sPrice, ePrice, name, sort, pageNumber);
//        System.out.println(proList.get(0).getName());

        session.setAttribute("productList", proList);

        session.setAttribute("numberOfProduct", proDAO.countAfterSearchAll(cid, type, sPrice, ePrice, name));
        session.setAttribute("numberOfPage", (int) Math.ceil(proDAO.countAfterSearchAll(cid, type, sPrice, ePrice, name) * 1.0 / 9));

        List<Product> subProList = proDAO.getNext12ProductAfterSearchAll(cid, type, sPrice, ePrice, name, sort, pageNumber);

        session.setAttribute("productList2", subProList);

        session.setAttribute("numberOfPage2", (int) Math.ceil(proDAO.countAfterSearchAll(cid, type, sPrice, ePrice, name) * 1.0 / 12));

        DecimalFormatSymbols symbols = new DecimalFormatSymbols();
        symbols.setGroupingSeparator('.'); // Sử dụng dấu chấm '.' để phân cách hàng nghìn

        DecimalFormat df = new DecimalFormat("#,###", symbols);
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
                                + "                                                                <a href=\"product-detail?id=" + i.getId() + "\"><img src=\"" + i.getImg() + "\" alt=\"" + i.getAlt() + "\"></a> \n"
                                + "                                                                <div class=\"hot_img\">\n"
                                + "                                                                    <img src=\"\" alt=\"\">\n"
                                + "                                                                </div>\n"
                                + "                                                            </div>\n"
                                + "                                                        </div>\n"
                                + "                                                        <div class=\"col-lg-8 col-md-6 col-sm-6\">\n"
                                + "                                                            <div class=\"list_product_content\">                                           \n"
                                + "                                                                <div class=\"list_title\">\n"
                                + "                                                                    <h3><a href=\"product-detail?id=" + i.getId() + "\">" + i.getName() + "</a></h3>\n"
                                + "                                                                </div>\n"
                                + "                                                                <p class=\"design\">" + i.getDescription() + "</p>\n"
                                + "\n"
                                + "                                                                <div class=\"content_price\">\n"
                                + "                                                                    <span class=\"price_format\">" + df.format(i.getPrice() * (1 - i.getDiscount())) + " đ</span>\n");
                        if (i.getDiscount() != 0) {
                            out.println("<span class=\"old-price price_format\">" + df.format(i.getPrice()) + " đ</span>\n");
                        }
                        out.println("</div>\n"
                                + "                                                                <div class=\"add_links\">\n"
                                + "                                                                    <ul>\n"
                                + "                                                                        <li><a href=\"cart?action=add&pid=" + i.getId() + "&quantity=1\" title=\"add to cart\"><i class=\"fa fa-shopping-cart\" aria-hidden=\"true\"></i></a></li>\n"
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
                            + "                                        <ul>\n");
                    if (page == null || page.equals("1")) {
                        currentPage = "1";
                    } else {
                        currentPage = page;
                    }
                    out.println("<li><a href=\"page?shop=shop-list&&page=" + 1 + "&&name=" + name + "&&cid=" + cid + "&&color=" + type + "&&minValue=" + sPrice + "&&maxValue=" + ePrice + "&&order=" + sort + "\">«</a></li>");
                    for (int i = 1; i <= (int) session.getAttribute("numberOfPage"); i++) {
                        if (i == Integer.parseInt(currentPage)) {
                            out.println("<li class=\"current_number\">" + i + "</li>");
                        } else {
                            out.println("<li><a href=\"page?shop=shop-list&&page=" + i + "&&name=" + name + "&&cid=" + cid + "&&color=" + type + "&&minValue=" + sPrice + "&&maxValue=" + ePrice + "&&order=" + sort + "\">" + i + "</a></li>");
                        }
                    }
                    out.println("<li><a href=\"page?shop=shop-list&&page=" + session.getAttribute("numberOfPage") + "&&name=" + name + "&&cid=" + cid + "&&color=" + type + "&&minValue=" + sPrice + "&&maxValue=" + ePrice + "&&order=" + sort + "\">»</a></li>");
                    out.print("</ul>\n"
                            + "                                    </div>\n"
                            + "                                    <!--pagination style end-->\n"
                            + "                                </div>");
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
                                + "                                                        <a href=\"product-detail?id=" + i.getId() + "\"><img src=\"" + i.getImg() + "\" alt=\"" + i.getAlt() + "\"></a> \n"
                                + "                                                        <div class=\"img_icone\">\n"
                                + "                                                            <img src=\"\" alt=\"\">\n"
                                + "                                                        </div>\n"
                                + "                                                        <div class=\"product_action\">\n"
                                + "                                                            <a href=\"cart?action=add&pid=" + i.getId() + "&quantity=1\"> <i class=\"fa fa-shopping-cart\"></i> Add to cart</a>\n"
                                + "                                                        </div>\n"
                                + "                                                    </div>\n"
                                + "                                                    <div class=\"product_content\">\n");
                        out.println("<span class=\"product_price price_format\">" + df.format(i.getPrice() * (1 - i.getDiscount())) + " đ</span>");
                        out.println("                                                    <h3 class=\"product_title\"><a href=\"product-detail?id=" + i.getId() + "\">" + i.getName() + "</a></h3>\n"
                                + "                                                    </div>\n"
                                + "                                                    <div class=\"product_info\">\n"
                                + "                                                        <ul>\n"
                                + "                                                            <li><a href=\"#\" title=\" Add to Wishlist \">Add to Wishlist</a></li>\n"
                                + "                                                            <li><a href=\"product-detail?id=" + i.getId() + "\">View Detail</a></li>\n"
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
                            + "                                <ul>\n");
                    if (page == null || page.equals("1")) {
                        currentPage = "1";
                    } else {
                        currentPage = page;
                    }
                    out.println("<li><a href=\"page?shop=shop-fullwidth&&page=" + 1 + "&&name=" + name + "&&cid=" + cid + "&&color=" + type + "&&minValue=" + sPrice + "&&maxValue=" + ePrice + "&&order=" + sort + "\">«</a></li>");
                    for (int i = 1; i <= (int) session.getAttribute("numberOfPage2"); i++) {
                        if (i == Integer.parseInt(currentPage)) {
                            out.println("<li class=\"current_number\">" + i + "</li>");
                        } else {
                            out.println("<li><a href=\"page?shop=shop-fullwidth&&page=" + i + "&&name=" + name + "&&cid=" + cid + "&&color=" + type + "&&minValue=" + sPrice + "&&maxValue=" + ePrice + "&&order=" + sort + "\">" + i + "</a></li>");
                        }
                    }
                    out.println("<li><a href=\"page?shop=shop-fullwidth&&page=" + session.getAttribute("numberOfPage2") + "&&name=" + name + "&&cid=" + cid + "&&color=" + type + "&&minValue=" + sPrice + "&&maxValue=" + ePrice + "&&order=" + sort + "\">»</a></li>");
                    out.print("</ul>\n"
                            + "                                    </div>\n"
                            + "                                    <!--pagination style end-->\n"
                            + "                                </div>");
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
                                + "                                                        <a href=\"product-detail?id=" + i.getId() + "\"><img src=\"" + i.getImg() + "\" alt=\"" + i.getAlt() + "\"></a> \n"
                                + "                                                        <div class=\"hot_img\">\n"
                                + "                                                            <img src=\"\" alt=\"\">\n"
                                + "                                                        </div>\n"
                                + "                                                    </div>\n"
                                + "                                                </div>\n"
                                + "                                                <div class=\"col-lg-9 col-md-7 col-sm-6\">\n"
                                + "                                                    <div class=\"list_product_content\">\n"
                                + "                                                        <div class=\"list_title\">\n"
                                + "                                                            <h3><a href=\"product-detail?id=" + i.getId() + "\">" + i.getName() + "</a></h3>\n"
                                + "                                                        </div>\n"
                                + "                                                        <p class=\"design\">" + i.getDescription() + "</p>\n"
                                + "                                                        <div class=\"content_price\">\n"
                                + "                                                            <span class=\"price_format\">" + df.format(i.getPrice() * (1 - i.getDiscount())) + " đ</span>\n");
                        if (i.getDiscount() != 0) {
                            out.println("<span class=\"old-price price_format\">" + df.format(i.getPrice()) + " đ</span>\n");
                        }
                        out.println("                                                       </div>\n"
                                + "                                                        <div class=\"add_links\">\n"
                                + "                                                            <ul>\n"
                                + "                                                                <li><a href=\"cart?action=add&pid=" + i.getId() + "&quantity=1\" title=\"add to cart\"><i class=\"fa fa-shopping-cart\" aria-hidden=\"true\"></i></a></li>\n"
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
                            + "                                <ul>\n");
                    if (page == null || page.equals("1")) {
                        currentPage = "1";
                    } else {
                        currentPage = page;
                    }
                    out.println("<li><a href=\"page?shop=shop-fullwidth-list&&page=" + 1 + "&&name=" + name + "&&cid=" + cid + "&&color=" + type + "&&minValue=" + sPrice + "&&maxValue=" + ePrice + "&&order=" + sort + "\">«</a></li>");
                    for (int i = 1; i <= (int) session.getAttribute("numberOfPage2"); i++) {
                        if (i == Integer.parseInt(currentPage)) {
                            out.println("<li class=\"current_number\">" + i + "</li>");
                        } else {
                            out.println("<li><a href=\"page?shop=shop-fullwidth-list&&page=" + i + "&&name=" + name + "&&cid=" + cid + "&&color=" + type + "&&minValue=" + sPrice + "&&maxValue=" + ePrice + "&&order=" + sort + "\">" + i + "</a></li>");
                        }
                    }
                    out.println("<li><a href=\"page?shop=shop-fullwidth-list&&page=" + session.getAttribute("numberOfPage2") + "&&name=" + name + "&&cid=" + cid + "&&color=" + type + "&&minValue=" + sPrice + "&&maxValue=" + ePrice + "&&order=" + sort + "\">»</a></li>");
                    out.print("</ul>\n"
                            + "                                    </div>\n"
                            + "                                    <!--pagination style end-->\n"
                            + "                                </div>");
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
                        + "                                                                <a href=\"product-detail?id=" + i.getId() + "\"><img src=\"" + i.getImg() + "\" alt=\"" + i.getAlt() + "\"></a>\n"
                        + "                                                                <div class=\"img_icone\">\n"
                        + "                                                                    <img src=\"\" alt=\"\">\n"
                        + "                                                                </div>\n"
                        + "                                                                <div class=\"product_action\">\n"
                        + "                                                                    <a href=\"cart?action=add&pid=" + i.getId() + "&quantity=1\"> <i class=\"fa fa-shopping-cart\"></i> Add to cart</a>\n"
                        + "                                                                </div>\n"
                        + "                                                            </div>\n"
                        + "                                                            <div class=\"product_content\">\n"
                        + "                                                                <span class=\"product_price price_format\">" + df.format(i.getPrice() * (1 - i.getDiscount())) + " đ</span>\n"
                        + "                                                                <h3 class=\"product_title\"><a href=\"product-detail?id=" + i.getId() + "\">" + i.getName() + "</a></h3>\n"
                        + "                                                            </div>\n"
                        + "                                                            <div class=\"product_info\">\n"
                        + "                                                                <ul>\n"
                        + "                                                                    <li><a href=\"#\" title=\" Add to Wishlist \">Add to Wishlist</a></li>\n"
                        + "                                                                    <li><a href=\"product-detail?id=" + i.getId() + "\">View Detail</a></li>\n"
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
                    + "                                            <ul>\n");
            if (page == null || page.equals("1")) {
                currentPage = "1";
            } else {
                currentPage = page;
            }
            out.println("<li><a href=\"page?page=" + 1 + "&&name=" + name + "&&cid=" + cid + "&&color=" + type + "&&minValue=" + sPrice + "&&maxValue=" + ePrice + "&&order=" + sort + "\">«</a></li>");
            for (int i = 1; i <= (int) session.getAttribute("numberOfPage"); i++) {
                if (i == Integer.parseInt(currentPage)) {
                    out.println("<li class=\"current_number\">" + i + "</li>");
                } else {
                    out.println("<li><a href=\"page?page=" + i + "&&name=" + name + "&&cid=" + cid + "&&color=" + type + "&&minValue=" + sPrice + "&&maxValue=" + ePrice + "&&order=" + sort + "\">" + i + "</a></li>");
                }
            }
            out.println("<li><a href=\"page?page=" + session.getAttribute("numberOfPage") + "&&name=" + name + "&&cid=" + cid + "&&color=" + type + "&&minValue=" + sPrice + "&&maxValue=" + ePrice + "&&order=" + sort + "\">»</a></li>");
            out.print("</ul>\n"
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
