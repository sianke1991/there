$(document).ready(function(){
    var paginationArr=[0,0,0,0,0,0,0,0,0,0]; //길이 10의 배열 선언
    //paginationArr[0]: 현재 선택된 페이지
    //paginationArr[1]: 전체 레코드 개수 (db에서 레코드들을 읽어온 뒤 이 곳에 그 개수를 입력해주어야 한다.)
    //paginationArr[2]: 한 페이지 당 레코드 개수 (가급적 변하지 않을 값...)
    //paginationArr[3]: 전체 페이지 수 (가급적 변하지 않을 값...)
    //paginationArr[4]: 현재 화면에서 보이는 페이지 번호의 최소치
    //paginationArr[5]: 왼쪽 화살표를 누르면 이동하게 되는 페이지 (이 값이 -1일 경우 왼쪽 화살표는 나타나지 않음)
    //paginationArr[6]: 이중(double) 왼쪽 화살표를 누르면 이동하게 되는 페이지 (이 값이 -1일 경우 이중 왼쪽 화살표는 나타나지 않음)
    //paginationArr[7]: 현재 화면에서 보이는 페이지 번호의 최대치
    //paginationArr[8]: 오른쪽 화살표를 누르면 이동하게 되는 페이지 (이 값이 -1일 경우 오른쪽 화살표는 나타나지 않음)
    //paginationArr[9]: 이중(double) 오른쪽 화살표를 누르면 이동하게 되는 페이지 (이 값이 -1일 경우 이중 오른쪽 화살표는 나타나지 않음)
    
    paginationArr[0]=1; //현재 선택된 페이지 (처음 문서를 열었을 때 1 페이지가 열려 있어야 한다.)
    paginationArr[1]=$('.tableWithPage>tbody>tr').length; //전체 레코드 개수
    //맨 처음 페이지 로드 시에는 전체 행에 selectedRows라는 클래스를 달아준다.
    for(var i=0;i<paginationArr[1];i++){ 
        $('.tableWithPage>tbody>tr').eq(i).addClass('selectedRows'); 
    }
    paginationArr[2]=11; //한 페이지 당 레코드 개수
    paginationArr[3]=Math.trunc((paginationArr[1]+paginationArr[2]-1)/paginationArr[2]); //전체 페이지 수

    //테이블 아래에 버튼 만드는 부분 (필요에 따라서 각 버튼은 보이지 않게도 만들어야 하는데, 이 역할은 function updatePage가 담당한다.)
    $('.tableWithPage').after('<div><ul class="pagination"></ul></div>');
    $('.pagination').append('<li><a href="#" aria-label="Previous" id="doubleLeftButton"><span aria-hidden="true">&laquo;</span></a></li>');
    $('.pagination').append('<li><a href="#" aria-label="Previous" id="leftButton"><span aria-hidden="true">&lt;</span></a></li>');
    for(var i=1;i<=10;i++) $('.pagination').append('<li><a href="#" id="buttonTo'+i+'"></a></li>');
    $('.pagination').append('<li><a href="#" aria-label="Next" id="rightButton"><span aria-hidden="true">&gt;</span></a></li>');
    $('.pagination').append('<li><a href="#" aria-label="Next" id="doubleRightButton"><span aria-hidden="true">&raquo;</span></a></li>');
    updatePage(paginationArr);

    //select 태그 내에 option 태그 만드는 부분
    for(var i=0;i<$('.searchTable th').length;i++){
        $('.searchSelect').append('<option value="'+i+'">'+$('.searchTable th').eq(i).text()+'</option>');
    }
    
    $(window).resize(function(){
        centerAlign();
    });
    $('.searchButton').click(function(){
        updateRows(paginationArr);
        updatePage(paginationArr);
        return false;                    
    });
    $('.searchInput').change(function(){
            updateRows(paginationArr);
            updatePage(paginationArr);
            return false;
    });
    $('#doubleLeftButton').click(function(){
        paginationArr[0]=paginationArr[6];
        updatePage(paginationArr);
        return false;
    });
    $('#leftButton').click(function(){
        paginationArr[0]=paginationArr[5];
        updatePage(paginationArr);
        return false;
    });
    $('#buttonTo1').click(function(){
        paginationArr[0]=Math.trunc((paginationArr[0]-1)/10)*10+1;
        updatePage(paginationArr);
        return false;
    });
    $('#buttonTo2').click(function(){
        paginationArr[0]=Math.trunc((paginationArr[0]-1)/10)*10+2;
        updatePage(paginationArr);
        return false;
    });
    $('#buttonTo3').click(function(){
        paginationArr[0]=Math.trunc((paginationArr[0]-1)/10)*10+3;
        updatePage(paginationArr);
        return false;
    });
    $('#buttonTo4').click(function(){
        paginationArr[0]=Math.trunc((paginationArr[0]-1)/10)*10+4;
        updatePage(paginationArr);
        return false;
    });
    $('#buttonTo5').click(function(){
        paginationArr[0]=Math.trunc((paginationArr[0]-1)/10)*10+5;
        updatePage(paginationArr);
        return false;
    });
    $('#buttonTo6').click(function(){
        paginationArr[0]=Math.trunc((paginationArr[0]-1)/10)*10+6;
        updatePage(paginationArr);
        return false;
    });
    $('#buttonTo7').click(function(){
        paginationArr[0]=Math.trunc((paginationArr[0]-1)/10)*10+7;
        updatePage(paginationArr);
        return false;
    });
    $('#buttonTo8').click(function(){
        paginationArr[0]=Math.trunc((paginationArr[0]-1)/10)*10+8;
        updatePage(paginationArr);
        return false;
    });
    $('#buttonTo9').click(function(){
        paginationArr[0]=Math.trunc((paginationArr[0]-1)/10)*10+9;
        updatePage(paginationArr);
        return false;
    });
    $('#buttonTo10').click(function(){
        paginationArr[0]=Math.trunc((paginationArr[0]-1)/10)*10+10;
        updatePage(paginationArr);
        return false;
    });                
    $('#rightButton').click(function(){
        paginationArr[0]=paginationArr[8];
        updatePage(paginationArr);
        return false;
    });
    $('#doubleRightButton').click(function(){
        paginationArr[0]=paginationArr[9];
        updatePage(paginationArr);
        return false;
    });
});

