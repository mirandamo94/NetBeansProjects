/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppingCart;

import entity.Product;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mirandamo
 */
public class ShoppingCart {

    List<ShoppingCartItems> items;
    int itemNum;
    double totalAmount;

    public ShoppingCart() {
        items = new ArrayList<ShoppingCartItems>();
        itemNum = 0;
        totalAmount = 0;
    }

 
    public synchronized void addItem(Product product) {

        boolean newItem = true;

        for (ShoppingCartItems scItem : items) {

            if (scItem.getProduct().getId() == product.getId()) {

                newItem = false;
                scItem.incrementQuantity();
            }
        }

        if (newItem) {
            ShoppingCartItems scItem = new ShoppingCartItems(product);
            items.add(scItem);
        }
    }

 
    public synchronized void update(Product product, String quantity) {

        short qty = -1;

        // cast quantity as short
        qty = Short.parseShort(quantity);

        if (qty >= 0) {

            ShoppingCartItems item = null;

            for (ShoppingCartItems scItem : items) {

                if (scItem.getProduct().getId() == product.getId()) {

                    if (qty != 0) {
                        // set item quantity to new value
                        scItem.setQuantity(qty);
                    } else {
                        // if quantity equals 0, save item and break
                        item = scItem;
                        break;
                    }
                }
            }

            if (item != null) {
                
                items.remove(item);
            }
        }
    }

   
    public synchronized List<ShoppingCartItems> getItems() {

        return items;
    }


    public synchronized int getitemNum() {

        itemNum = 0;

        for (ShoppingCartItems scItem : items) {

            itemNum += scItem.getQuantity();
        }

        return itemNum;
    }

   
    public synchronized double gettotalAmount() {

        double amount = 0;

        for (ShoppingCartItems scItem : items) {

            Product product = (Product) scItem.getProduct();
            amount += (scItem.getQuantity() * product.getPrice().doubleValue());
        }

        return amount;
    }

   
   
    public synchronized void clear() {
        items.clear();
        itemNum = 0;
        totalAmount = 0;
    }

}
