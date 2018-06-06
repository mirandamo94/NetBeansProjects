package Session;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Entity.OrderedProduct;
import Entity.OrderedProductPK;
import Entity.Product;
import Entity.User;
import Entity.UserOrder;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.ejb.SessionContext;
import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import shoppingCart.MyCart;
import shoppingCart.MyCartItems;

/**
 *
 * @author mirandamo
 */
@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class OrderManager {
    
    @EJB
    private ProductFacade productFacade;
    @EJB
    private UserOrderFacade userOrderFacade;
    @EJB
    private OrderedProductFacade orderedProductFacade;
    
    @Resource
    private SessionContext context;
    @PersistenceContext(unitName = "MCOFoodsMarketPU")
    private EntityManager em;
    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    
    public int placeOrder(String name, String email, String phone, String address, String location, String cc, MyCart cart) {
        try{
        User user = addUser(name,email,phone,address,location,cc);
        UserOrder order = addOrder(user, cart);
        addOrderedItems(order, cart);
        return order.getId();
        } catch (Exception ex){
        context.setRollbackOnly();
        return 0;}
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    private  User addUser(String name, String email, String phone, String address, String location, String cc) {
        
        User u = new User();
        u.setName(name);
        u.setEmail(email);
        u.setPhone(phone);
        u.setAddress(address);
        u.setLocation(location);
        u.setCreditCardNum(cc);
        em.persist(u);
        
        return u;
    }
    private void addOrderedItems(UserOrder order, MyCart cart){
        em.flush();
        List<MyCartItems> items = cart.getItems();
        for(MyCartItems i: items){
            int productID = i.getProduct().getId();
            
            OrderedProductPK oppk = new OrderedProductPK();
            oppk.setUserOrderId(order.getId());
            oppk.setProductId(productID);
            OrderedProduct o = new OrderedProduct(oppk);
            o.setQuantity(i.getQuan());
            em.persist(o);
        }
    }
            
    private UserOrder addOrder(User u, MyCart cart) {
        
        UserOrder order = new UserOrder();
        order.setUser(u);
        order.setAmount(BigDecimal.valueOf(cart.getTotalAmount()));
        Random randomNum = new Random();
        int orderNum = randomNum.nextInt(999999999);
        order.setConfirmationNumber(orderNum);
        return order;
    }
    
    public Map getOrderDetails(int orderId){
        Map map = new HashMap();
        UserOrder o;
        o = userOrderFacade.find(orderId);
        User u = o.getUser();
        List<OrderedProduct> ordered = OrderedProductFacade.findByOrderId(orderId);
        List<Product> p = new ArrayList<Product>();
        for (OrderedProduct op: ordered){
            Product pro;
            pro = (Product) productFacade.find(op.getOrderedProductPK().getProductId());
            p.add(pro);
        
        }
        map.put("orderRecord", o);
        map.put("user", u);
        map.put("products", p);
        map.put("orderedProducts", ordered);
        return map;
    }
}
