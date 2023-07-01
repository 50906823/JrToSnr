<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://nenia.kr/js/jquery-1.12.4.min.js?ver=191202"></script>
<style>
        @keyframes ring {
            0% {
                width: 30px;
                height: 30px;
                opacity: 1;
            }

            100% {
                width: 300px;
                height: 300px;
                opacity: 0;
            }
        }

        @import url("https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap");
        .box {
            font-size: 100px;
            text-align: center;
            border: 1px solid;
            box-sizing: border-box;
        }
        .container {
            z-index: 1;
            background: url(/resources/image/등하원2.png);
            background-repeat: no-repeat;
            background-size: 100% 1400px;
        }
        .main1{
            width: 500px;
            position: absolute;
            left: 55%;
            top:20%;
            
        }

        .font-2 {
            font-size: 1.3rem;
            font-weight: 200;
        }

        .main2 {
            z-index: 0;
            padding: 0px;
            margin: 0px;
            height: 900px;
            background: url(/resources/image/등하교.png);
            background-size: 100% 1000px;
            position: relative;
            top: 1237px;
        }

        .mainup {
            width: 80%;
            height: 500px;
            background-color: #FAF3E6;
            position: absolute;
            z-index: 2;
            left: 50%;
            top: 115%;
            transform: translate(-50%, -50%);
            transition: width 0.5s, height 0.5s;
            border-radius: 12px;
        }

        .inner2 {
            color: rgba(rgba(21, 71, 38, 0.15));
            ;
            text-align: center;
            width: 500px;
        }

        .inner3 {
            text-align: center;
            position: relative;
        }

        button {
            margin: 20px;
        }

        .w-btn-neon2 {
            position: relative;
            border: none;
            min-width: 200px;
            min-height: 50px;
            background: linear-gradient(90deg,
            #154726 0%,
                    #154726 100%);
            border-radius: 1000px;
            color: white;
            cursor: pointer;
            font-weight: 700;
            transition: 0.3s;
        }


        .w-btn-neon2:hover::after {
            content: "";
            width: 30px;
            height: 30px;
            border-radius: 100%;
            border: 6px solid #154726;
            position: absolute;
            z-index: 3;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            animation: ring 1.5s infinite;
            
        }
        <!--스타일 -->
        
    </style>
</head>
<%@include file = "header.jsp" %>
<body class="container">
    <div class="main1">
        <div class="inner">
            <h1 style="">항상 옆에서, <span style="color: #FAF3E6; font-size: 2.5rem;" >코코노아</span></h1><br>
            <p class="font-2" style="width: 350px;">우리곁을 지켜주는 어른들이 있습니다. <br>그들과 함께여서 <br> 나는 행복합니다.</p>
        </div>
    </div>
    <div class="mainup">
        <img src="/resources/image/logo.jpg" alt="" width="500" height="500"
            style="position: absolute; border-radius: 12px; top: 100px; left: 50%;">
        <div style="position: relative; left:60%; top: 80%; width: 200px;"> <button class="w-btn-neon2"
                type="button">동행하러가기</button></div>
        <div class="inner2">

            <h2>About US</h2>
            <br><br><br><br><br><br><br><br><br>
            <p style="font-size: 2.3rem;">더욱 안전한 서비스를<br>제공하고자 노력합니다.</p>
            <br><br><br><br><br><br><br><br>
            <p style="font-size: 1.8rem;">'미래의 안전'에 어떻게 기여할 수 있을까?</p>
            <p style="font-size: 1.8rem;">당신도 할 수 있습니다.</p>
        </div>



    </div>
    <div class="main2"></div>
	<div style="; width: 100%; height:900px; position: absolute; top: 1700px; z-index:-1;">123123
	<%@include file = "scroll.jsp" %>
	
	</div>
        
    <script src="https://code.jquery.com/jquery-3.7.0.js" 
		integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
		crossorigin="anonymous">
</script>
     

    <script>
        var mainup = document.querySelector('.mainup');
        var scrollCount = 0;

        window.addEventListener('scroll', function () {
            console.log(scrollY);
            scrollCount = window.pageYOffset;

            var maxHeight = document.documentElement.scrollHeight - window.innerHeight;

            if (scrollCount <= maxHeight * 0.1) {
                var widthPercentage = (scrollCount / (maxHeight * 0.2)) * 10 + 80;
                var heightPercentage = (scrollCount / (maxHeight * 0.2)) * 100 + 500;
                mainup.style.width = widthPercentage + '%';
                mainup.style.height = heightPercentage + 'px';
            }

            if (scrollCount >= maxHeight * 0.1) {
                mainup.style.width = '100%';
                mainup.style.height = '800px'; // 원하는 최대 높이 값으로 수정해주세요
            }
        });
    </script>
    
    <%@include file = "footer.jsp" %>
</body>

</html>
