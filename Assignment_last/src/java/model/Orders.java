/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.AccountDAO;

/**
 *
 * @author FPT SHOP
 */
public class Orders {
    int id;
    int aid;
    String date;
    float total;
    int numberOfItem;
    int status;

    public Orders() {
    }

    public Orders(int id, int aid, String date, float total, int numberOfItem, int status) {
        this.id = id;
        this.aid = aid;
        this.date = date;
        this.total = total;
        this.numberOfItem = numberOfItem;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public int getNumberOfItem() {
        return numberOfItem;
    }

    public void setNumberOfItem(int numberOfItem) {
        this.numberOfItem = numberOfItem;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    public String getUserNameByAid() {
        AccountDAO dao = new AccountDAO();
        return dao.getAccountByAid(this.aid).getUsername();
    }
}
