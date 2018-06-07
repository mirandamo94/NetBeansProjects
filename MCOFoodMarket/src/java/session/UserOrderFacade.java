/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entity.UserOrder;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author mirandamo
 */
@Stateless
public class UserOrderFacade extends AbstractFacade<UserOrder> {

    @PersistenceContext(unitName = "MCOFoodMarketPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UserOrderFacade() {
        super(UserOrder.class);
    }
    
    @Override
    public UserOrder find(Object id) {
        UserOrder order = em.find(UserOrder.class, id);
        em.refresh(order);
        return order;
    }
    
}
