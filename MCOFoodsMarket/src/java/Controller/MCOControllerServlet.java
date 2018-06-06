/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Cuisine;
import Entity.Product;
import Session.CuisineFacade;
import Session.ProductFacade;
import java.io.IOException;
import java.util.Collection;
import javax.ejb.EJB;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import shoppingCart.MyCart;

/**
 *
 * @author mirandamo
 */
@WebServlet(name = "MCOControllerServlet", 
        loadOnStartup=1, 
        urlPatterns = {
    "/cuisine", 
    "/addToCart", 
    "/viewCart",
    "/updateCart",
    "/checkout",
    "/purchase"})

public class MCOControllerServlet extends HttpServlet {

    @EJB
    private CuisineFacade cuisineFacade;
    @EJB
    private ProductFacade productFacade;
    
    @Override
    public void init(ServletConfig config) throws ServletException{
        super.init(config);
    //this helps to store a list of cuisines in servlet 
    getServletContext().setAttribute("cuisines", cuisineFacade.findAll());
    
    }
    /**
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String userPath = request.getServletPath();
        HttpSession session = request.getSession();
        
        // if cuisine page is requested
        if (userPath.equals("/cuisine")) {
            // TODO: Implement cuisine request
            String cuisineID = request.getQueryString();
            if (cuisineID !=null){
                
              Cuisine selectedCuisine = cuisineFacade.find(Short.parseShort(cuisineID));
              request.setAttribute("selectedCuisine", selectedCuisine);
              Collection<Product> cuisineProducts = selectedCuisine.getProductCollection();
              request.setAttribute("cuisineProducts", cuisineProducts);
            }

        // if cart page is requested
        } else if (userPath.equals("/viewCart")) {
            // TODO: Implement cart page request
            String clean = request.getParameter("clear");
            if((clean !=null) && clean.equals("true")){
                MyCart mycart = (MyCart) session.getAttribute("cart");
                mycart.clearMyCart();
            }
            userPath = "/cart";

        // if checkout page is requested
        } else if (userPath.equals("/checkout")) {
            // TODO: Implement checkout page request
            MyCart mycart = (MyCart) session.getAttribute("cart");
            mycart.getTotalAmount();

        
        } 

        // use RequestDispatcher to forward request internally
        String url = "/WEB-INF/view" + userPath + ".jsp";

        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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

        String userPath = request.getServletPath();
        HttpSession s = request.getSession();
        MyCart mycart = (MyCart) s.getAttribute("cart");
        

        // if addToCart action is called
        if (userPath.equals("/addToCart")) {
            // TODO: Implement add product to cart action
            if(mycart ==null){
                mycart = new MyCart();
                s.setAttribute("cart", mycart);
            }
            
            String productID = request.getParameter("ProductId");
            if(!productID.isEmpty()){
                Product product = productFacade.find(Integer.parseInt(productID));
                mycart.addItem(product);
            }
            
            userPath = "/cuisine";

        // if updateCart action is called
        } else if (userPath.equals("/updateCart")) {
            // TODO: Implement update cart action
            String productID = request.getParameter("productId");
            String quan = request.getParameter("quantity");
            
            userPath = "/cart";
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
