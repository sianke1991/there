<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="template/include.jspf" %>
<script type="text/javascript">
						//페이지네이션
													//(sianke1991)
//본 스크립트는 해당 페이지에 사용되는 것을 가정하고 작성되었으므로 다른 페이지에 적용하기 위해서는 별도의 수정이 필요함
/*
$(document).ready(function(){
		var plPaginationArr=[0,0,0,0,0,0,0,0,0,0]; //장소 페이지네이션을 위한 배열 (길이: 10)
		var mbrPaginationArr=[0,0,0,0,0,0,0,0,0,0]; //회원 페이지네이션을 위한 배열 (길이: 10)
		var mzPaginationArr=[0,0,0,0,0,0,0,0,0,0]; //매거진 페이지네이션을 위한 배열 (길이: 10)
		
//		paginationArr[0]: 현재 선택된 페이지
//        paginationArr[1]: 전체 레코드 개수
//        paginationArr[2]: 한 페이지 당 레코드 개수 (가급적 변하지 않을 값...)
//        paginationArr[3]: 전체 페이지 수 (가급적 변하지 않을 값...)
//        paginationArr[4]: 현재 화면에서 보이는 페이지 번호의 최소치
//        paginationArr[5]: 왼쪽 화살표를 누르면 이동하게 되는 페이지 (이 값이 -1일 경우 왼쪽 화살표는 나타나지 않음)
//        paginationArr[6]: 이중(double) 왼쪽 화살표를 누르면 이동하게 되는 페이지 (이 값이 -1일 경우 이중 왼쪽 화살표는 나타나지 않음)
//        paginationArr[7]: 현재 화면에서 보이는 페이지 번호의 최대치
//        paginationArr[8]: 오른쪽 화살표를 누르면 이동하게 되는 페이지 (이 값이 -1일 경우 오른쪽 화살표는 나타나지 않음)
//        paginationArr[9]: 이중(double) 오른쪽 화살표를 누르면 이동하게 되는 페이지 (이 값이 -1일 경우 이중 오른쪽 화살표는 나타나지 않음)
		
		
		//initialization
		plPaginationArr[0]=1;
        plPaginationArr[1]=$('#plTable>tbody>tr').length;
        plPaginationArr[2]=5;
        plPaginationArr[3]=Math.trunc((plPaginationArr[1]+plPaginationArr[2]-1)/plPaginationArr[2]);
        
        mbrPaginationArr[0]=1;
        mbrPaginationArr[1]=$('#mbrTable>tbody>tr').length;
        mbrPaginationArr[2]=5;
        mbrPaginationArr[3]=Math.trunc((mbrPaginationArr[1]+mbrPaginationArr[2]-1)/mbrPaginationArr[2]);
        
        mzPaginationArr[0]=1;
        mzPaginationArr[1]=$('#mzTable>tbody>tr').length;
        mzPaginationArr[2]=5;
        mzPaginationArr[3]=Math.trunc((mzPaginationArr[1]+mzPaginationArr[2]-1)/mzPaginationArr[2]);
        
        //to put buttons at the bottom of tables
        $('#plTable').after('<div><ul class="pagination" id="plPagination"></ul></div>');
        $('#plPagination').append('<li><a href="#" aria-label="Previous" id="plDoubleLeftButton"><span aria-hidden="true">&laquo;</span></a></li>');
        $('#plPagination').append('<li><a href="#" aria-label="Previous" id="plLeftButton"><span aria-hidden="true">&lt;</span></a></li>');
        for(var i=1;i<=5;i++) $('#plPagination').append('<li><a href="#" id="plButtonTo'+i+'">'+i+'</a></li>');
        $('#plPagination').append('<li><a href="#" aria-label="Next" id="plRightButton"><span aria-hidden="true">&gt;</span></a></li>');
        $('#plPagination').append('<li><a href="#" aria-label="Next" id="plDoubleRightButton"><span aria-hidden="true">&raquo;</span></a></li>');
        
        $('#mbrTable').after('<div><ul class="pagination" id="mbrPagination"></ul></div>');
        $('#mbrPagination').append('<li><a href="#" aria-label="Previous" id="mbrDoubleLeftButton"><span aria-hidden="true">&laquo;</span></a></li>');
        $('#mbrPagination').append('<li><a href="#" aria-label="Previous" id="mbrLeftButton"><span aria-hidden="true">&lt;</span></a></li>');
        for(var i=1;i<=5;i++) $('#mbrPagination').append('<li><a href="#" id="mbrButtonTo'+i+'">'+i+'</a></li>');
        $('#mbrPagination').append('<li><a href="#" aria-label="Next" id="mbrRightButton"><span aria-hidden="true">&gt;</span></a></li>');
        $('#mbrPagination').append('<li><a href="#" aria-label="Next" id="mbrDoubleRightButton"><span aria-hidden="true">&raquo;</span></a></li>');
        
        $('#mzTable').after('<div><ul class="pagination" id="mzPagination"></ul></div>');
        $('#mzPagination').append('<li><a href="#" aria-label="Previous" id="mzDoubleLeftButton"><span aria-hidden="true">&laquo;</span></a></li>');
        $('#mzPagination').append('<li><a href="#" aria-label="Previous" id="mzLeftButton"><span aria-hidden="true">&lt;</span></a></li>');
        for(var i=1;i<=5;i++) $('#mzPagination').append('<li><a href="#" id="mzButtonTo'+i+'">'+i+'</a></li>');
        $('#mzPagination').append('<li><a href="#" aria-label="Next" id="mzRightButton"><span aria-hidden="true">&gt;</span></a></li>');
        $('#mzPagination').append('<li><a href="#" aria-label="Next" id="mzDoubleRightButton"><span aria-hidden="true">&raquo;</span></a></li>');
        
		$(window).resize(function(){
            centerAlign();
        });
		updatePage(plPaginationArr,'pl');
		updatePage(mbrPaginationArr,'mbr');
		updatePage(mzPaginationArr,'mz');
		
		$('#plDoubleLeftButton').click(function(){
            plPaginationArr[0]=plPaginationArr[6];
            updatePage(plPaginationArr,'pl');
            return false;
        });
        $('#plLeftButton').click(function(){
            plPaginationArr[0]=plPaginationArr[5];
            updatePage(plPaginationArr,'pl');
            return false;
        });
        $('#plButtonTo1').click(function(){
            plPaginationArr[0]=Math.trunc((plPaginationArr[0]-1)/5)*5+1;
            updatePage(plPaginationArr,'pl');
            return false;
        });
        $('#plButtonTo2').click(function(){
            plPaginationArr[0]=Math.trunc((plPaginationArr[0]-1)/5)*5+2;
            updatePage(plPaginationArr,'pl');
            return false;
        });
        $('#plButtonTo3').click(function(){
            plPaginationArr[0]=Math.trunc((plPaginationArr[0]-1)/5)*5+3;
            updatePage(plPaginationArr,'pl');
            return false;
        });
        $('#plButtonTo4').click(function(){
            plPaginationArr[0]=Math.trunc((plPaginationArr[0]-1)/5)*5+4;
            updatePage(plPaginationArr,'pl');
            return false;
        });
        $('#plButtonTo5').click(function(){
            plPaginationArr[0]=Math.trunc((plPaginationArr[0]-1)/5)*5+5;
            updatePage(plPaginationArr,'pl');
            return false;
        });
		$('#plRightButton').click(function(){
            plPaginationArr[0]=plPaginationArr[8];
            updatePage(plPaginationArr,'pl');
            return false;
        });
        $('#plDoubleRightButton').click(function(){
            plPaginationArr[0]=plPaginationArr[9];
            updatePage(plPaginationArr,'pl');
            return false;
        });
        
		$('#mbrDoubleLeftButton').click(function(){
            mbrPaginationArr[0]=mbrPaginationArr[6];
            updatePage(mbrPaginationArr,'mbr');
            return false;
        });
        $('#mbrLeftButton').click(function(){
            mbrPaginationArr[0]=mbrPaginationArr[5];
            updatePage(mbrPaginationArr,'mbr');
            return false;
        });
        $('#mbrButtonTo1').click(function(){
            mbrPaginationArr[0]=Math.trunc((mbrPaginationArr[0]-1)/5)*5+1;
            updatePage(mbrPaginationArr,'mbr');
            return false;
        });
        $('#mbrButtonTo2').click(function(){
            mbrPaginationArr[0]=Math.trunc((mbrPaginationArr[0]-1)/5)*5+2;
            updatePage(mbrPaginationArr,'mbr');
            return false;
        });
        $('#mbrButtonTo3').click(function(){
            mbrPaginationArr[0]=Math.trunc((mbrPaginationArr[0]-1)/5)*5+3;
            updatePage(mbrPaginationArr,'mbr');
            return false;
        });
        $('#mbrButtonTo4').click(function(){
            mbrPaginationArr[0]=Math.trunc((mbrPaginationArr[0]-1)/5)*5+4;
            updatePage(mbrPaginationArr,'mbr');
            return false;
        });
        $('#mbrButtonTo5').click(function(){
            mbrPaginationArr[0]=Math.trunc((mbrPaginationArr[0]-1)/5)*5+5;
            updatePage(mbrPaginationArr,'mbr');
            return false;
        });
		$('#mbrRightButton').click(function(){
            mbrPaginationArr[0]=mbrPaginationArr[8];
            updatePage(mbrPaginationArr,'mbr');
            return false;
        });
        $('#mbrDoubleRightButton').click(function(){
            mbrPaginationArr[0]=mbrPaginationArr[9];
            updatePage(mbrPaginationArr,'mbr');
            return false;
        });
        
		$('#mzDoubleLeftButton').click(function(){
            mzPaginationArr[0]=mzPaginationArr[6];
            updatePage(mzPaginationArr,'mz');
            return false;
        });
        $('#mzLeftButton').click(function(){
            mzPaginationArr[0]=mzPaginationArr[5];
            updatePage(mzPaginationArr,'mz');
            return false;
        });
        $('#mzButtonTo1').click(function(){
            mzPaginationArr[0]=Math.trunc((mzPaginationArr[0]-1)/5)*5+1;
            updatePage(mzPaginationArr,'mz');
            return false;
        });
        $('#mzButtonTo2').click(function(){
            mzPaginationArr[0]=Math.trunc((mzPaginationArr[0]-1)/5)*5+2;
            updatePage(mzPaginationArr,'mz');
            return false;
        });
        $('#mzButtonTo3').click(function(){
            mzPaginationArr[0]=Math.trunc((mzPaginationArr[0]-1)/5)*5+3;
            updatePage(mzPaginationArr,'mz');
            return false;
        });
        $('#mzButtonTo4').click(function(){
            mzPaginationArr[0]=Math.trunc((mzPaginationArr[0]-1)/5)*5+4;
            updatePage(mzPaginationArr,'mz');
            return false;
        });
        $('#mzButtonTo5').click(function(){
            mzPaginationArr[0]=Math.trunc((mzPaginationArr[0]-1)/5)*5+5;
            updatePage(mzPaginationArr,'mz');
            return false;
        });
		$('#mzRightButton').click(function(){
            mzPaginationArr[0]=mzPaginationArr[8];
            updatePage(mzPaginationArr,'mz');
            return false;
        });
        $('#mzDoubleRightButton').click(function(){
            mzPaginationArr[0]=mzPaginationArr[9];
            updatePage(mzPaginationArr,'mz');
            return false;
        });		
});

function updatePage(paginationArr, selectorStr){
	paginationArr[4]=Math.trunc((paginationArr[0]-1)/5)*5+1; //현재 화면에서 보이는 페이지 번호의 최소치
    paginationArr[5]=(paginationArr[4]>1)?paginationArr[4]-1:-1; //왼쪽 화살표를 누르면 이동하게 되는 페이지 (-1 시 왼쪽 화살표는 나타나지 않음)
    paginationArr[6]=(paginationArr[4]>1)?1:-1; //이중(double) 왼쪽 화살표를 누르면 이동하게 되는 페이지 (-1시 이중 왼쪽 화살표는 나타나지 않음)
    paginationArr[7]=(paginationArr[4]+4<paginationArr[3])?paginationArr[4]+4:paginationArr[3]; //현재 화면에서 보이는 페이지 번호의 최대치
    paginationArr[8]=(paginationArr[7]<paginationArr[3])?paginationArr[7]+1:-1; //오른쪽 화살표를 누르면 이동하게 되는 페이지 (-1 시 오른쪽 화살표는 나타나지 않음)
    paginationArr[9]=(paginationArr[7]<paginationArr[3])?paginationArr[3]:-1; //이중(double) 오른쪽 화살표를 누르면 이동하게 되는 페이지 (dd==-1 시 이중 오른쪽 화살표는 나타나지 않음)
    for(var i=1;i<=5;i++){
        $('#'+selectorStr+'ButtonTo'+i).text(Math.trunc((paginationArr[0]-1)/5)*5+i);
        if(paginationArr[0]%5==i%5) $('#'+selectorStr+'ButtonTo'+i).css('color','red'); //현재 선택된 페이지에 해당하는 버튼만 글자를 붉게 변하게 만든다.
        else $('#'+selectorStr+'ButtonTo'+i).css('color','black');
    }
    $('#'+selectorStr+'Table>tbody>tr').hide(); //일단 전체 레코드를 가린 뒤
    for(var i=(paginationArr[0]-1)*paginationArr[2];i<paginationArr[0]*paginationArr[2];i++){ //해당 페이지에 맞는 레코드만 표시한다.
        $('#'+selectorStr+'Table>tbody>tr').eq(i).show();
    }
    
  //상황에 맞게 버튼을 보여주거나 가린다.
    if(paginationArr[5]<0) $('#'+selectorStr+'LeftButton').hide();
    else $('#'+selectorStr+'LeftButton').show();
    if(paginationArr[6]<0) $('#'+selectorStr+'DoubleLeftButton').hide();
    else $('#'+selectorStr+'DoubleLeftButton').show();
    if(paginationArr[8]<0) $('#'+selectorStr+'RightButton').hide();
    else $('#'+selectorStr+'RightButton').show();
    if(paginationArr[9]<0) $('#'+selectorStr+'DoubleRightButton').hide();
    else $('#'+selectorStr+'DoubleRightButton').show();
    for(var i=1;i<=5;i++){
        if(Math.trunc((paginationArr[0]-1)/10)*10+i>paginationArr[3]) $('#'+selectorStr+'ButtonTo'+i).hide();
        else $('#'+selectorStr+'ButtonTo'+i).show();
    }
    centerAlign();
}
						
function centerAlign(){
	$('#plPagination').css('margin-left',($('#plDiv').width()-$('#plPagination').width())/2);
	$('#mbrPagination').css('margin-left',($('#mbrDiv').width()-$('#mbrPagination').width())/2);
	$('#mzPagination').css('margin-left',($('#mzDiv').width()-$('#mzPagination').width())/2);
}
*/
</script>
<style>
	#plTable a{
		display:block;
	}
	#mzTable a{
		display:block;
	}
