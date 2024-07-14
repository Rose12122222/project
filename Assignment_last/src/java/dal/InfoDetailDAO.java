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
import model.InfoDetail;

/**
 *
 * @author FPT SHOP
 */
public class InfoDetailDAO extends DBContext {

    public List<InfoDetail> getAll() {
        List<InfoDetail> list = new ArrayList<>();
        String sql = "select * from InfoDetail";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                InfoDetail s = new InfoDetail(rs.getInt("aid"),
                        rs.getInt("gender"),
                        rs.getString("email"),
                        rs.getString("firstname"),
                        rs.getString("lastname"),
                        rs.getString("firstname"),
                        rs.getString("birthday"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public InfoDetail getInfoDetailByAId(int aid) {
        String sql = "select * from InfoDetail inner join Account on id = aid where id = ?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, aid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                InfoDetail s = new InfoDetail(rs.getInt("aid"),
                        rs.getInt("gender"),
                        rs.getString("email"),
                        rs.getString("firstname"),
                        rs.getString("lastname"),
                        rs.getString("address"),
                        rs.getString("birthday"));
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int countInfoDetail() {
        String sql = "select count(*) as \"numberOfInfoDetail\" from InfoDetail";
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

    public void insertInfoDetail(int aid, int gender, String email, String firstName, String lastName, String address, String birthday) {
        String sql = "INSERT INTO InfoDetail (aid,gender,email,firstName,lastName,address,birthday) VALUES (?,?,?,?,?,?,?) ";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, aid);
            st.setInt(2, gender);
            st.setString(3, email);
            st.setString(4, firstName);
            st.setString(5, lastName);
            st.setString(6, address);
            st.setString(7, birthday);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void editInfoDetail(int aid, int gender, String email, String firstName, String lastName, String address, String birthday) {
        String sql = "UPDATE InfoDetail SET gender = ? , email = ? , firstName = ? , lastName = ? , address = ? , birthday = ? where aid=?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, gender);
            st.setString(2, email);
            st.setString(3, firstName);
            st.setString(4, lastName);
            st.setString(5, address);
            st.setString(6, birthday);
            st.setInt(7, aid);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        InfoDetailDAO pro = new InfoDetailDAO();
        List<InfoDetail> proList = pro.getAll();
        System.out.println(pro.getInfoDetailByAId(1).getEmail());
//        for (InfoDetail i : proList) {
//            System.out.println(i.getAid());
//        }
    }
}
