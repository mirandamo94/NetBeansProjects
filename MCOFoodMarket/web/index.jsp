<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
   <style>
        body {
        font-family: Raleway Bold;
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
        #indexLeftColumn {
            text-align: left;
            height: 700px;
            width: 350px;
            float: left;
            background-color: #c3e3e0
        }
        #indexRightColumn {
            text-align: left;
            height: 700px;
            width: 900px;
            float: left;
            background-color: #ebc5cf
        }
        #welcomeText {
            margin: 30px 5px 0 30px;
            line-height: 1.4em;
        }
        .cuisineBox {
            height: 300px;
            width: 300px;
            margin: 21px 50px 20px;
            float: left;
            background-color: #c3e3e5
        }
        .cuisineBox a { text-decoration: none }
        .cuisineLabel {
            position: absolute;
            background-color: #ffffff;
            opacity: 0.7;
            height: 40px;
            width: 260px;
            margin: 2px;
        }
        .cuisineLabelText {
            position: absolute;
            line-height: 150%;
            font-size: x-large;
            margin: 3px 10px;
        }
        .cuisineImage {
            padding: 1px;
            border:solid 1px #555;
        }
    </style>
</head>
<%--<sql:query var="cuisines" dataSource="jdbc/MCOFoodMarket">
    SELECT * FROM cuisine
</sql:query>--%>
<body>  
    
<c:set var='view' value='/index' scope='session' />

    
<div id="indexLeftColumn">
    <div id="welcomeText">
        
        <p style="font-size: larger"> Hello! Welcome to MCO Food Market, hope you came hungry! </p>
        <p></p>
        <p>Founded in 2018, we offer some of the best food in Chicago</p>
        <p>Every meal is freshly made with free delivery right to your door</p>
        <p></p>
        <p></p>
        <p>We offer some of the best food in Chicago</p>
        <p>Click on each individual cuisine box to see what's on the menu this week!</p>
        <p></p>
        <p></p>
        <p>five-star customer service, speed delivery</p>
                     
    </div>
            <center>                   

        <img src= "mcoFoodsMarket/logo.png" 
                         width="300" 
                         height="300"/>   
                </center>
</div>

    
<div id="indexRightColumn">


                <c:forEach var="cuisine" items="${cuisines}">
                    <div class="cuisineBox">
                        <a href="cuisine?${cuisine.id}">

                            <span class="cuisineLabelText">${cuisine.name}</span>

                            <img src="mcoFoodsMarket/${cuisine.name}.jpg"
                                 alt="${cuisine.name}" width="300" 
                         height="300">
                        </a>
                    </div>
                </c:forEach>
            
 
</div>
</body>
</html>
