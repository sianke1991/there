<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../template/include.jspf" %>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
  $('#summernote').summernote();
});
</script>
</head>
<body>
	<%@ include file="../template/header.jspf" %>
    <!-- 매거진 등록 -->
    <section class="admin_contents" id="#">
        <div class="container col-md-12">
            <div class="page-header">
                <h2>매거진 수정 <SMALL>Modify Magazine</SMALL></h2>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    관리자가 작성하는 매거진 게시판입니다.
                </div>
            </div>
            
            <form action="${pageContext.request.contextPath }/admin/magazine/${mzbean.magazine_idx}/update" method="POST" class="form-horizontal col-md-12" enctype="multipart/form-data">
                <!-- <input type="hidden" name="_method" value="PUT"/> -->
                <input type="hidden" name="magazine_idx" value="${mzbean.magazine_idx}" />
                <div class="form-group">
                    <label for="magazine_subject" class="col-sm-2 control-label">매거진 제목</label>
                    <div class="col-sm-10">
                        <input type="text" name="magazine_subject" pattern=".{1,45}" id="magazine_subject" class="form-control" value="${mzbean.magazine_subject}" placeholder="45자이내" required />
                    </div>
                </div>
                <div class="form-group">
                    <label for="magazine_content" class="col-sm-2 control-label">매거진 내용</label>
                    <div class="container col-sm-10">
						<textarea class="summernote" id="summernote" name="magazine_content" required>${mzbean.magazine_content }</textarea>
                    </div>
					<script>
					$('.summernote').summernote({
						  // 에디터 높이
						  height: 150,
						  // 에디터 한글 설정
						  lang: "ko-KR",
						  // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
						  focus : true,
						  toolbar: [
							    // 글꼴 설정
							    ['fontname', ['fontname']],
							    // 글자 크기 설정
							    ['fontsize', ['fontsize']],
							    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
							    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
							    // 글자색
							    ['color', ['forecolor','color']],
							    // 표만들기
							    ['table', ['table']],
							    // 글머리 기호, 번호매기기, 문단정렬
							    ['para', ['ul', 'ol', 'paragraph']],
							    // 줄간격
							    ['height', ['height']],
							    // 그림첨부, 링크만들기, 동영상첨부
							    ['insert',['picture','link','video']],
							    // 코드보기, 확대해서보기, 도움말
							    ['view', ['codeview','fullscreen', 'help']]
							  ],
							  // 추가한 글꼴
							fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
							 // 추가한 폰트사이즈
							fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
						});
					</script>
                </div>
                <div class="form-group">
                    <label for="magazine_thumb" class="col-sm-2 control-label">썸네일 업로드</label>
                    <input type="file" id="magazine_thumb" name="magazine_thumb" value="${mzbean.magazine_thumb }">
                </div>                   

                <div class="form-group">
                    <label for="magazine_hashtag" class="col-sm-2 control-label">해시태그</label>
                    <div class="input-group-addon col-sm-1" id="magazine_hashtag">#</div>
                    <div class="col-sm-9">
                        <input type="text" pattern=".{1,50}" name="magazine_hashtag" id="magazine_hashtag" class="form-control" value="${mzbean.magazine_hashtag}" placeholder="50자 이내" aria-describedby="basic-addon1" required>
                    </div>
                </div>
                
	            <div class="btn-group btn-group-justified" role="group" aria-label="...">
	                <div class="btn-group"><button type="submit" class="btn btn-primary">수정</button></div>
	                <div class="btn-group"><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#mzDelModal">삭제</button></div>
	                <div class="btn-group"><button type="button" class="btn btn-default" onclick="history.back();">뒤로</button></div>
	            </div>                   
            </form>
            
            <!--삭제 기능을 위한 Modal 시작-->
	        <div class="modal fade" id="mzDelModal" tabindex="-1" role="dialog" aria-describedby="mzDelModalLabel">
	            <div class="modal-dialog" role="document">
	                <div class="modal-content">
	                    <div class="modal-header">
	                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="ture">&times;</span></button>
	                        <h4 class="modal-title" id="mzDelModalLabel">${mzbean.magazine_idx} 번 목록을 삭제하시겠습니까?</h4>
	                    </div>
	                    <form action="${pageContext.request.contextPath }/admin/magazine/${mzbean.magazine_idx}" method="POST">
	                        <input type="hidden" name="_method" value="DELETE" />
	                        <input type="hidden" name="magazine_idx" value="${mzbean.magazine_idx}" />
	                        <div class="modal-footer">
	                            <div class="btn-group btn-group-justified" role="group" aria-label="...">
	                                <div class="btn-group"><button type="button" class="btn btn-default" data-dismiss="modal">취소</button></div>
	                                <div class="btn-group"><button type="submit" class="btn btn-danger">삭제</button></div>
	                            </div>
	                        </div>
	                    </form>
	                </div>
	            </div>
	        </div>
	        <!--삭제 기능을 위한 Modal 끝-->
        </div>
            
    </section>
</body>
</html>