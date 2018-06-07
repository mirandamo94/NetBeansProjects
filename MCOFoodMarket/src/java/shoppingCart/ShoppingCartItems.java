/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppingCart;

import entity.Product;

/**
 *
 * @author mirandamo
 */
public class ShoppingCartItems {

    Product product;
    short quantity;

    public ShoppingCartItems(Product product) {
        this.product = product;
        quantity = 1;
    }

    public Product getProduct() {
        return product;
    }

    public short getQuantity() {
        return quantity;
    }

    public void setQuantity(short quantity) {
        this.quantity = quantity;
    }

    public void incrementQuantity() {
        quantity++;
    }

    public void decrementQuantity() {
        quantity--;
    }

    public double getTotal() {
        double amount = (this.getQuantity() * product.getPrice().doubleValue());
        return amount;
    }

}