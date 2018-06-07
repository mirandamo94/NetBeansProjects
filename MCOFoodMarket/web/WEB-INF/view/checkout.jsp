<%-- 
    Document   : checkout
    Created on : Jun 6, 2018, 5:53:00 PM
    Author     : mirandamo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
            <style>
        #checkoutTable {
    width: 405px;
    padding: 10px;
    background-color: #ebc5cf;
    float: left;
    border-radius: 4px;
}

#checkoutTable td {
    vertical-align: top;
    text-align: right;
    margin: 5px;
}

.inputField { width: 190px }

#infoBox { padding: 10px 25px 0 460px }

#priceBox {
    padding: 10px;
    border: 1px solid #ebc5cf;
    background-color: #ebc5cf;
    border-radius: 4px;
}

#priceBox td {
    text-align: right;
    padding: 5px;
}

.checkoutPriceColumn {
    width: 80px;
    font-weight: bold;
}

.total { border-top: 1px solid #444 }

.indent { margin-left: 6em }
</style>
    </head>
    <body>
        <div id="singleColumn">

    <h2>Checkout</h2>

    <p>Thank you for your interest in MCO Food Market, please fill out the information below:</p>

    <form action="purchase" method="post">
        <table id="checkoutTable">
            <tr>
                <td><label for="name">Name: </label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="name"
                           name="name"
                           value="${param.name}">
                </td>
            </tr>
            <tr>
                <td><label for="email">E-mail: </label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="email"
                           name="email"
                           value="${param.email}">
                </td>
            </tr>
            <tr>
                <td><label for="phone">Phone: </label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="16"
                           id="phone"
                           name="phone"
                           value="${param.phone}">
                </td>
            </tr>
            <tr>
                <td><label for="address">Address: </label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="address"
                           name="address"
                           value="${param.address}">

                    <br>
                    US Location: 
                    <select name="location">
                      <c:forEach begin="1" end="10" var="locationNumber">
                        <option value="${regionNumber}"
                                <c:if test="${param.location eq locationNumber}">selected</c:if>>${locationNumber}</option>
                      </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="creditcard">credit card number:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="19"
                           id="creditcard"
                           name="creditcard"
                           value="${param.creditcard}">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Submit Purchase">
                </td>
            </tr>
        </table>
    </form>

    <div id="infoBox">

        <ul>
            <li>To ensure the quality of our meals, a 2-hour delivery is guaranteed</li>
            <li>A &#036; ${initParam.deliverySurcharge}
                flat-rate delivery fee is applied to all purchase orders</li>
        </ul>

        <table id="priceBox">
            <tr>
                <td>Subtotal:</td>
                <td class="checkoutPriceColumn">
                    &#036; ${cart.subtotal}</td>
            </tr>
            <tr>
                <td>Delivery Fee:</td>
                <td class="checkoutPriceColumn">
                    &#036; ${initParam.deliverySurcharge}</td>
            </tr>
            <tr>
                <td class="total">Total:</td>
                <td class="total checkoutPriceColumn">
                    &#036; ${cart.totalAmount}</td>
            </tr>
        </table>
    </div>
</div>
    </body>
</html>
