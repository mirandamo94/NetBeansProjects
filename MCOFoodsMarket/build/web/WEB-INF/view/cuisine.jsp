<%-- 
    Document   : cuisine
    Created on : May 5, 2018, 7:19:08 PM
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
    
    .lightPink { background-color: #ead5df }
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
    
#cuisineLeftColumn {
    width: 300px;
    float: left;
    margin-top: 25px;
    padding-left: 15px;
}

#cuisineRightColumn {
    margin-top: 10px;
    width: 900px;
    float: left;
}

.cuisineButton {
    margin: 30px 50px;
    padding: 20px;
    display: block;
    background-color: #ebc5cf;
    border-radius: 4px;
}

#selectedcuisine {
    background-color: #b3d2d2;
    margin-left: 10px;
    width: 139px;
}

#cuisineTitle {
    margin-top: -40px;
    right: 385px;
    font-size: x-large;
    position: absolute;
    background-color: #f5eabe;
    padding: 7px;
    border-radius: 4px;
}

.cuisineText {
    line-height: 25px;
    font-size: x-large;
}

#productTable {
    width: 900px;

  
    position: relative;
    z-index: 1;
}

#productTable tr { height: 90px }

#productTable td { width: 145px }
    </style>
</head>
<body> 
   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="categories" dataSource="jdbc/mcofoodsmarket">
    SELECT * FROM cuisine
</sql:query>

<sql:query var="selectedcuisine" dataSource="jdbc/mcofoodsmarket">
    SELECT name FROM cuisine WHERE id = ?
    <sql:param value="${pageContext.request.queryString}"/>
</sql:query>

<sql:query var="cuisineProducts" dataSource="jdbc/mcofoodsmarket">
    SELECT * FROM product WHERE cuisine_id = ?
    <sql:param value="${pageContext.request.queryString}"/>
</sql:query>

            <div id="cuisineLeftColumn">

                <c:forEach var="cuisine" items="${categories.rows}">
                    <c:choose>
                        <c:when test="${cuisine.id == pageContext.request.queryString}">
                            <div class="cuisineButton" id="selectedcuisine">
                                <span class="cuisineText">
                                    ${cuisine.name}
                                </span>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <a href="cuisine?${cuisine.id}" class="cuisineButton">
                                <span class="cuisineText">
                                    ${cuisine.name}
                                </span>
                            </a>
                        </c:otherwise>
                    </c:choose>

                </c:forEach>

            </div>

            <div id="cuisineRightColumn">

                <p id="cuisineTitle">${selectedcuisine.rows[0].name}</p>

                <table id="productTable">

                    <c:forEach var="product" items="${cuisineProducts.rows}" varStatus="iter">

                        <tr class="${((iter.index % 2) == 0) ? 'lightPink' : 'white'}">
                            <td>
                                <img src="mcoFoodsMarket/${product.name}.jpg"
                                    width="130" 
                                    height="130"/>
                            </td>
                            <td>
                                ${product.name}
                                <br>
                                <span class="smallText">${product.description}</span>
                            </td>
                            <td>
                                &#36; ${product.price} / serving
                            </td>
                            <td>
                                <form action="<c:url value='addToCart'/>" method="post">
                                    <input type="hidden"
                                           name="productId"
                                           value="${product.id}">
                                    <input type="submit"
                                           name="submit"
                                           value="<fmt:message key='addToCart'/>"/>
                                           
                                </form>
                            </td>
                        </tr>

                    </c:forEach>

                </table>
            </div>
</html>
