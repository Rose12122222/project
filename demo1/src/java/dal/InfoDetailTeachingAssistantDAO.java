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
import model.InfoDetailTeachingAssistant;

/**
 *
 * @author FPT SHOP
 */
public class InfoDetailTeachingAssistantDAO extends DBContext {

    public List<InfoDetailTeachingAssistant> getAll() {
        List<InfoDetailTeachingAssistant> list = new ArrayList<>();
        String sql = "select * from TeachingAssistant";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                InfoDetailTeachingAssistant s = new InfoDetailTeachingAssistant(
                        rs.getInt("ID"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role_ID"),
                        rs.getString("fullName"),
                        rs.getInt("gender"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getDate("birthday"),
                        rs.getString("img_certificates"),
                        rs.getString("img_profile"),
                        rs.getString("description")
                );
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    

    public static void main(String[] args) {
        InfoDetailTeachingAssistantDAO pro = new InfoDetailTeachingAssistantDAO();
        List<InfoDetailTeachingAssistant> proList = pro.getAll();
        System.out.println(pro.getAll().get(0).getID());

    }
}
