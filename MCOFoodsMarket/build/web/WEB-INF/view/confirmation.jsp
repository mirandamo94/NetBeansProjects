<%-- 
    Document   : confirmation
    Created on : May 20, 2018, 7:26:31 PM
    Author     : mirandamo
--%>

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
.cuisineBox {
    height: 270px;
    width: 310px;
    margin: 25px 40px 10px;
    float: left;
    background: #eddee2;
}
.cuisineLabelText {
    line-height: 150%;
    font-size: x-large;
}
    </style>
</head>
<body>
    <c:set var='view' value='/confirmation' scope = 'session'/>
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
           </div>
        </div>

        <div id="indexRightColumn">
            <div class="cuisineBox">
                <a href="#">
                    <span class="cuisineLabelText">American</span>
                </a>
            </div>
            <div class="cuisineBox">
                <a href="#">
                    <span class="cuisineLabelText">Japanese</span>
                </a>
            </div>
            <div class="cuisineBox">
                <a href="#">
                    <span class="cuisineLabelText">Italian</span>
                </a>
            </div>
            <div class="cuisineBox">
                <a href="#">
                    <span class="cuisineLabelText">Chinese</span>
                </a>
            </div>
        </div>

        <div id="footer">
            <hr>
            <p id="footerText">[ footer text ]</p>
        </div>
    </div>
</body>
</html>
