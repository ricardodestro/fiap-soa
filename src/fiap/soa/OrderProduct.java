/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fiap.soa;

/**
 *
 * @author destro
 */
public class OrderProduct {

    private final int id;
    private final String name;
    private final int discount;
    private final double price;
    
    private double finalPrice;

    private int quantity;

    public OrderProduct(int id, String name, int quantity, int discount, double price) {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.discount = discount;
        this.price = price;
        this.finalPrice = (price - (price * (discount / 100))) * quantity;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getDiscount() {
        return discount;
    }

    public double getPrice() {
        return price;
    }

    public double getFinalPrice() {
        return finalPrice;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
        this.finalPrice = (price - (price * (discount / 100))) * quantity;
    }
}
