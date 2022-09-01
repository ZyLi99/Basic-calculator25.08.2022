<%--
  Created by IntelliJ IDEA.
  User: 小张
  Date: 2022/8/20
  Time: 18:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="UTF-8">
<title>Online-Rechner</title>

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>Fast and English E-Learning Plattform</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->

<link rel="shortcut icon" href="images/Yumao.jpg" type="image/x-icon" />
<link rel="apple-touch-icon" href="images/Yumao.jpg">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="style.css">
<!-- ALL VERSION CSS -->
<link rel="stylesheet" href="css/versions.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="css/custom.css">

<!-- Modernizer for Portfolio -->
<script src="js/modernizer.js"></script>
<script src="js/jquery-1.11.0.min.js"></script>

<!-- ALL JS FILES -->
<script src="js/all.js"></script>

<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
.buttonTaste{
    width:60px;
    height:60px;
    border-radius: 100px;
    padding: 10px;
    background-color: darkslategrey;
    color: snow;
    font-weight: bold;

}
.taste{
    margin:3px;
}
.zeileLuecke{
    margin:3px;
}
 .backgroundColorChange{
    background-color: red !important;

}
.backgroundColorChange2{
    background-color: orange !important;
}
#mainDiv{
    width:1290px;
    height:600px;
    background-color: black;
}
#displayDiv{
    position: relative;
    top:100px;
}
#Display{
    width:280px;
    height: 50px;
    background-color: black;
}
#inputArea{
    color:snow;
    border-color: black;
    background-color: black;
    font-size: 50px;
    width:280px;
    height: 50px;
}


</style>



</head>
<script src="/static/jquery-1.10.1.min.js"></script>

<script>
   window.onload=function (){
        var color;
        var buttonColor=document.getElementsByClassName("buttonTaste");
        for(var i=0;i<buttonColor.length;i++){
            buttonColor[i].onmouseover = function(){
                //记录修改后的颜色
                color=this.style.backgroundColor;
                this.style.backgroundColor="#b3b3b3";
            }
            buttonColor[i].onmouseout = function(){
                this.style.backgroundColor=color;
            }
        }



    }

    function getNum(a){

            var originalValue = $("#inputArea").val();
            if(originalValue==="0")originalValue="";
            var buttonValue = a;
                $("#inputArea").val(originalValue + " " + buttonValue + " ");

    }

    function clearAllNum(){
        $("#inputArea").val("0");
    }

    function x() {
       var name= document.getElementById("inputArea").value
        $.ajax( {
            type :"GET",
            url :"/getUser",
            contentType:"text/plain;charset=UTF-8",
            data: {"name":name},
            success : function(result) {
                $("#inputArea").val(result);
            }

        });
    }
</script>
<body>
<%--        <h1 onclick="x()">点击我！ </h1>--%>
<div id="mainDiv">
    <div id="displayDiv">
        <div id="Display"><input id="inputArea" type="text" value="0"></div>
        <div id="fristZeileTaste" class="zeileLuecke">
            <span class="taste"><input onclick="clearAllNum()"  id="ACTaste"  style="background-color: gray" class="buttonTaste"  type="button" value="AC"/></span>
            <span class="taste"><input onclick="getNum(this.value)" id="PlusMinusTaste" style="background-color: gray" class="buttonTaste" class="backgroundColorChange" type="button" value="+/-"></span>
            <span class="taste"><input onclick="getNum(this.value)" id="%Taste" class="buttonTaste" style="background-color: gray" class="backgroundColorChange" type="button" value="%"></span>
            <span class="taste"><input onclick="getNum(this.value)" id="divdTaste" class="buttonTaste " style="background-color: orange" type="button" value="/"></span>

        </div>

        <div id="secondZeileTaste" class="zeileLuecke">
            <span class="taste"><input onclick="getNum(this.value)" id="7Taste" class="buttonTaste" type="button" value="7"/></span>
            <span class="taste"><input onclick="getNum(this.value)" id="8Taste" class="buttonTaste" type="button" value="8"></span>
            <span class="taste"><input onclick="getNum(this.value)" id="9Taste" class="buttonTaste" type="button" value="9"></span>
            <span class="taste"><input onclick="getNum(this.value)" id="malTaste" class="buttonTaste" style="background-color: orange" class="backgroundColorChange2" type="button" value="x"></span>

        </div>

        <div id="thirdZeileTaste" class="zeileLuecke">
            <span class="taste"><input onclick="getNum(this.value)" id="4Taste" class="buttonTaste" type="button" value="4"/></span>
            <span class="taste"><input onclick="getNum(this.value)" id="5Taste" class="buttonTaste" type="button" value="5"></span>
            <span class="taste"><input onclick="getNum(this.value)" id="6Taste" class="buttonTaste" type="button" value="6"></span>
            <span class="taste"><input onclick="getNum(this.value)" id="minusTaste" class="buttonTaste" style="background-color: orange" class="backgroundColorChange2" type="button" value="-"></span>

        </div>

        <div id="fourthZeileTaste" class="zeileLuecke">
            <span class="taste"><input onclick="getNum(this.value)" id="1Taste" class="buttonTaste" type="button" value="1"/></span>
            <span class="taste"><input onclick="getNum(this.value)" id="2Taste" class="buttonTaste" type="button" value="2"></span>
            <span class="taste"><input onclick="getNum(this.value)" id="3Taste" class="buttonTaste" type="button" value="3"></span>
            <span class="taste"><input onclick="getNum(this.value)" id="plusTaste" class="buttonTaste" style="background-color: orange" class="backgroundColorChange2" type="button" value="+"></span>

        </div>
        <div id="lastZeileTaste" class="zeileLuecke">
            <span class="taste"><input onclick="getNum(this.value)" id="0Taste" style="width:130px;border-radius:30px" class="buttonTaste" type="button" value="0"/></span>
            <span class="taste"><input onclick="getNum(this.value)" id="punktTaste" class="buttonTaste" type="button" value="."></span>
            <span class="taste"><input onclick="x()"  id="equalTaste" class="buttonTaste" style="background-color: orange" class="backgroundColorChange2" type="button" value="="></span>

        </div>

    </div>
</div>
</body>
</html>
