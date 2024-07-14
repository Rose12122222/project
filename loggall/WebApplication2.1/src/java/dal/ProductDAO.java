/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
        String sql = "select * from Product";
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
        String sql = "select * from Product";
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

    public int getNumberOfProductByCatagory(String cid) {
        String sql = "select count(*) as numberOfProduct from Product where cid = ?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
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

    public static void main(String[] args) {
        ProductDAO pro = new ProductDAO();
        List<Product> proList = pro.getNext9ProductAfterSearchAll(null, null, null, null, null, "", 2);
//        System.out.println(pro.getNumberOfProductByCatagory("1"));
        for (Product i : proList) {
            System.out.println(i.getName());
        }
    }
}
