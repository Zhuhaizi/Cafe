/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.models;

/**
 *
 * @author DELL
 */
public class Board {

    private int b_id;
    private int b_name;
    private int b_price;
    private int b_empty;

    public Board() {
    }

    public Board(int b_id, int b_name, int b_price, int b_empty) {
        this.b_id = b_id;
        this.b_name = b_name;
        this.b_price = b_price;
        this.b_empty = b_empty;
    }

    public Board(int b_name, int b_price, int b_empty) {
        this.b_name = b_name;
        this.b_price = b_price;
        this.b_empty = b_empty;
    }

    public int getB_id() {
        return b_id;
    }

    public void setB_id(int b_id) {
        this.b_id = b_id;
    }

    public int getB_name() {
        return b_name;
    }

    public void setB_name(int b_name) {
        this.b_name = b_name;
    }

    public int getB_price() {
        return b_price;
    }

    public void setB_price(int b_price) {
        this.b_price = b_price;
    }

    public int getB_empty() {
        return b_empty;
    }

    public void setB_empty(int b_empty) {
        this.b_empty = b_empty;
    }
}
