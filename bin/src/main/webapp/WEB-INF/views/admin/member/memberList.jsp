<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <%@ include file="../template/include.jspf" %>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/search.js"></script>
</head>
<body>
    <%@ include file="../template/header.jspf" %>
    <section class="admin_contents" id="form_link07">
        <div class="page-header">
            <h3 class="top_title">회원 목록</h3>
        </div>

        <div class="form-group form-inline">
            <select class="form-control searchSelect"></select>
            <input type="text" class="form-control searchInput" placeholder="Search for ..."/>
            <button type="button" class="btn btn-default searchButton">검색</button>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/member" role="button">전체보기</a>
        </div>

        <p></p>
        <div class="panel panel-default">
            <div class="panel-heading">
                회원자료 삭제 시 다른 회원이 기존 회원아이디를 사용하지 못하도록 회원아이디, 이름은 삭제하지 않고 영구 보관합니다.
            </div>
        </div>

        <table class="table table-hover searchTable tableWithPage table-condensed table-responsive table-bordered">
            <thead>
                <tr>
                    <th>#</th>
                    <th>회원 아이디</th>
                    <th>회원 이름</th>
                    <th>회원 비밀번호</th>
                    <th>회원 대체 비밀번호</th>
                    <th>회원 이메일</th>
                    <th>회원 휴대폰 번호</th>
                    <th>회원 상태</th>
                    <th>가입일</th>
                </tr>
            </thead>
            <tbody>
	            <c:forEach items="${list }" var="mbrbean">
                <tr>
                    <td>${mbrbean.member_idx }</td>
                    <td>${mbrbean.member_id }</td>
                    <td>${mbrbean.member_name }</td>
                    <td>${mbrbean.member_pw }</td>
                    <td>${mbrbean.member_pwans }</td>
                    <td>${mbrbean.member_email }</td>
                    <td>${mbrbean.member_tel }</td>
                    <td>${mbrbean.member_state }</td>
                    <td>${mbrbean.member_registdate.getYear()+1900}-${mbrbean.member_registdate.getMonth()+1}-${mbrbean.member_registdate.getDate()}</td>
                </tr>
	            </c:forEach>
            </tbody>
        </table>
        <span id="pageIndicator"></span> 
    </section>
</body>
</html>