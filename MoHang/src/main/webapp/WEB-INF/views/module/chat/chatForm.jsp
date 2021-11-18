<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/chat.css" rel="stylesheet" type="text/css"/>
<script src="resources/js/jquery.js"></script>
<script src="resources/js/chat.js"></script>
<title>Insert title here</title>
</head>
<body>

<div class="container">
<div class="row clearfix">
    <div class="col-lg-12">
        <div class="card chat-app">
            <div id="plist" class="people-list">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fa fa-search"></i></span>
                    </div>
                    <input type="text" class="form-seach" placeholder="Search...">
                </div>
                <ul class="list-unstyled chat-list mt-2 mb-0">
                    <li class="clearfix">
                        <img src="${pageContext.request.contextPath}/resources/assets/img/portfolio/person.png" alt="avatar">
                        <div class="about">
                            <div class="name">이서준</div>
                            <div class="status"> <i class="fa fa-circle offline"></i> 7분 전 </div>                                            
                        </div>
                    </li>
                    <li class="clearfix active">
                        <img src="${pageContext.request.contextPath}/resources/assets/img/portfolio/person.png" alt="avatar">
                        <div class="about">
                            <div class="name">최지혜</div>
                            <div class="status"> <i class="fa fa-circle online"></i> 10분 전 </div>
                        </div>
                    </li>
                    <li class="clearfix">
                         <img src="${pageContext.request.contextPath}/resources/assets/img/portfolio/person.png" alt="avatar">
                        <div class="about">
                            <div class="name">이상엽</div>
                            <div class="status"> <i class="fa fa-circle online"></i> 30분 전 </div>
                        </div>
                    </li>                                    
                    <li class="clearfix">
                        <img src="${pageContext.request.contextPath}/resources/assets/img/portfolio/person.png" alt="avatar">
                        <div class="about">
                            <div class="name">이정준</div>
                            <div class="status"> <i class="fa fa-circle offline"></i> 10시간 전 </div>
                        </div>
                    </li>
                    <li class="clearfix">
                        <img src="${pageContext.request.contextPath}/resources/assets/img/portfolio/person.png" alt="avatar">
                        <div class="about">
                            <div class="name">김원형</div>
                            <div class="status"> <i class="fa fa-circle online"></i> 1주일 전 </div>
                        </div>
                    </li>
                    <li class="clearfix">
                        <img src="${pageContext.request.contextPath}/resources/assets/img/portfolio/person.png" alt="avatar">
                        <div class="about">
                            <div class="name">강사님</div>
                            <div class="status"> <i class="fa fa-circle offline"></i> 1달 전 </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="chat">
                <div class="chat-header clearfix">
                    <div class="row">
                        <div class="col-lg-6">
                            <a href="javascript:void(0);" data-toggle="modal" data-target="#view_info">
                                <img src="${pageContext.request.contextPath}/resources/assets/img/portfolio/person.png" alt="avatar">
                            </a>
                            <div class="chat-about">
                                <h6 class="m-b-0">최지혜</h6>
                                <small>10분 전</small>
                            </div>
                        </div>
                        <div class="col-lg-6 hidden-sm text-right">
                            <a href="javascript:void(0);" class="btn btn-outline-secondary"><i class="fa fa-camera"></i></a>
                            <a href="javascript:void(0);" class="btn btn-outline-primary"><i class="fa fa-image"></i></a>
                            <a href="javascript:void(0);" class="btn btn-outline-info"><i class="fa fa-cogs"></i></a>
                            <a href="javascript:void(0);" class="btn btn-outline-warning"><i class="fa fa-question"></i></a>
                        </div>
                    </div>
                </div>
                <div class="chat-history">
                    <ul class="m-b-0">
                        <li class="clearfix">
                            <div class="message-data text-right">
                                <span class="message-data-time">10:10 AM, Today</span>
                                <img src="${pageContext.request.contextPath}/resources/assets/img/portfolio/person.png" alt="avatar">
                            </div>
                            <div class="message other-message float-right"> 우리 프로젝트 족망 </div>
                        </li>
                        <li class="clearfix">
                            <div class="message-data">
                                <span class="message-data-time">10:12 AM, Today</span>
                            </div>
                            <div class="message my-message">족망아님</div>                                    
                        </li>                               
                        <li class="clearfix">
                            <div class="message-data">
                                <span class="message-data-time">10:15 AM, Today</span>
                            </div>
                            <div class="message my-message">ㄴㄴ 족망</div>
                        </li>
                    </ul>
                </div>
                <div class="chat-message clearfix">
                    <div class="input-group mb-0">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-send"></i></span>
                        </div>
                        <input type="text" class="form-control" placeholder="메세지 입력후 enter키를 입력해주세요.">                                    
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>