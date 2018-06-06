/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppingCart;

import Entity.Product;
import java.math.BigDecimal;

/**
 *
 * @author mirandamo
 */
class MyCartItems {
    
    Product product;
    short q;

    MyCartItems(Product product) {
       //To change body of generated methods, choose Tools | Templates.
       q =1; //automatic 
       this.product = product;
    }

    Object getProduct() {
        //To change body of generated methods, choose Tools | Templates.
        return product;
    }

    public void setQuan(short q) {
         //To change body of generated methods, choose Tools | Templates.
         this.q = q;
    }

    public void addQuan() {
        //To change body of generated methods, choose Tools | Templates.
        q++;
    }
    
    public void minusQuan(){
        q--;
    }

    public short getQuan() {
        //To change body of generated methods, choose Tools | Templates.
        return q;
    }
    
    public double getTotalAmount(){
        double total = (this.getQuan() * product.getPrice().doubleValue());
        return total;
    }
    
}
