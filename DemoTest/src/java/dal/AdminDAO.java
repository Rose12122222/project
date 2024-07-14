/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Admins;

/**
 *
 * @author nguye
 */
public class AdminDAO extends DBContext {

    public List<Admins> getAllAdmin() {
        List<Admins> list = new ArrayList<>();
        String sql = "select * from Admins";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Admins s = new Admins(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role_ID"),
                        rs.getString("fullName"),
                        rs.getInt("gender"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getDate("birthday").toString(),
                        rs.getString("img_profile"));
                list.add(s);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Admins Update(Admins admin) {
        String sql = " UPDATE Admins SET fullName = ?, gender = ?, address = ?, email = ?, phone_number = ?, birthday = ? WHERE ID = ?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            // Set parameters for the prepared statement
            st.setString(1, admin.getFullName());
            st.setInt(2, admin.getGender());
            st.setString(3, admin.getAddress());
            st.setString(4, admin.getEmail());
            st.setString(5, admin.getPhoneNumber());
            st.setString(6, admin.getBirthDate());
            st.setInt(7, admin.getId());
            int rowsUpdated = st.executeUpdate();

            // Check update result
            if (rowsUpdated > 0) {
                sql = "select * from Admins WHERE ID = ?";
                st = connection.prepareStatement(sql);
                st.setInt(1, admin.getId());
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    Admins s = new Admins(rs.getInt("id"),
                            rs.getString("username"),
                            rs.getString("password"),
                            rs.getInt("role_ID"),
                            rs.getString("fullName"),
                            rs.getInt("gender"),
                            rs.getString("address"),
                            rs.getString("email"),
                            rs.getString("phone_number"),
                            rs.getDate("birthday").toString(),
                            rs.getString("img_profile"));
                    return s;
                }
            } else {
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }
  public Admins getById(int id) {
        String sql = "SELECT * FROM Admins WHERE ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Admins s = new Admins(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role_ID"),
                        rs.getString("fullName"),
                        rs.getInt("gender"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getDate("birthday").toString(),
                        rs.getString("img_profile"));
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public static void main(String[] args) {
        AdminDAO admin = new AdminDAO();
        System.out.println(admin.getAllAdmin().get(0).id);
    }
}
