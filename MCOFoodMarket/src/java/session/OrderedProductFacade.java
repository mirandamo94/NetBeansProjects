/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entity.OrderedProduct;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author mirandamo
 */
@Stateless
public class OrderedProductFacade extends AbstractFacade<OrderedProduct> {

    static List<OrderedProduct> findByOrderId(int orderId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @PersistenceContext(unitName = "MCOFoodMarketPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public OrderedProductFacade() {
        super(OrderedProduct.class);
    }
//    
//    public List<OrderedProduct> findByOrderId(Object id) {
//        return em.createNamedQuery("OrderedProduct.findByUserOrderId").setParameter("userOrderId", id).getResultList();
//    }
    
}
