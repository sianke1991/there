<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@ include file="../template/include.jspf" %>
   	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/search.js"></script>
   	<style>
   	table a{
   		text-decoration: none;
   		display: block;
   	}
   	table a:hover{
   		text-decoration: none;
   	}
   	
   	</style>
</head>
<body>
<%@ include file="../template/header.jspf" %>
    <section class="admin_contents" id="form_link02">

        <div class="page-header">
            <h3 class="top_title">매거진 게시물 목록</h3>
        </div>

        <div class="form-group form-inline">
            <select class="form-control searchSelect"></select>
            <input type="text" class="form-control searchInput" placeholder="Search for ..."/>
            <button type="button" class="btn btn-default searchButton">검색</button>
            <a class="btn btn-default" href="${pageContext.request.contextPath }/admin/magazine" role="button">전체보기</a>
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
                    <th>매거진 번호</th>
                    <th>매거진 제목</th>
                    <th>매거진 조회수</th>
                    <th>매거진 썸네일이름</th>
                    <th>매거진 작성일</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${list }" var="mzbean">
                <tr>
                    <td><a href="${pageContext.request.contextPath}/admin/magazine/${mzbean.magazine_idx }">${mzbean.magazine_idx }</a></td>
                    <td><a href="${pageContext.request.contextPath}/admin/magazine/${mzbean.magazine_idx }">${mzbean.magazine_subject }</a></td>
                    <td><a href="${pageContext.request.contextPath}/admin/magazine/${mzbean.magazine_idx }">${mzbean.magazine_viewcnt }</a></td>
                    <td><a href="${pageContext.request.contextPath}/admin/magazine/${mzbean.magazine_idx }">${mzbean.magazine_thumb.substring(mzbean.magazine_thumb.indexOf("_")+1) }</a></td>
                    <td><a href="${pageContext.request.contextPath}/admin/magazine/${mzbean.magazine_idx }">${mzbean.magazine_date.getYear()+1900 }/${mzbean.magazine_date.getMonth()+1 }/${mzbean.magazine_date.getDate() }</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <span id="pageIndicator"></span> 
    </section>
</body>
</html>