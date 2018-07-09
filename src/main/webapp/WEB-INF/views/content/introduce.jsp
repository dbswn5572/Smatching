<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/inc/head.jsp"%>
<style type="text/css">
/** hr 태그에 대한 상하 여백 확보 */
.featurette-divider {
    margin: 80px 0;
}/** 제목 텍스트 모양 */
.featurette-heading {
    font-weight: bold; line-height: 1; letter-spacing: -1px;
}/** 상세 내용영역의 반응형 기능 >> 제목의 글자 크기 재설정 */
@media (min-width: 768px) {
    .featurette-heading {
        font-size: 50px;
    }
}@media (min-width: 992px) {
    .featurette-heading {
        margin-top: 120px;
    }
}</style>
</head>
<body>
<%@ include file="/WEB-INF/inc/topbar.jsp"%>
<!-- 내용영역 -->
<div class="container">
    <h1 class="page-header">Smatching</h1>
    <!-- 그리드 시스템 (데스크탑 가로3칸) -->
    <div class="row">
        <div class="col-md-4 text-center">
            <img src="${pageContext.request.contextPath}/assets/img/introduce-img1.png" class="img-circle" width="240" height="240"/>
            <h2>DAILY</h2>
            <p>
                Smatching은 당신의 일상을 사진 한장으로 서로 공유하는 곳입니다. 당신이 추억을 남기고 싶거나 모두에게 알리고 싶은 사진을 올려보세요.
            </p>
        </div>
        <div class="hidden-lg hidden-md">
            <br/> <br/>
        </div>
        <div class="col-md-4 text-center">
            <img src="${pageContext.request.contextPath}/assets/img/introduce-img2.png" class="img-circle" width="240" height="240"/>
            <h2>FASHION</h2>
            <p>
                당신만의 Fashion Style을 공유해 보세요. 당신의 style을 공유하며, 당신도 다른 style을 경험해 보세요. 다양한 fashion 팁을 얻을 수 있으며 당신의 fashion을 자랑 할 수 있는 공간입니다.
            </p>
        </div>
        <div class="hidden-lg hidden-md">
            <br/> <br/>
        </div>
        <div class="col-md-4 text-center">
            <img src="${pageContext.request.contextPath}/assets/img/introduce-img3.png" class="img-circle" width="240" height="240"/>
            <h2>MEET</h2>
            <p>
              다양한 style을 가진 사람들을 볼 수 있으며, 그 중 당신이 원하는 style을 가진 사람과 매칭할 수 있도록 도와드립니다. 서로의 스타일이 마음에 든다면 당신과 상대방은 서로의 인스타 id를 확인 할 수 있습니다.
            </p>
        </div>
    </div>
    <!--// 그리드 시스템 -->
    <hr class="featurette-divider">
    <div class="row featurette">
        <div class="col-md-7">
            <h2 class="featurette-heading">
                사용자들의 사진 확인해보세요. <span class="text-muted">다양한 콘텐츠가 있습니다.</span>
            </h2>
            <p class="lead">
                가장 심플한 것이 가장 화려한 것이라는 말이 있습니다. 사진만으로도 당신은 추억을 남기며 공유할 수 있습니다.
            </p>
        </div>
        <div class="col-md-5">
            <img class="img-thumbnail img-responsive" src="${pageContext.request.contextPath}/assets/img/screenshot1.jpg" width="500" height="500"/>
        </div>
    </div>
    <hr class="featurette-divider">
    <div class="row featurette">
        <div class="col-md-5">
            <img class="img-thumbnail img-responsive" src="${pageContext.request.contextPath}/assets/img/screenshot2.jpg" width="500" height="500"/>
        </div>
        <div class="col-md-7">
            <h2 class="featurette-heading">무척 쉽습니다. <span class="text-muted">직접 경험해 보세요.</span></h2>
            <p class="lead">
                어려움 없이 간단한 방법을 통하여 사진을 업로드할 수 있으며 빠르게 당신의 추억을 공유해드립니다. 
            </p>
        </div>
    </div>
    <hr class="featurette-divider">
    <div class="row featurette">
        <div class="col-md-7">
            <h2 class="featurette-heading">단순함이 모여서 화려함이 됩니다. <span class="text-muted">정말 멋집니다.</span></h2>
            <p class="lead">
                당신의 사진 하나 하나가 모여 당신의 Fashion Collection이 됩니다. 나만의 Collection을 만들어 보세요. 당신도 Fashion Model이 될 수 있습니다.
            </p>
        </div>
        <div class="col-md-5">
            <img class="img-thumbnail img-responsive" src="${pageContext.request.contextPath}/assets/img/screenshot3.jpg" width="500" height="500"/>
        </div>
    </div>
</div>
<!--// 내용영역 -->
<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>