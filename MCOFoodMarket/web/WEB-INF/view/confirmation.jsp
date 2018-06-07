

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
             #main { background: #ffffff }

            .lightPink { background-color: #ead5df }
            .white { background-color: #ffffff }

            #confirmationText {
                margin: 0 20px 20px;
                padding: 10px;
                background-color: #f5eabe;
                float: left;
                border-radius: 4px;
            }

            .summaryColumn {
                margin-top: 15px;
                width: 50%;
                float: left;
            }

            .detailsTable { text-align: left }

            .detailsTable th { padding: 5px 10px }

            .detailsTable td {
                padding: 5px 10px 5px 20px;
                font-size: small;
                font-family: "Courier New", courier, monospace;
            }

            #orderSummaryTable { width: 100% }

            #deliveryAddressTable {
                width: 70%;
                margin-left: 15%;
            }

            #deliveryAddressTable td {
                padding-top: 10px;
                padding-bottom: 10px;
            }

            .quantityColumn {
                text-align: center;
                width: 62px;
            }

            .confirmationPriceColumn {
                width: 90px;
                font-weight: normal;
            }

            #deliverySurchargeCellLeft {
                text-align: right;
                padding: 0;
            }

            #deliverySurchargeCellRight { padding: 0 20px }

            #totalCellLeft {
                text-align: right;
                padding: 0;
            }

            #totalCellRight { padding: 0 20px }

            #dateProcessedRow { padding: 2px 0 10px 20px }
            
            
            
        </style>
    </head>
    <body>
        <center>
        <div id="singleColumn">

     <center><p id="confirmationText">
        <strong>Hello ${user.name}, Success! 
            Your order is complete and will be delivered within 2 hours.</strong>
        <br><br>
        Order Confirmation : 
        <strong>CONFIRMED</strong>
        <br>
        feel free to <a href="#">contact us</a> if you have any questions.
        <br><br>
        NOW GET READY TO EAT!
    </p></center>

    <%-- <div class="summaryColumn" >

        <table id="orderSummaryTable" class="detailsTable">
            <tr class="header">
                <th colspan="3">Your Order Summary</th>
            </tr>

            <tr class="tableHeading">
                <td>product</td>
                <td>quantity</td>
                <td>price</td>
            </tr>

            <c:forEach var="orderedProduct" items="${orderedProducts}" varStatus="iter">

                <tr class="${((iter.index % 2) != 0) ? 'lightPink' : 'white'}">
                    <td>${products[iter.index].name}</td>
                    <td class="quantityColumn">
                        ${orderedProduct.quantity}
                    </td>
                    <td class="confirmationPriceColumn">
                        &#036; ${products[iter.index].price * orderedProduct.quantity}
                    </td>
                </tr>

            </c:forEach>

            <tr class="lightPink"><td colspan="3" style="padding: 0 20px"><hr></td></tr>

            <tr class="lightPink">
                <td colspan="2" id="deliverySurchargeCellLeft"><strong>delivery surcharge:</strong></td>
                <td id="deliverySurchargeCellRight">&#036; ${initParam.deliverySurcharge}</td>
            </tr>

            <tr class="lightPink">
                <td colspan="2" id="totalCellLeft"><strong>total:</strong></td>
                <td id="totalCellRight">&#036; ${orderRecord.amount}</td>
            </tr>

            <tr class="lightPink"><td colspan="3" style="padding: 0 20px"><hr></td></tr>

            <tr class="lightPink">
                <td colspan="3" id="dateProcessedRow"><strong>date processed:</strong>
                    ${orderRecord.dateCreated}
                </td>
            </tr>
        </table>

    </div>

    <div class="summaryColumn" >

        <table id="deliveryAddressTable" class="detailsTable">
            <tr class="header">
                <th colspan="3">delivery address</th>
            </tr>

            <tr>
                <td colspan="3" class="lightPink">
                    ${user.name}
                    <br>
                    ${user.address}
                    <br>
                    US ${user.location}
                    <br>
                    <hr>
                    <strong>email:</strong> ${user.email}
                    <br>
                    <strong>phone:</strong> ${user.phone}
                </td>
            </tr>
        </table>

    </div>
</div>--%>
                </center>
    </body>
    
</html>
