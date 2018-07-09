<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Smatching</title>
<!-- Twitter Bootstrap3 & jQuery -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
	
<!-- 공통 CSS -->
<link rel="stylesheet" href="/assets/css/common.css" />

<!-- CKEditor -->
<script src="http://cdn.ckeditor.com/4.4.7/standard/ckeditor.js"></script>

<!-- Multi-column -->
<script type="text/javascript" src="/assets/plugins/multi-column/ie-row-fix.js"></script>
<link rel="stylesheet" href="/assets/plugins/multi-column/multi-columns-row.css" />

<!-- handlebars -->
<script src="/assets/plugins/handlebars/handlebars-v4.0.5.js"></script>

<!-- ajax -->
<link rel="stylesheet" type="text/css" href="/assets/plugins/ajax/ajax_helper.css" />
<script type="text/javascript" src="/assets/plugins/ajax/ajax_helper.js"></script>

<!-- ajaxForm -->
<script type="text/javascript" src="/assets/plugins/ajax-form/jquery.form.min.js"></script>



      
<!-- Javascript -->
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/bootstrap.min.js"></script>

<style type="text/css">

.carousel-inner>.item>img {
   max-width: 100%;
   max-height: 1080px;
   min-height: 500px;
}
#findPw{
   margin: 5px;
}
</style>

<script type="text/javascript">
$( document ).ready(function() {
    $("div.form-group").hide();
});

</script>
</head>

<body>
   <div class="container1">
      

      <!-- 캐러셀 영역 구성 -->
      <div id="carousel-example-generic" class="carousel slide" 
         data-ride="carousel" data-interval="false">
         <!-- 현재 위치 표시 -->
         <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0"
               class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
         </ol>

        <!-- 내용 영역 -->
         <div class="carousel-inner">
            <!-- 항목 (1) -->
            <div class="item active">
               <img src="${pageContext.request.contextPath}/assets/img/main3.jpg" alt="슬라이더(1)" style="height: 100%; width:100%;">
               <div class="container">
                  <div class="carousel-caption">
                  </div>
               </div>
            </div>

            <!-- 항목 (2) -->
            <div class="item">
               <img src="${pageContext.request.contextPath}/assets/img/main2.jpg" alt="슬라이더(2)" style="height: 100%; width:100%;">
               <div class="container">
                  <div class="carousel-caption">
                   
                  </div>
               </div>
            </div>

            <!-- 항목 (3) -->
            <div class="item">
               <img src="${pageContext.request.contextPath}/assets/img/main1.jpg" alt="슬라이더(3)" style="height: 100%; width:100%;">
               <div class="container">
                  <div class="carousel-caption">
                  <fieldset>
                 <div id="login_btns">
                 <div class="col-md-12">
                     <button type="button" class="btn btn-primary" id="join_btn">시작하기</button>
                     <button type="button" class="btn btn-info" id="login_btn">로그인</button>
                 </div>
            </div>



    <!-- 가입폼 시작 -->
    <form class="form-horizontal" name="myform" method="post"  action="${pageContext.request.contextPath}/member/login_ok.do">
        <div class="form-group">
            <label for='userid' class="col-md-2">아이디*</label>
            <div class="col-md-10">
                <input type="text" name="user_id" id="user_id" class="form-control" placeholder="아이디는 영문만 가능합니다."/>
            </div>
        </div>

        <div class="form-group">
            <label for='"password"' class="col-md-2">비밀번호*</label>
            <div class="col-md-10">
                <input type="password" name="user_pw" id="user_pw" class="form-control" placeholder="caps lock이 켜져있는지 확인하세요"/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-8 col-xs-12">
                <button type="submit" class="btn btn-primary">로그인</button>
                <button type="button" class="btn btn-primary" id="cancel">취소</button>
               <a href="#" style="color:#ffffff"> <p id="findPw">비밀번호 찾기</p> </a>
            </div>
        </div>
    </form>
                    
                          
       <script type="text/javascript">

       
       $(function(){
          $("#join_btn").click(function(e) {
             location.href="${pageContext.request.contextPath}/member/join.do";
         }); // end click
       });
       
       $(function(){
           $("#findPw").click(function(e) {
              location.href="${pageContext.request.contextPath}/member/find_pw.do";
          }); // end click
        });
       
       $(function(){
           $("#cancel").click(function(e) {
              
              $("div.form-group").hide();
              $("#login_btns").show();
          }); // end click
        });
       
       $(function(){
           $("#login_btn").click(function(e) {
              $("#login_btns").hide();
              $("div.form-group").show();
          }); // end click
        });


       
    </script>
  
    
                        </fieldset>
                     

                  </div>
               </div>
            </div>
         </div>
         <!-- // 내용영역 구성 -->

         <!-- 이동 버튼 -->
         <a class="left carousel-control" href="#carousel-example-generic"
            data-slide="prev"> <span class="icon-prev"></span>
         </a> <a class="right carousel-control" href="#carousel-example-generic"
            data-slide="next"> <span class="icon-next"></span>
         </a>
      </div>
      <!-- 캐러셀 영역 끝 -->
      <div id=login_div></div>
   </div>

</body>
</html>