</style>

</head>
<body>
<%@ include file="template/header.jspf" %>
       
        <!-- 메인 -->
        <section class="admin_contents" id="form_link01">
            <div class="page-header">
                <h2>관리자 메인 <SMALL>Admin Main</SMALL></h2>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    매거진 글 목록, 장소 관리, 회원 리스트를 한 번에 볼 수 있습니다.<br /> <strong>수정 및 관리는 각각의 관리자 메뉴에서 실행해주세요.</strong>
                </div>
            </div>


            <!--장소 목록-->
            <div class="container col-md-6" id="plDiv">
                <div class="page-header">
                    <h3>장소 목록현황 <SMALL>현재까지 등록된 장소</SMALL></h3>
                </div>

                <table class="table table-bordered table-hover" id="plTable">
                    <thead>
                        <tr>
                            <th class="col-md-2">장소 번호</th>
                            <th>장소 이름</th> 
                            <th>전화번호</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${plList }" var="plbean" begin="0" end="3">
                        <tr>
                        <td><a href="${pageContext.request.contextPath }/admin/place/${plbean.place_idx }">${plbean.place_idx }</a></td>
                        <td><a href="${pageContext.request.contextPath }/admin/place/${plbean.place_idx }">${plbean.place_name }</a></td>
                        <td><a href="${pageContext.request.contextPath }/admin/place/${plbean.place_idx }">${plbean.place_tel }</a></td>
                        </tr>
					</c:forEach>
                    </tbody>
                </table>
            </div> 


            <!--회원 목록-->
            <div class="container col-md-6" id="mbrDiv">
                <div class="page-header">
                    <h3>회원 현황 <SMALL>현재까지 가입한 회원 목록</SMALL></h3>
                </div>

                <table class="table table-bordered table-hover" id="mbrTable">
                    <thead>
                        <tr>
                            <th class="col-md-2">회원 번호</th> 
                            <th>회원 아이디</th> 
                            <th>가입일</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${mbrList }" var="mbrbean" begin="0" end="3">
						<tr>
						<td>${mbrbean.member_idx }</td>
						<td>${mbrbean.member_id }</td>
						<td>${mbrbean.member_registdate.getYear()+1900 }/${mbrbean.member_registdate.getMonth()+1 }/${mbrbean.member_registdate.getDate() }</td>
						</tr>
					</c:forEach>
                    </tbody>
                </table>
            </div>         

            <!--매거진 글목록 -->
            <div class="container clear col-md-12 margin-b" id="mzDiv">
                <div class="page-header">
                    <h3>매거진 글 현황 <SMALL>현재까지 등록된 매거진 게시글</SMALL></h3>
                </div>

                <table class="table table-bordered table-hover" id="mzTable">
                    <thead>
                        <tr>
                            <th class="col-md-1">글 번호</th> 
                            <th>매거진 제목</th>
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${mzList }" var="mzbean" begin="0" end="3">
                    	<tr>
                    	<td><a href="${pageContext.request.contextPath }/admin/magazine/${mzbean.magazine_idx }">${mzbean.magazine_idx }</a></td>
                    	<td><a href="${pageContext.request.contextPath }/admin/magazine/${mzbean.magazine_idx }">${mzbean.magazine_subject }</a></td>
                    	</tr>
					</c:forEach>
                    </tbody>
                </table>
            </div>
        </section>

        
</body>
</html>