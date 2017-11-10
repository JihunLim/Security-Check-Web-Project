<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%String cp= request.getContextPath(); %>
<!DOCTYPE HTML>

<html>
	<head>
		<title>사회보장정보원 보안시스템</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="<%=cp%>/bootstrap/css/lightslider.css" />
    <style>
    	ul{
			list-style: none outside none;
		    padding-left: 0;
            margin: 0;
		}
        .demo .item{
            margin-bottom: 60px;
        }
		.content-slider li{
		    background-color: #ed3020;
		    text-align: center;
		    color: #FFF;
		}
		.content-slider h3 {
		    margin: 0;
		    padding: 70px 0;
		}
		.demo{
			width: 1200px;
		}
    </style>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="<%=cp%>/bootstrap/js/lightslider.js"></script> 
    <script>
    	 $(document).ready(function() {
			$("#content-slider").lightSlider({
                loop:true,
                keyPress:true
            });
            $('#image-gallery').lightSlider({
                gallery:true,
                item:1,
                thumbItem:9,
                slideMargin: 0,
                speed:200,
                auto:true,
                loop:true,
                onSliderLoad: function() {
                    $('#image-gallery').removeClass('cS-hidden');
                }  
            });
		});
    </script>
</head>
<body>
	<div class="demo">
        <div class="item">            
            <div class="clearfix" style="max-width:474px;">
                <ul id="image-gallery" class="gallery list-unstyled cS-hidden">
                    <li data-thumb="images/thumb/cS-1.jpg"> 
                        <img src="images/cS-1.jpg" />
                         </li>
                    <li data-thumb="images/thumb/cS-2.jpg"> 
                        <img src="images/cS-2.jpg" />
                         </li>
                    <li data-thumb="images/thumb/cS-3.jpg"> 
                        <img src="images/cS-3.jpg" />
                         </li>
                    <li data-thumb="images/thumb/cS-4.jpg"> 
                        <img src="images/cS-4.jpg" />
                         </li>
                    <li data-thumb="images/thumb/cS-5.jpg"> 
                        <img src="images/cS-5.jpg" />
                         </li>
                    <li data-thumb="images/thumb/cS-6.jpg"> 
                        <img src="images/cS-6.jpg" />
                         </li>
                    <li data-thumb="images/thumb/cS-7.jpg"> 
                        <img src="images/cS-7.jpg" />
                         </li>
                    <li data-thumb="images/thumb/cS-8.jpg"> 
                        <img src="images/cS-8.jpg" />
                         </li>
                    <li data-thumb="images/thumb/cS-9.jpg"> 
                        <img src="images/cS-9.jpg" />
                         </li>
                    <li data-thumb="images/thumb/cS-10.jpg"> 
                        <img src="images/cS-10.jpg" />
                         </li>
                    <li data-thumb="images/thumb/cS-11.jpg"> 
                        <img src="images/cS-11.jpg" />
                         </li>
                    <li data-thumb="images/thumb/cS-12.jpg"> 
                        <img src="images/cS-12.jpg" />
                         </li>
                    <li data-thumb="images/thumb/cS-13.jpg"> 
                        <img src="images/cS-13.jpg" />
                         </li>
                    <li data-thumb="images/thumb/cS-14.jpg"> 
                        <img src="images/cS-14.jpg" />
                         </li>
                    <li data-thumb="images/thumb/cS-15.jpg"> 
                        <img src="images/cS-15.jpg" />
                         </li>
                </ul>
            </div>
        </div>
        <div class="item">
            <ul id="content-slider" class="content-slider">
                <li>
                    <h3>1</h3>
                </li>
                <li>
                    <h3>2</h3>
                </li>
                <li>
                    <h3>3</h3>
                </li>
                <li>
                    <h3>4</h3>
                </li>
                <li>
                    <h3>5</h3>
                </li>
                <li>
                    <h3>6</h3>
                </li>
            </ul>
        </div>
        
        <!-- db에 있는 사진 꺼내기 -->
        <div>
        <img src="<%=cp%>/ShowImage.do?imgIdx=50" alt="..." width="200" height="200">
        
        
        
        
        </div>

    </div>	
</body>

<!-- 끝 -->
