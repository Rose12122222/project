/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.InfoDetailDAO;

/**
 *
 * @author FPT SHOP
 */
public class Account {

    int id;
    String username;
    String password;
    int role;

    public Account() {
    }

    public Account(int id, String username, String password, int role) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getEmailById() {
        InfoDetailDAO dao = new InfoDetailDAO();
        if (dao.getInfoDetailByAId(this.id) != null) {
            return dao.getInfoDetailByAId(this.id).getEmail();
        } else {
            return null;
        }
    }
}
