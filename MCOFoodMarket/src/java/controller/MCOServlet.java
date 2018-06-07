/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Cuisine;
import entity.Product;
import java.io.IOException;
import java.util.Collection;
import javax.ejb.EJB;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import session.CuisineFacade;
import session.ProductFacade;
import cart.ShoppingCart;
import java.util.Map;
//import session.OrderManager;

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
    //@EJB
    //private OrderManager orderManager;
    @EJB
    private ProductFacade productFacade;
    @EJB
    private CuisineFacade cuisineFacade;
    private String surcharge;
    @Override
    public void init(ServletConfig servletConfig) throws ServletException{
        super.init(servletConfig);
        getServletContext().setAttribute("cuisines", cuisineFacade.findAll());
        surcharge = servletConfig.getServletContext().getInitParameter("deliverySurcharge");
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
            cart.calculateTotal(surcharge);
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
            if (cart == null) {

                cart = new ShoppingCart();
                session.setAttribute("cart", cart);
            }
            String productId = request.getParameter("productId");

            if (!productId.isEmpty()) {

                Product product = productFacade.find(Integer.parseInt(productId));
                cart.addItem(product);
            }
             userPath = "/cuisine";
            
        // if updateCart action is called
        } else if (userPath.equals("/updateCart")) {
            // TODO: Implement update cart action
            String productId = request.getParameter("productId");
            String quantity = request.getParameter("quantity");

            //boolean invalidEntry = validator.validateQuantity(productId, quantity);

            //if (!invalidEntry) {

            Product product = productFacade.find(Integer.parseInt(productId));
            cart.update(product, quantity);
            //}

            userPath = "/cart";

        // if purchase action is called
        } else if (userPath.equals("/purchase")) {
            
             
             if (cart != null) {
                //make sure user's cart is not empty before requesting an order and user information
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");
                String location = request.getParameter("location");
                String cc = request.getParameter("creditCardNum");
                
                
             //  int orderId = orderManager.placeOrder(name,email,phone,address,location,cc,cart);
                
               // if (orderId !=0){
               //     cart = null;
              //      Map orderMap = orderManager.getOrderDetails(orderId);
//                    request.setAttribute("user",orderMap.get("user"));
//                    request.setAttribute("products",orderMap.get("products"));
//                    request.setAttribute("orderedProducts",orderMap.get("orderedProducts"));
//                    request.setAttribute("orderRecord",orderMap.get("orderRecord"));
                     userPath = "/confirmation";
//                }
             //  else{
              //       userPath = "/checkout";
              //  }
            }

           
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