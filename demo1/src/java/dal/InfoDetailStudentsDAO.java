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
import model.InfoDetailStudents;
import java.sql.Date;
import java.time.LocalDate;
import model.InfoDetailAdmin;

/**
 *
 * @author FPT SHOP
 */
public class InfoDetailStudentsDAO extends DBContext {

    public List<InfoDetailStudents> getAll() {
        List<InfoDetailStudents> list = new ArrayList<>();
        String sql = "select * from Students";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                InfoDetailStudents s = new InfoDetailStudents(
                        rs.getInt("ID"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role_ID"),
                        rs.getString("fullName"),
                        rs.getInt("gender"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("birthday"),
                        rs.getInt("status"),
                        rs.getString("img_profile")
                );
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean updateStudent(int ID, String password, int role_ID, String fullName, int gender, String address,
            String email, String phone_number, String birthday, int status, String img_profile) {
        String sql = "UPDATE Students SET password = ?, role_ID = ?, fullName = ?, gender = ?, address = ?, email = ?, "
                + "phone_number = ?, birthday = ?, status = ?, img_profile = ? WHERE ID = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, password);
            statement.setInt(2, role_ID);
            statement.setString(3, fullName);
            statement.setInt(4, gender);
            statement.setString(5, address);
            statement.setString(6, email);
            statement.setString(7, phone_number);
            statement.setString(8, birthday);
            statement.setInt(9, status);
            statement.setString(10, img_profile);
            statement.setInt(11, ID);

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0; // Return true if rows were affected
        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception
            return false; // Return false if an error occurred
        }
    }

    public InfoDetailStudents getByID(int ID) {
        String sql = "select * from Students where ID = ?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                InfoDetailStudents s = new InfoDetailStudents(
                        rs.getInt("ID"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role_ID"),
                        rs.getString("fullName"),
                        rs.getInt("gender"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("birthday"),
                        rs.getInt("status"),
                        rs.getString("img_profile")
                );
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int countInfoDetail() {
        String sql = " select count(*) as numberOfInfoDetail from Admins";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("numberOfInfoDetail");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public String getPasswordByID(int id) {
        String sql = "select password FROM Admins where id = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getString("password");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertInfoDetail(int ID, String username, String password,String fullName, int gender, String address, String email, String phone_number, String birthday,int status, String img_profile) {
        String sql = "INSERT INTO Admins (ID,username,password,fullName,gender,address,email,phone_number,birthday,status,img_profile) VALUES (?,?,?,?,?,?,?,?,?,?,?) ";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ID);
            st.setString(2, username);
            st.setString(3, password);
            st.setString(4, fullName);
            st.setInt(5, gender);
            st.setString(6, address);
            st.setString(7, email);
            st.setString(8,phone_number );
            st.setString(9, birthday);
            st.setInt(10,status );
            st.setString(11, img_profile);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        InfoDetailStudentsDAO pro = new InfoDetailStudentsDAO();
        List<InfoDetailStudents> proList = pro.getAll();
        System.out.println(pro.updateStudent(0, "123", 0, "anh", 0, "Hn", "anh123@gmail.com", "123456789",("2003-05-06"), 0, "anh"));
    }
}
