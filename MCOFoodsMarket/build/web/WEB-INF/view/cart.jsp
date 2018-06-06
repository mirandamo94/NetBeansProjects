<%-- 
    Document   : mycart
    Created on : Jun 1, 2018, 7:18:09 PM
    Author     : mirandamo
--%>

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
    <div id="singleColumn">

    <c:choose>
        <c:when test="${cart.numberOfItems > 1}">
            <p><fmt:message key="yourCartContains"/> ${cart.numberOfItems} <fmt:message key="items"/>.</p>
        </c:when>
        <c:when test="${cart.numberOfItems == 1}">
            <p><fmt:message key="yourCartContains"/> ${cart.numberOfItems} <fmt:message key="item"/>.</p>
        </c:when>
        <c:otherwise>
            <p><fmt:message key="yourCartEmpty"/></p>
        </c:otherwise>
    </c:choose>

    <div id="actionBar">
        <%-- clear cart widget --%>
        <c:if test="${!empty cart && cart.numberOfItems != 0}">

            <c:url var="url" value="viewCart">
                <c:param name="clear" value="true"/>
            </c:url>

            <a href="${url}" class="bubble hMargin"><fmt:message key="clearCart"/></a>
        </c:if>

        <%-- continue shopping widget --%>
        <c:set var="value">
            <c:choose>
                <%-- if 'selectedcuisine' session object exists, send user to previously viewed cuisine --%>
                <c:when test="${!empty selectedcuisine}">
                    cuisine
                </c:when>
                <%-- otherwise send user to welcome page --%>
                <c:otherwise>
                    index.jsp
                </c:otherwise>
            </c:choose>
        </c:set>

        <c:url var="url" value="${value}"/>
        <a href="${url}" class="bubble hMargin"><fmt:message key="continueShopping"/></a>

        <%-- checkout widget --%>
        <c:if test="${!empty cart && cart.numberOfItems != 0}">
            <a href="<c:url value='checkout'/>" class="bubble hMargin"><fmt:message key="proceedCheckout"/></a>
        </c:if>
    </div>

    <c:if test="${!empty cart && cart.numberOfItems != 0}">

      <h4 id="subtotal"><fmt:message key="subtotal"/>:
          <fmt:formatNumber type="currency" currencySymbol="&#036; " value="${cart.subtotal}"/>
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
                <img src="${initParam.productImagePath}${product.name}.png"
                     alt="<fmt:message key="${product.name}"/>">
            </td>

            <td><fmt:message key="${product.name}"/></td>

            <td>
                <fmt:formatNumber type="currency" currencySymbol="&#036; " value="${cartItem.total}"/>
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
