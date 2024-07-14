/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.CategoryDAO;

/**
 *
 * @author FPT SHOP
 */
public class Product {
    int id;
    String name;
    float price;
    String type;
    String date;
    int amount;
    int cid;
    float discount;
    String img;
    String alt;
    String description;
    
    public Product() {
    }

    public Product(int id, String name, float price, String type, String date, int amount, int cid, float discount, String img, String alt, String description) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.type = type;
        this.date = date;
        this.amount = amount;
        this.cid = cid;
        this.discount = discount;
        this.img = img;
        this.alt = alt;
        this.description = description;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getAlt() {
        return alt;
    }

    public void setAlt(String alt) {
        this.alt = alt;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    public Category getCategoryByCID(){
        CategoryDAO cate = new CategoryDAO();
        return cate.getCategoryByCID(this.cid);
    }
}
