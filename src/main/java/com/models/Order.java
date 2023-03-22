/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.models;

import java.sql.Timestamp;

/**
 *
 * @author DELL
 */

//java.util.Date date = new Date();
//Object param = new java.sql.Timestamp(date.getTime());
//// The JDBC driver knows what to do with a java.sql type:
//preparedStatement.setObject(param); 

public class Order {
    private int o_id;
    private int oi_id;
    private int b_id;
    private Timestamp o_time_start;
    private Timestamp o_time_end;
    private String o_status;
    private int o_product_price;
    private int o_time_price;
    private int o_totalprice;

    public Order() {
    }

    public Order(int o_id, int oi_id, int b_id, Timestamp o_time_start, Timestamp o_time_end, String o_status, int o_product_price, int o_time_price, int o_totalprice) {
        this.o_id = o_id;
        this.oi_id = oi_id;
        this.b_id = b_id;
        this.o_time_start = o_time_start;
        this.o_time_end = o_time_end;
        this.o_status = o_status;
        this.o_product_price = o_product_price;
        this.o_time_price = o_time_price;
        this.o_totalprice = o_totalprice;
    }

    public Order(int oi_id, int b_id) {
        this.oi_id = oi_id;
        this.b_id = b_id;
        this.o_status = "no";
    }
   
    public int getO_id() {
        return o_id;
    }

    public void setO_id(int o_id) {
        this.o_id = o_id;
    }

    public int getOi_id() {
        return oi_id;
    }

    public void setOi_id(int oi_id) {
        this.oi_id = oi_id;
    }

    public int getB_id() {
        return b_id;
    }

    public void setB_id(int b_id) {
        this.b_id = b_id;
    }

    public Timestamp getO_time_start() {
        return o_time_start;
    }

    public void setO_time_start(Timestamp o_time_start) {
        this.o_time_start = o_time_start;
    }

    public Timestamp getO_time_end() {
        return o_time_end;
    }

    public void setO_time_end(Timestamp o_time_end) {
        this.o_time_end = o_time_end;
    }

    public String getO_status() {
        return o_status;
    }

    public void setO_status(Boolean o_status) {
        if (o_status == true) {
            this.o_status = "yes";
        } else {
            this.o_status = "no";
        }
    }

    public int getO_product_price() {
        return o_product_price;
    }

    public void setO_product_price(int o_product_price) {
        this.o_product_price = o_product_price;
    }

    public int getO_time_price() {
        return o_time_price;
    }

    public void setO_time_price(int o_time_price) {
        this.o_time_price = o_time_price;
    }

    public int getO_totalprice() {
        return o_totalprice;
    }

    public void setO_totalprice(int o_totalprice) {
        this.o_totalprice = o_totalprice;
    }
    
    

}
