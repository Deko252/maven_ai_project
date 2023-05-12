<%--
  Created by IntelliJ IDEA.
  User: milion
  Date: 2023-05-12
  Time: 오후 2:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <title>Title</title>
</head>
<body>
    <img src="https://tomcat.apache.org/res/images/tomcat.png" alt="">s
    <div>hello</div>
    <h1>으아아아아아아아아아아아아아아아아아아아아</h1>
    <div>
        <textarea name="" id="msg" cols="30" rows="10" style="width: 100%; height: 120px;" class="form-control" >이게 맞나??</textarea>
    </div>
    <div class="input-group" style="width: 250px; margin-left: 50px;">
        <select name="" id="seltrans" class="form-select">
            <option value="en">영어</option>
            <option value="ja">일어</option>
            <option value="zh-TW">중국어</option>
            <option value="es">스페인어</option>
            <option value="de">독일어</option>
        </select>
        <button type="button" id="btntrans" class="btn btn-outline-danger">번역하기</button>
        <i class="bi bi-megaphone speak" style="font-size: 30px;margin-left: 10px; cursor: pointer;" id="voice"></i>
    </div>
    <div id="trans" style="margin-top: 20px; width: 100%; font-size: 20px; margin-left: 10px;"></div>
<script type="text/javascript">
    $("#btntrans").click(function (){
    //입력한 메세지
        let msg = $("#msg").val();
        //선택한 나라 기준
        let lang = $("#seltrans").val();

        $.ajax({
            type:"post",
            url:"./trans",
            data:{"msg":msg,"lang":lang},
            dataType:"text",
            success:function (res){
                //String 을 json 데이터로 변환
                let j = JSON.parse(res);
                //번역한 문자열을 얻는다
                let s = j.message.result.translatedText;
                //div에 출력
                $("#trans").html(s);
            }

        })
    });
    $("#voice").click(function (){
        //입력한 메세지
        let msg = $("#trans").val();
        //선택한 나라 기준
        let lang = $("#seltrans").val();
    if(lang==`en` || lang=='ja' || lang == 'zh-CN' || lang == 'es' || lang == 'ko'){
        $.ajax({
            type:"post",
            url:"./voice",
            data:{"msg":msg,"lang":lang},
            dataType:"text",//mpc 파일명
            success:function (res){
                alert(res);
                let audio = new Audio(res);
                audio.play();
            }

        })
    }else {
        alert("현재 영어,일어,중국어,스페인어,한국어만 지원합니다");
    }
    });
</script>
</body>
</html>
