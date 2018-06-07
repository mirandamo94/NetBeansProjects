
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            #actionBar {
                margin: 30px;
                width: 750px;
                text-align: center;
            }

            #subtotal { margin: 40px 0 20px 430px }

            #cartTable { width: 750px }

            #cartTable td {
                width: 145px;
                height: 90px;
            }
      
        </style>
    </head>
    <body>
     <center>
    <div id="singleColumn">

    <c:choose>
        <c:when test="${cart.itemNum > 1}">
            <p>Shopping Cart Has ${cart.itemNum} Items </p>
        </c:when>
        <c:when test="${cart.itemNum == 1}">
            <p>Shopping Cart Has 1 Item </p>
        </c:when>
        <c:otherwise>
            <p>Shopping Cart is Empty</p>
        </c:otherwise>
    </c:choose>

    <div id="actionBar">
        <%-- clear cart widget --%>
        <c:if test="${!empty cart && cart.itemNum != 0}">

           <%--  <c:url var="url" value="viewCart">
                <c:param name="clear" value="true"/>
            </c:url> --%>

            <a href="${url}" class="bubble hMargin">clear cart</a>
        </c:if>

        <%-- continue shopping widget --%>
        <c:set var="value">
            <c:choose>
                <%-- if 'selectedCuisine' session object exists, send user to previously viewed cuisine --%>
                <c:when test="${!empty selectedCuisine}">
                    cuisine
                </c:when>
                <%-- otherwise send user to welcome page --%>
                <c:otherwise>
                    index.jsp
                </c:otherwise>
            </c:choose>
        </c:set>

        <%-- <c:url var="url" value="${value}"/> --%>
        <a href="${url}" class="bubble hMargin">continue shopping</a>

        <%-- checkout widget --%>
        <c:if test="${!empty cart && cart.itemNum != 0}">
            <a href="checkout" class="bubble hMargin">proceed to checkout</a>
        </c:if>
    </div>

    <c:if test="${!empty cart && cart.itemNum != 0}">

      <h4 id="subtotal">subtotal: &#036; ${cart.subtotal}> </h4>

      <table id="cartTable">

        <tr class="header">
            <th>product</th>
            <th>name</th>
            <th>price</th>
            <th>quantity</th>
        </tr>

        <c:forEach var="cartItem" items="${cart.items}" varStatus="iter">

          <c:set var="product" value="${cartItem.product}"/>

          <tr class="${((iter.index % 2) == 0) ? 'lightPink' : 'white'}">
            <td>
                <center>
                <img src="mcoFoodsMarket/${product.name}.jpg"
                     alt="${product.name}" height="90" width="90">
                </center>
            </td>

            <td>${product.name}</td>

            <td>
                &#036; ${cartItem.totalAmount}
                <br>
                <span class="smallText">(&#036; ${product.price} / serving)
                </span>
            </td>

            <td>
                <form action="'updateCart" method="post">
                    <input type="hidden"
                           name="productId"
                           value="${product.id}">
                    <input type="text"
                           maxlength="2"
                           size="2"
                           value="${cartItem.quantity}"
                           name="quantity"
                           style="margin:5px">
                    <input type="submit"
                           name="submit"
                           value="update">
                </form>
            </td>
          </tr>

        </c:forEach>

      </table>

    </c:if>
</div>
    </center>
    </body>
</html>
