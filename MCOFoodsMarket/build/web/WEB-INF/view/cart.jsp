<%-- 
    Document   : mycart
    Created on : May 20, 2018, 7:18:09 PM
    Author     : mirandamo
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix= "fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <style>
          body {
        font-family: Arial, Helvetica, sans-serif;
        width: 1500px;
        text-align: center;
        margin: 20px auto;
        color: #2f4f4f;
        }
        hr {
            border: 0;
            background-color: #333;
            height: 1px;
        }
        table {
            margin: 0 20px;
            border-spacing: 0;
            text-align: center;
            border: solid 1px #f5eabe;
        }
        a {
            color: inherit;
            text-decoration: underline;
        }
        a:hover { text-decoration: none }
        a:visited { color: inherit }
        img { border: none }
        input, select { margin: 5px }
        li { margin: 10px 0 }
        label { line-height: 30px }
        label.error {
            font-size: smaller;
            line-height: 20px;
            font-style: italic;
        }
        
    #main { background: #ffffff }
    
    #singleColumn {
        margin: 20px 30px;
        text-align: left;
    }
    .lightPink { background-color: #ebc5cf }
    .white { background-color: #ffffff }
    .bubble {
        font-weight: bold;
        background-color: #f5eabe;
        padding: 5px;
        color: inherit;
        display: inline;
        border-radius: 4px;
    }
    .hMargin { margin: 0 30px }
    .smallText { font-size: small }
    .reallySmallText { font-size: xx-small }
    .header {
        background-color: #ffffff;
        height: 30px;
    }
    .error {
        color: #c00;
        font-style: italic;
    }
    .tableHeading {
        font-weight: bold;
        background-color: #edf8f7;
    }
        body {
    font-family: Arial, Helvetica, sans-serif;
    width: 1300px;
    text-align: center;
    margin: 20px auto;
}
#main { background: #ebc5cf }

#singleColumn {
    margin: 20px 30px;
    text-align: left;
}

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
    <c:set var='view' value='/cart' scope = 'session'/>
    <div id="singleColumn">

    <c:choose>
        <c:when test="${cart.itemNum > 1}">
            <p>Your Cart Contains ${cart.itemNum} items </p>
        </c:when>
        <c:when test="${cart.itemNum == 1}">
            <p>Your Cart Contains ${cart.itemNum} item </p>
        </c:when>
        <c:otherwise>
            <p>Your Cart is currently empty</p>
        </c:otherwise>
    </c:choose>

    <div id="actionBar">
        
        <c:if test="${!empty cart && cart.itemNum != 0}">

            <c:url var="url" value="viewCart">
                <c:param name="clear" value="true"/>
            </c:url>

            <a href="${url}" class="bubble hMargin">cart is empty</a>
        </c:if>

        <%-- continue shopping  --%>
        <c:set var="value">
            <c:choose>
                <c:when test="${!empty selectedcuisine}">
                    cuisine
                </c:when>
                
                <c:otherwise>
                    index.jsp
                </c:otherwise>
            </c:choose>
        </c:set>

        <c:url var="url" value="${value}"/>
        <a href="${url}" class="bubble hMargin">continue shopping</a>

        
        <c:if test="${!empty cart && cart.itemNum != 0}">
            <a href="<c:url value='checkout'/>" class="bubble hMargin">
                proceed to checkout </a>
        </c:if>
    </div>

    <c:if test="${!empty cart && cart.itemNum != 0}">

      <h4 id="totalAmount">Total Amount: $"${cart.totalAmount}"/>
      </h4>

      <table id="cartTable">

        <tr class="header">
            <th><fmt:message key="product"/></th>
            <th><fmt:message key="name"/></th>
            <th><fmt:message key="price"/></th>
            <th><fmt:message key="quantity"/></th>
        </tr>

        <c:forEach var="cartItem" items="${cart.items}" varStatus="iter">

          <c:set var="product" value="${cartItem.product}"/>

          <tr class="${((iter.index % 2) == 0) ? 'lightPink' : 'white'}">
            <td>
                <img src="mcoFoodsMarket/${product.name}.jpg"
                     alt="${product.name}/">
            </td>

            <td>"${product.name}"</td>

            <td>
                <fmt:formatNumber type="currency" currencySymbol="&#036; " value="${cartItem.totalAmount}"/>
                <br>
                <span class="smallText">(
                    <fmt:formatNumber type="currency" currencySymbol="&#036; " value="${product.price}"/>
                    / <fmt:message key="unit"/> )</span>
            </td>

            <td>
                <form action="<c:url value='updateCart'/>" method="post">
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
                           value="<fmt:message key='update'/>">
                </form>
            </td>
          </tr>

        </c:forEach>

      </table>

    </c:if>
</div>
</body>
</html>
