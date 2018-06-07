/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entity.Cuisine;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author mirandamo
 */
@Stateless
public class CuisineFacade extends AbstractFacade<Cuisine> {

    @PersistenceContext(unitName = "MCOFoodMarketPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CuisineFacade() {
        super(Cuisine.class);
    }
    
}