function updatePage(paginationArr){
    paginationArr[1]=$('.selectedRows').length; //전체 레코드 개수 (검색에 따라 레코드 개수가 변할 수 있다.)
    paginationArr[3]=Math.trunc((paginationArr[1]+paginationArr[2]-1)/paginationArr[2]); //전체 페이지 수
    $('#pageIndicator').text(paginationArr[0]+'/'+paginationArr[3]); //현재 페이지 번호를 화면에 출력
    paginationArr[4]=Math.trunc((paginationArr[0]-1)/10)*10+1; //현재 화면에서 보이는 페이지 번호의 최소치
    paginationArr[5]=(paginationArr[4]>1)?paginationArr[4]-1:-1; //왼쪽 화살표를 누르면 이동하게 되는 페이지 (-1 시 왼쪽 화살표는 나타나지 않음)
    paginationArr[6]=(paginationArr[4]>1)?1:-1; //이중(double) 왼쪽 화살표를 누르면 이동하게 되는 페이지 (-1시 이중 왼쪽 화살표는 나타나지 않음)
    paginationArr[7]=(paginationArr[4]+9<paginationArr[3])?paginationArr[4]+9:paginationArr[3]; //현재 화면에서 보이는 페이지 번호의 최대치
    paginationArr[8]=(paginationArr[7]<paginationArr[3])?paginationArr[7]+1:-1; //오른쪽 화살표를 누르면 이동하게 되는 페이지 (-1 시 오른쪽 화살표는 나타나지 않음)
    paginationArr[9]=(paginationArr[7]<paginationArr[3])?paginationArr[3]:-1; //이중(double) 오른쪽 화살표를 누르면 이동하게 되는 페이지 (dd==-1 시 이중 오른쪽 화살표는 나타나지 않음)
    for(var i=1;i<=10;i++){
        $('#buttonTo'+i).text(Math.trunc((paginationArr[0]-1)/10)*10+i);
        if(paginationArr[0]%10==i%10) $('#buttonTo'+i).css('color','red'); //현재 선택된 페이지에 해당하는 버튼만 글자를 붉게 변하게 만든다.
        else $('#buttonTo'+i).css('color','black');                     //만약 BOOTSTRAP의 클래스를 적용하고 싶으면 addClass, removeClass, toggleClass 메서드를 사용한다.
    }
    $('.tableWithPage>tbody>tr').hide(); //일단 전체 레코드를 가린 뒤
    for(var i=(paginationArr[0]-1)*paginationArr[2];i<paginationArr[0]*paginationArr[2];i++){ //해당 페이지에 맞는 레코드만 표시한다.
        $('.selectedRows').eq(i).show();
    }
    
    //상황에 맞게 버튼을 보여주거나 가린다.
    if(paginationArr[5]<0) $('#leftButton').hide();
    else $('#leftButton').show();
    if(paginationArr[6]<0) $('#doubleLeftButton').hide();
    else $('#doubleLeftButton').show();
    if(paginationArr[8]<0) $('#rightButton').hide();
    else $('#rightButton').show();
    if(paginationArr[9]<0) $('#doubleRightButton').hide();
    else $('#doubleRightButton').show();
    for(var i=1;i<=10;i++){
        if(Math.trunc((paginationArr[0]-1)/10)*10+i>paginationArr[3]) $('#buttonTo'+i).hide();
        else $('#buttonTo'+i).show();
    }
    centerAlign();
}

function centerAlign(){
    $('.pagination').css('margin-left',($('section').width()-$('.pagination').width())/2); //가운데정렬
    $('#pageIndicator').css('margin-left',(($('section').width()-$('#pageIndicator').width())/2));
}

function updateRows(pagination){
    var selectedCol=$('.searchSelect').val();
    console.log(selectedCol);
    var inputString=$('.searchInput').val();
    for(var i=0;i<$('.searchTable>tbody>tr').length;i++){ //순차 탐색
        var currentRow=$('.searchTable>tbody>tr').eq(i);
        var data=currentRow.children().eq(parseInt(selectedCol)).text();
        if(data.indexOf(inputString)==-1) $('.searchTable>tbody>tr').eq(i).removeClass('selectedRows');
        else $('.searchTable>tbody>tr').eq(i).addClass('selectedRows');
    } //i loop (순차 탐색)
    pagination[0]=1; //새롭게 검색을 하면 1 페이지로 이동시켜야 한다.
}