/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Cuisine;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import javax.ejb.EJB;
import javax.faces.validator.Validator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.jboss.weld.context.http.Http;
import session.CuisineFacade;
import shoppingCart.ShoppingCart;

/**
 *
 * @author mirandamo
 */

@WebServlet(name="ControllerServlet",
            loadOnStartup = 1,
            urlPatterns = {"/cuisine",
                           "/addToCart",
                           "/viewCart",
                           "/updateCart",
                           "/checkout",
                           "/purchase"})

public class MCOServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @EJB
    private CuisineFacade cuisineFacade;
    
    @Override
    public void init() throws ServletException{
        
        getServletContext().setAttribute("cuisines", cuisineFacade.findAll());
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String userPath = request.getServletPath();
        
        // if ccuisine page is requested
        if (userPath.equals("/cuisine")) {
            // TODO: Implement category request
            String cuisineId = request.getQueryString();
            if(cuisineId != null){
                Cuisine selectedCuisine = cuisineFacade.find(Short.parseShort(cuisineId));
                request.setAttribute("selectedCuisine", selectedCuisine);
                Collection<Product> cuisineProducts = selectedCuisine.getProductCollection();
                request.setAttribute("cuisineProducts", cuisineProducts);
            }
        // if cart page is requested
        } else if (userPath.equals("/viewCart")) {
            // TODO: Implement cart page request
            String clear = request.getParameter("clear");
            if ((clear != null) && clear.equals("true")) {
                ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
                cart.clear();
            }
            userPath = "/cart";
           

        // if checkout page is requested
        } else if (userPath.equals("/checkout")) {

            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");

            
            cart.gettotalAmount();
} 
        // use RequestDispatcher to forward request internally
        String url = "/WEB-INF/view" + userPath + ".jsp";

        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart"); 
        //Validator validator = new Validator();
        String userPath = request.getServletPath();

        // if addToCart action is called
        if (userPath.equals("/addToCart")) {
            // TODO: Implement add product to cart action

        // if updateCart action is called
        } else if (userPath.equals("/updateCart")) {
            // TODO: Implement update cart action

        // if purchase action is called
        } else if (userPath.equals("/purchase")) {
            // TODO: Implement purchase action

            userPath = "/confirmation";
        }

        // use RequestDispatcher to forward request internally
        String url = "/WEB-INF/view" + userPath + ".jsp";

        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}