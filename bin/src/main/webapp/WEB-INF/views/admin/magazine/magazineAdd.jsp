<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../template/include.jspf" %>
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
<script type="text/javascript">
$(document).ready(function() {
  $('#summernote').summernote();
});
// 툴바생략
var setting = {
        height : 300,
        minHeight : null,
        maxHeight : null,
        focus : true,
        lang : 'ko-KR',
        toolbar : toolbar,
        //콜백 함수
        callbacks : { 
        	onImageUpload : function(files, editor, welEditable) {
        // 파일 업로드(다중업로드를 위해 반복문 사용)
        for (var i = files.length - 1; i >= 0; i--) {
        uploadSummernoteImageFile(files[i],
        this);
        		}
        	}
        }
     };
    $('#summernote').summernote(setting);
    });
    
    function uploadSummernoteImageFile(file, el) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "uploadSummernoteImageFile",
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(data) {
				$(el).summernote('editor.insertImage', data.url);
			}
		});
	}
</script>
</head>
<body>
	<%@ include file="../template/header.jspf" %>
    <!-- 매거진 등록 -->
    <section class="admin_contents" id="form_link03">
        <div class="container col-md-12">
            <div class="page-header">
                <h2>매거진 등록 <SMALL>Add Magazine</SMALL></h2>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    관리자가 작성하는 매거진 게시판입니다.
                </div>
            </div>
            
            <form action="${pageContext.request.contextPath}/admin/magazine" method="POST" class="form-horizontal col-md-12" enctype="multipart/form-data">
                
                <div class="form-group">
                    <label for="magazine_subject" class="col-sm-2 control-label">매거진 제목</label>
                    <div class="col-sm-10">
                        <input type="text" name="magazine_subject" pattern=".{1,45}" id="magazine_subject" class="form-control" value="${mzbean.magazine_subject}" placeholder="45자이내" required />
                    </div>
                </div>
                <div class="form-group">
                    <label for="magazine_content" class="col-sm-2 control-label">매거진 내용</label>
                    <div class="container col-sm-10">
						<textarea class="summernote" id="summernote" name="magazine_content" required></textarea>
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
                    <input type="file" id="magazine_thumb" name="magazine_thumb">
                </div>                   

                <div class="form-group">
                    <label for="magazine_hashtag" class="col-sm-2 control-label">해시태그</label>
                    <div class="input-group-addon col-sm-1" id="magazine_hashtag">#</div>
                    <div class="col-sm-9">
                        <input type="text" pattern=".{1,50}" name="magazine_hashtag" id="magazine_hashtag" class="form-control" value="${mzbean.magazine_hashtag}" placeholder="50자 이내" aria-describedby="basic-addon1" required>
                    </div>
                </div>  
                
                <button type="submit" class="btn btn-primary pull-right btn-margin">입력</button>
                <button type="reset" class="btn btn-default pull-right btn- margin">취소</button>
                <button type="button" class="btn btn-default pull-right btn-margin" onclick="history.back();">뒤로가기</button>                    
            </form>
        </div>
            
    </section>
</body>
</html>