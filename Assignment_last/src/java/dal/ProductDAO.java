/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import com.oracle.wls.shaded.org.apache.bcel.generic.AALOAD;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import model.Product;

/**
 *
 * @author FPT SHOP
 */
public class ProductDAO extends DBContext {

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product s = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getFloat("price"),
                        rs.getString("type"),
                        rs.getString("date"),
                        rs.getInt("amount"),
                        rs.getInt("cid"),
                        rs.getFloat("discount"),
                        rs.getString("img"),
                        rs.getString("alt"),
                        rs.getString("description"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public int countProduct() {
        String sql = "select count(*) as \"numberOfProduct\" from Product";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("numberOfProduct");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Product> getNext9Product(int page) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product order by id offset ? rows fetch next ? rows only";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, 0 + 9 * (page - 1));
            st.setInt(2, 9);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product s = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getFloat("price"),
                        rs.getString("type"),
                        rs.getString("date"),
                        rs.getInt("amount"),
                        rs.getInt("cid"),
                        rs.getFloat("discount"),
                        rs.getString("img"),
                        rs.getString("alt"),
                        rs.getString("description"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Product> getNext12Product(int page) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product order by id offset ? rows fetch next ? rows only";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, 0 + 12 * (page - 1));
            st.setInt(2, 12);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product s = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getFloat("price"),
                        rs.getString("type"),
                        rs.getString("date"),
                        rs.getInt("amount"),
                        rs.getInt("cid"),
                        rs.getFloat("discount"),
                        rs.getString("img"),
                        rs.getString("alt"),
                        rs.getString("description"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Product> getAllProductAfterSearchAll(String cid, String type, String sPrice, String ePrice, String name, String sort) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product";
        try {
            int cnt = 1;
            if (cid != null || type != null || sPrice != null || ePrice != null || name != null) {
                sql += " where ";
                if (cid != null && !cid.equalsIgnoreCase("none")) {
                    sql += "cid = ? and ";
                }
                if (type != null && !type.equalsIgnoreCase("none")) {
                    sql += "type = ? and ";
                }
                if (name != null) {
                    sql += "name like ? and ";
                }
                if (sPrice != null && ePrice != null) {
                    sql += "(price between ? and ?) and ";
                }
                if (sql.endsWith("and ")) {
                    sql = sql.substring(0, sql.length() - 4);
                }
            }
            if (sort != null) {
                switch (sort) {
                    case "1":
                        sql += " order by price asc";
                        break;
                    case "2":
                        sql += " order by price desc";
                        break;
                    case "3":
                        sql += " order by amount asc";
                        break;
                    case "4":
                        sql += " order by amount desc";
                        break;
                    default:
                        break;
                }

            }
            PreparedStatement st = connection.prepareStatement(sql);
            if (cid != null && !cid.equalsIgnoreCase("none")) {
                st.setString(cnt, cid);
                ++cnt;
            }
            if (type != null && !type.equalsIgnoreCase("none")) {
                st.setString(cnt, type);
                ++cnt;
            }
            if (name != null) {
                st.setString(cnt, "%" + name + "%");
                ++cnt;
            }
            if (sPrice != null && ePrice != null) {
                st.setString(cnt, sPrice);
                ++cnt;
                st.setString(cnt, ePrice);
                ++cnt;
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product s = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getFloat("price"),
                        rs.getString("type"),
                        rs.getString("date"),
                        rs.getInt("amount"),
                        rs.getInt("cid"),
                        rs.getFloat("discount"),
                        rs.getString("img"),
                        rs.getString("alt"),
                        rs.getString("description"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public int countAfterSearchAll(String cid, String type, String sPrice, String ePrice, String name) {
        String sql = "select count(id) as numberOfProduct from Product";
        try {
            int cnt = 1;
            if (cid != null || type != null || sPrice != null || ePrice != null || name != null) {
                sql += " where ";
                if (cid != null && !cid.equalsIgnoreCase("none")) {
                    sql += "cid = ? and ";
                }
                if (type != null && !type.equalsIgnoreCase("none")) {
                    sql += "type = ? and ";
                }
                if (name != null) {
                    sql += "name like ? and ";
                }
                if (sPrice != null && ePrice != null) {
                    sql += "(price between ? and ?) and ";
                }
                if (sql.endsWith("and ")) {
                    sql = sql.substring(0, sql.length() - 4);
                }
            }
            PreparedStatement st = connection.prepareStatement(sql);
            if (cid != null && !cid.equalsIgnoreCase("none")) {
                st.setString(cnt, cid);
                ++cnt;
            }
            if (type != null && !type.equalsIgnoreCase("none")) {
                st.setString(cnt, type);
                ++cnt;
            }
            if (name != null) {
                st.setString(cnt, "%" + name + "%");
                ++cnt;
            }
            if (sPrice != null && ePrice != null) {
                st.setString(cnt, sPrice);
                ++cnt;
                st.setString(cnt, ePrice);
                ++cnt;
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("numberOfProduct");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return 0;
    }

    public List<Product> getNext9ProductAfterSearchAll(String cid, String type, String sPrice, String ePrice, String name, String sort, int page) {
        List<Product> list = new ArrayList<>();
        String sql = "select *, price * (1 - discount) from Product";
        try {
            int cnt = 1;
            if (cid != null || type != null || sPrice != null || ePrice != null || name != null) {
                sql += " where ";
                if (cid != null && !cid.equalsIgnoreCase("none")) {
                    sql += "cid = ? and ";
                }
                if (type != null && !type.equalsIgnoreCase("none")) {
                    sql += "type = ? and ";
                }
                if (name != null) {
                    sql += "name like ? and ";
                }
                if (sPrice != null && ePrice != null) {
                    sql += "(price between ? and ?) and ";
                }
                if (sql.endsWith("and ")) {
                    sql = sql.substring(0, sql.length() - 4);
                }
            }
            if (sort != null) {
                switch (sort) {
                    case "1":
                        sql += " order by price * (1 - discount) asc";
                        break;
                    case "2":
                        sql += " order by price * (1 - discount) desc";
                        break;
                    case "3":
                        sql += " order by amount asc";
                        break;
                    case "4":
                        sql += " order by amount desc";
                        break;
                    default:
                        sql += " order by id asc";
                        break;
                }
                sql += " offset ? rows fetch next ? rows only";
            } else {
                sql += " order by id asc offset ? rows fetch next ? rows only";
            }
            PreparedStatement st = connection.prepareStatement(sql);
            if (cid != null && !cid.equalsIgnoreCase("none")) {
                st.setString(cnt, cid);
                ++cnt;
            }
            if (type != null && !type.equalsIgnoreCase("none")) {
                st.setString(cnt, type);
                ++cnt;
            }
            if (name != null) {
                st.setString(cnt, "%" + name + "%");
                ++cnt;
            }
            if (sPrice != null && ePrice != null) {
                st.setString(cnt, sPrice);
                ++cnt;
                st.setString(cnt, ePrice);
                ++cnt;
            }
            st.setInt(cnt, 0 + 9 * (page - 1));
            ++cnt;
            st.setInt(cnt, 9);
            ++cnt;
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product s = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getFloat("price"),
                        rs.getString("type"),
                        rs.getString("date"),
                        rs.getInt("amount"),
                        rs.getInt("cid"),
                        rs.getFloat("discount"),
                        rs.getString("img"),
                        rs.getString("alt"),
                        rs.getString("description"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Product> getNext12ProductAfterSearchAll(String cid, String type, String sPrice, String ePrice, String name, String sort, int page) {
        List<Product> list = new ArrayList<>();
        String sql = "select *, price * (1 - discount) from Product";
        try {
            int cnt = 1;
            if (cid != null || type != null || sPrice != null || ePrice != null || name != null) {
                sql += " where ";
                if (cid != null) {
                    sql += "cid = ? and ";
                }
                if (type != null) {
                    sql += "type = ? and ";
                }
                if (name != null) {
                    sql += "name like ? and ";
                }
                if (sPrice != null && ePrice != null) {
                    sql += "(price between ? and ?) and ";
                }
                if (sql.endsWith("and ")) {
                    sql = sql.substring(0, sql.length() - 4);
                }
            }
            if (sort != null) {
                switch (sort) {
                    case "1":
                        sql += " order by price * (1 - discount) asc";
                        break;
                    case "2":
                        sql += " order by price * (1 - discount) desc";
                        break;
                    case "3":
                        sql += " order by amount asc";
                        break;
                    case "4":
                        sql += " order by amount desc";
                        break;
                    default:
                        sql += " order by id asc";
                        break;
                }
                sql += " offset ? rows fetch next ? rows only";
            } else {
                sql += " order by id asc offset ? rows fetch next ? rows only";
            }
            PreparedStatement st = connection.prepareStatement(sql);
            if (cid != null) {
                st.setString(cnt, cid);
                ++cnt;
            }
            if (type != null) {
                st.setString(cnt, type);
                ++cnt;
            }
            if (name != null) {
                st.setString(cnt, "%" + name + "%");
                ++cnt;
            }
            if (sPrice != null && ePrice != null) {
                st.setString(cnt, sPrice);
                ++cnt;
                st.setString(cnt, ePrice);
                ++cnt;
            }
            st.setInt(cnt, 0 + 12 * (page - 1));
            ++cnt;
            st.setInt(cnt, 12);
            ++cnt;
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product s = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getFloat("price"),
                        rs.getString("type"),
                        rs.getString("date"),
                        rs.getInt("amount"),
                        rs.getInt("cid"),
                        rs.getFloat("discount"),
                        rs.getString("img"),
                        rs.getString("alt"),
                        rs.getString("description"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Product> getAllProductByCatagory(String cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product by cid = ?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product s = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getFloat("price"),
                        rs.getString("type"),
                        rs.getString("date"),
                        rs.getInt("amount"),
                        rs.getInt("cid"),
                        rs.getFloat("discount"),
                        rs.getString("img"),
                        rs.getString("alt"),
                        rs.getString("description"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public int getNumberOfProductByCatagory(int cid) {
        String sql = "select count(*) as numberOfProduct from Product where cid = ?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("numberOfProduct");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return 0;
    }

    public List<String> getAllColor() {
        String sql = "SELECT type \n"
                + "FROM Product\n"
                + "GROUP BY type";
        //chay lenh truy van
        List<String> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("type"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public Product getProductById(int id) {
        String sql = "select * from Product where id = ?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product s = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getFloat("price"),
                        rs.getString("type"),
                        rs.getString("date"),
                        rs.getInt("amount"),
                        rs.getInt("cid"),
                        rs.getFloat("discount"),
                        rs.getString("img"),
                        rs.getString("alt"),
                        rs.getString("description"));
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> get5NewestProduct() {
        String sql = "SELECT TOP 5 *\n"
                + "FROM Product\n"
                + "ORDER BY date DESC;";
        //chay lenh truy van
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product s = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getFloat("price"),
                        rs.getString("type"),
                        rs.getString("date"),
                        rs.getInt("amount"),
                        rs.getInt("cid"),
                        rs.getFloat("discount"),
                        rs.getString("img"),
                        rs.getString("alt"),
                        rs.getString("description"));
                list.add(s);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> get5BestSaleProduct() {
        String sql = "SELECT TOP 5 *\n"
                + "FROM [dbo].[Product]\n"
                + "ORDER BY discount DESC;";
        //chay lenh truy van
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product s = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getFloat("price"),
                        rs.getString("type"),
                        rs.getString("date"),
                        rs.getInt("amount"),
                        rs.getInt("cid"),
                        rs.getFloat("discount"),
                        rs.getString("img"),
                        rs.getString("alt"),
                        rs.getString("description"));
                list.add(s);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> get5RelatedProduct(int id) {
        String sql = "select top 5 * from product where cid = (select cid from product where id = ?) and  id != ?;";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.setInt(2, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product s = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getFloat("price"),
                        rs.getString("type"),
                        rs.getString("date"),
                        rs.getInt("amount"),
                        rs.getInt("cid"),
                        rs.getFloat("discount"),
                        rs.getString("img"),
                        rs.getString("alt"),
                        rs.getString("description"));
                list.add(s);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateAmountProduct(int pid, int quantity) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "SET amount = amount - ?\n"
                + "WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quantity);
            st.setInt(2, pid);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public void insertProduct(String name, float price, String type, String date, int amount, int cid, float discount, String img, String alt, String description) {
        String sql = "INSERT INTO Product (name,price,type,date,amount,cid,discount,img,alt,description) VALUES (?,?,?,?,?,?,?,?,?,?)";
        DecimalFormat fomatter = new DecimalFormat("##.#");
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, fomatter.format(price));
            st.setString(3, type);
            st.setString(4, date);
            st.setInt(5, amount);
            st.setInt(6, cid);
            st.setString(7, fomatter.format(discount));
            st.setString(8, img);
            st.setString(9, alt);
            st.setString(10, description);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteProduct(int id) {
        String sql = "DELETE FROM Product where id = ? ";
        String preSql = "Delete from Payment where pid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(preSql);
            st.setInt(1, id);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void editProduct(int id, String name, float price, String type, String date, int amount, int cid, float discount, String img, String alt, String description) {
        String sql = "UPDATE Product SET name = ? , price = ? , type = ? , date = ? , amount = ? , cid = ? , discount = ? , img = ? , alt =? , description = ? WHERE id = ?";
        DecimalFormat fomatter = new DecimalFormat("##.#");
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, fomatter.format(price));
            st.setString(3, type);
            st.setString(4, date);
            st.setInt(5, amount);
            st.setInt(6, cid);
            st.setString(7, fomatter.format(discount));
            st.setString(8, img);
            st.setString(9, alt);
            st.setString(10, description);
            st.setInt(11, id);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public float getMaxPrice(int cid) {
        String sql = "Select max(price) as MAX_PRICE from Product where cid=?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("MAX_PRICE");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public float getMinPrice(int cid) {
        String sql = "Select min(price) as MIN_PRICE from Product where cid=?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("MIN_PRICE");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public float getAvgPrice(int cid) {
        String sql = "Select avg(price) as AVG_PRICE from Product where cid=?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("AVG_PRICE");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public float getMaxAmount(int cid) {
        String sql = "select max(amount) as MAX_AMOUNT from Product where cid=?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("MAX_AMOUNT");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public float getMinAmount(int cid) {
        String sql = "select min(amount) as MIN_AMOUNT from Product where cid=?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("MIN_AMOUNT");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public float getAvgAmount(int cid) {
        String sql = "select avg(amount) as AVG_AMOUNT from Product where cid=?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("AVG_AMOUNT");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public float getMaxDiscount(int cid) {
        String sql = "select max(discount) as MAX_DISCOUNT from Product where cid=?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("MAX_DISCOUNT");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public float getMinDiscount(int cid) {
        String sql = "select min(discount) as MIN_DISCOUNT from Product where cid=?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("MIN_DISCOUNT");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public float getAvgDiscount(int cid) {
        String sql = "select avg(discount) as AVG_DISCOUNT from Product where cid=1";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("AVG_DISCOUNT");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public float totalProduct(int cid) {
        String sql = "Select count(id) as TotalProduct from Product where cid=?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("TotalProduct");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int countProductByCID(int cid) {
        String sql = "select totalQuantity from\n"
                + "(SELECT C.[name], SUM(P.[amount]) AS totalQuantity\n"
                + "FROM Category AS C\n"
                + "JOIN Product AS P ON C.id = P.cid\n"
                + "where c.id=? \n"
                + "GROUP BY C.name) a";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("totalQuantity");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public float getMaxQuantityOfComplete(int cid) {
        String sql = "select max(NumberOfSeller) as MAX_NumberOfSeller from (select sum(quantity) as NumberOfSeller,cid from Orders \n"
                + "join Payment on oid = Orders.id\n"
                + "join Product on pid = Product.id\n"
                + "where status = 1\n"
                + "group by cid ,pid) a where cid = ?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("MAX_NumberOfSeller");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getMinQuantityOfComplete(int cid) {
        String sql = "select min(NumberOfSeller) as MIN_NumberOfSeller from (select sum(quantity) as NumberOfSeller,cid from Orders \n"
                + "join Payment on oid = Orders.id\n"
                + "join Product on pid = Product.id\n"
                + "where status = 1\n"
                + "group by cid ,pid) a where cid = ?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("MIN_NumberOfSeller");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public float getAVGQuantityOfComplete(int cid) {
        String sql = "select AVG(CAST(NumberOfSeller AS FLOAT)) as AVG_NumberOfSeller from (select sum(quantity) as NumberOfSeller,cid from Orders \n"
                + "join Payment on oid = Orders.id\n"
                + "join Product on pid = Product.id\n"
                + "where status = 1\n"
                + "group by cid ,pid) a where cid = ?;";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getFloat("AVG_NumberOfSeller");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getTotalQuantityOfComplete(int cid) {
        String sql = "select sum(NumberOfSeller) as Total_NumberOfSeller from (select sum(quantity) as NumberOfSeller,cid from Orders \n"
                + "join Payment on oid = Orders.id\n"
                + "join Product on pid = Product.id\n"
                + "where status = 1\n"
                + "group by cid ,pid) a where cid = ?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("Total_NumberOfSeller");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }
    public static void main(String[] args) {
        ProductDAO pro = new ProductDAO();
        List<Product> proList = pro.get5RelatedProduct(1);
//        System.out.println(pro.getNumberOfProductByCatagory("1"));
        for (Product i : proList) {
            System.out.println(i.getName());
        }
    }
}
