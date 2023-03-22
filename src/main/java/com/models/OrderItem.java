/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.models;

/**
 *
 * @author DELL
 */
public class OrderItem {
    private int oi_general_id;
    private int oi_id;
    private int p_id;
    private int oi_quantity;
    private int oi_price;

    public OrderItem() {
    }

    public OrderItem(int oi_general_id, int oi_id, int p_id, int oi_quantity, int oi_price) {
        this.oi_general_id = oi_general_id;
        this.oi_id = oi_id;
        this.p_id = p_id;
        this.oi_quantity = oi_quantity;
        this.oi_price = oi_price;
    }
    
    public OrderItem(int oi_id, int p_id, int oi_quantity, int oi_price) {
        this.oi_id = oi_id;
        this.p_id = p_id;
        this.oi_quantity = oi_quantity;
        this.oi_price = oi_price;
    }

    public int getOi_general_id() {
        return oi_general_id;
    }

    public void setOi_general_id(int oi_general_id) {
        this.oi_general_id = oi_general_id;
    }
    
    public int getOi_id() {
        return oi_id;
    }

    public void setOi_id(int oi_id) {
        this.oi_id = oi_id;
    }

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public int getOi_quantity() {
        return oi_quantity;
    }

    public void setOi_quantity(int oi_quantity) {
        this.oi_quantity = oi_quantity;
    }

    public int getOi_price() {
        return oi_price;
    }

    public void setOi_price(int oi_price) {
        this.oi_price = oi_price;
    }
    
}
