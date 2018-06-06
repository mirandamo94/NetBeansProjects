/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppingCart;
import Entity.Product;
import java.util.*;
/**
 *
 * @author mirandamo
 */
public class MyCart {
    
    double totalAmount;
    int itemNum;
    List<MyCartItems> items;
    //creates a new profile of cart, setting things up.
    public MyCart(){
        totalAmount = 0;
        itemNum = 0;
        items = new ArrayList<MyCartItems>();
        
    }
    public sychronized void clearCart(){
        
        totalAmount = 0;
        items.clear();
        itemNum = 0;
    }
    
    public synchronized List<MyCartItems> getItems(){
        return items;
    }
    
    public sychronized void updateItem(String quantity, Product product){
        short q = Short.parseShort(quantity);
        if (q >= 0){
            MyCartItems item = null;
            for (MyCartItems i: items){
                if (i.getProduct().getId() == product.getId()){
                    if(q !=0){
                        i.setQuan(q);
                    }
                    else{
                        item = i;
                        break;
                    }
                }
            }
            if (item != null){
            items.remove(item);
        }
        
        
        }
    }
    public synchronized int getItemNum(){
        itemNum =0;
        for (MyCartItems i: items){
            itemNum += i.getQuan();
        }
        return itemNum;
    }
    
    public sychronized void addItem(Product product){
        boolean newI = true;
        for (MyCartItems i: items){
            if(i.getProduct().getId()==product.getId()){
                newI = false;
                i.addQuan();
            }
            }
        //if new item statement is true, creating new item to add to cart
        if(newI){
        MyCartItems i= new MyCartItems(product);
        items.add(i);
        }
    }
    
    public synchronized double getTotalAmount(){
        double total = 0;
        for (MyCartItems i: items){
            Product product = (Product) i.getProduct();
            total += ((product.getPrice().doubleValue()) * i.getQuan());
        }
        
        return total;
    }
}
