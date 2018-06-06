<%-- 
    Document   : cuisine
    Created on : Jun 5, 2018, 7:19:08 PM
    Author     : mirandamo
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>   
<html>
    

<head>
    <style>
        body {
    font-family: Arial, Helvetica, sans-serif;
    width: 1300px;
    text-align: center;
    margin: 20px auto;
}
#main { background: #ebc5cf }
#header {
    height: 250px;
    background: #ebc5cf;
}
#logo {
    height: 155px;
    width: 155px;
    float: left;
    margin-left: 40px;
    margin-top: -20px;
}
#logoText {
    float: left;
    margin: 20px 0 0 70px;
    /* font styles apply to text within alt tags */
    font-family: 'American Typewriter', Courier, monospace;
    font-size: 50px;
    color: #333;
}
#widgetBar {
    height: 50px;
    width: 1300px;
    float: right;
    background: #ccc;
}
.headerWidget {
    width: 194px;
    margin: 20px 2px;
    font-size: small;
    float: right;
    line-height: 25px;
    background: #aaa;
}
#footer {
    height: 60px;
    width: 1300px;
    clear: left;
    background: #aaa;
}
hr {
    border: 0;
    background-color: #333;
    height: 1px;
    margin: 0 25px;
    width: 300px;
}
#indexLeftColumn {
    height: 600px;
    width: 440px;
    float: left;
    background: #ffffff;
}
#indexRightColumn {
    height: 600px;
    width: 860px;
    float: right;
    background: #eee;
}
.categoryBox {
    height: 270px;
    width: 310px;
    margin: 25px 40px 10px;
    float: left;
    background: #eddee2;
}
.categoryLabelText {
    line-height: 150%;
    font-size: x-large;
}
    </style>
</head>
<body> 
    
    <sql:query var="category" dataSource="jdbc/mcofoodsmarket">
    SELECT * FROM category
    </sql:query>
    
    <sql:query var="selectedItem" dataSource="jdbc/mcofoodsmarket">
    SELECT name FROM category WHERE id = ?
    <sql:param value="${pageContext.request.queryString}"/>
    </sql:query>
    
    <sql:query var="categoryProducts" dataSource="jdbc/mcofoodsmarket">
    SELECT * FROM product WHERE category_id = ?
    <sql:param value="${pageContext.request.queryString}"/>
    </sql:query>
    
    <div id="main">
        <div id="header">
            <div id="widgetBar">

        <div class="headerWidget">
            [ language toggle ]
        </div>

        <div class="headerWidget">
            [ shopping cart widget ]
        </div>

    </div>

        <a href="#">
            <img src="#" id="logo" alt="MCO logo">
        </a>

        <img src="#" id="logoText" alt="MCO Food Market">
            </div>

        <div id="indexLeftColumn">
           <div id="welcomeText">
                <p>[ welcome text ]</p>
                
                
                <c:forEach var="cuisine" items="${cuisine.rows}">

        <c:choose>
            <c:when test="${cuisine.id == pageContext.request.queryString}">
                <div class="cuisineButton" id="selectedcuisine">
                    <span class="cuisineText">
                        ${cuisine.name}
                        
                    </span>
                        <p id="cuisineTitle">${selectedcuisine.rows[0].name}</p>
                </div>
            </c:when>
            <c:otherwise>
                <a href="cuisine?${cuisine.id}" class="cuisineButton">
                    <div class="cuisineText">
                        ${cuisine.name}
                    </div>
                </a>
            </c:otherwise>
        </c:choose>

    </c:forEach>
           </div>
        </div>

        <div id="indexRightColumn">
            <p id="cuisineTitle"><fmt:message key="${selectedcuisine.name}" /></p>

    <table id="productTable">

        <c:forEach var="product" items="${cuisineProducts}" varStatus="iter">

            <tr class="${((iter.index % 2) == 0) ? 'lightPink' : 'white'}">
                <td>
                    <img src="${initParam.productImagePath}${product.name}.png"
                         alt="<fmt:message key='${product.name}'/>">
                </td>

                <td>
                    <fmt:message key="${product.name}"/>
                    <br>
                    <span class="smallText"><fmt:message key='${product.name}Description'/></span>
                </td>

                <td><fmt:formatNumber type="currency" currencySymbol="&#36; " value="${product.price}"/></td>

                <td>
                    <form action="<c:url value='addToCart'/>" method="post">
                        <input type="hidden"
                               name="productId"
                               value="${product.id}">
                        <input type="submit"
                               name="submit"
                               value="<fmt:message key='addToCart'/>">
                    </form>
                </td>
            </tr>

        </c:forEach>

    </table>
        </div>

        <div id="footer">
            <hr>
            <p id="footerText"> MCO Foods Market 2018 </p>
        </div>
    </div>
</body>
</html>
