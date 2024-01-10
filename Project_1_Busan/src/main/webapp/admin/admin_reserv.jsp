<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.tab_area.tab2 button {
    width: 50%;
}
.tab_area.sub4 button {
    height: 70px;
}
.tab_area button:last-child {
    border-radius: 0 10px 10px 0;
    border-right: 1px solid #e7e7e7;
}
.tab_area button {
    overflow: hidden;
    position: relative;
    display: inline-block;
    height: 66px;
    border: 1px solid #e7e7e7;
    border-left: none;
    border-right: none;
    cursor: pointer;
}
.tab_area.mypage button span {
    font-size: 16px;
}
.tab_area.sub4 button span {
    font-size: 16px;
    line-height: 68px;
}
.tab_area button.on span {
    color: #ffffff;
}

.tab_area button span {
    position: relative;
    display: block;
    color: #00548b;
    font-size: 18px;
    text-align: center;
    line-height: 66px;
    z-index: 20;
}
.tab_area {
    height: 68px;
    font-size: 0;
}
.pc_mt30 {
    margin-top: 30px;
}

.titbox .total_num_txt {
    color: grey; 
}

/* Hidden 클래스 정의 */
.hidden {
    display: none;
}

.tab_area button.on::after {
    background-color: #00548b;
}
.tab_area button.on::after {
    z-index: 10;
}

/* 활성화된 탭의 스타일 */
.on {
    background-color: #00548b; /* 활성화된 탭의 배경색을 파란색으로 설정 */
    color: white; /* 글자색을 흰색으로 설정 */
}

.tab_area button::after {
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    content: '';
}

.cancel-button {
        padding: 3px 5px; 
    }
</style>
<script type="text/javascript">
//toggleTab 함수 수정

function toggleTab(tabIndex) {
    // 모든 테이블 숨기기
    document.getElementById('table1').classList.add('hidden');
    document.getElementById('table2').classList.add('hidden');

    // 모든 탭의 활성화 클래스 제거
    var buttons = document.querySelectorAll('.tab_box button');
    buttons.forEach(function(button) {
        button.classList.remove('on');
    });

    // 선택한 탭의 테이블 표시 및 해당 탭 활성화
    if (tabIndex === 0) {
        document.getElementById('table1').classList.remove('hidden');
        buttons[tabIndex].classList.add('on');
    } else if (tabIndex === 1) {
        document.getElementById('table2').classList.remove('hidden');
        buttons[tabIndex].classList.add('on');
    }

    // 선택한 탭의 인덱스를 로컬 스토리지에 저장
    localStorage.setItem('selectedTabIndex', tabIndex);
}

// 페이지 로드 시 저장된 탭 인덱스를 확인하여 해당 탭을 활성화
document.addEventListener('DOMContentLoaded', function() {
    var storedTabIndex = localStorage.getItem('selectedTabIndex');
    if (storedTabIndex !== null) {
        toggleTab(parseInt(storedTabIndex));
    }
});


</script>
<script type="text/javascript">
$(function(){
	$(document).ready(function(){
		  $('.ok').on("change",function(){
			  let rstate=$(this).val()
			  let rno=$(this).attr("data-rno")
			  location.href="../admin/admin_fReserve_ok.do?rstate="+rstate+"&rno="+rno
		  })

})
});
$(function(){
		$(document).ready(function(){
			  $('.rok').on("change",function(){
				  let rs=$(this).val()
				  let no=$(this).attr("data-no")
				  location.href="../admin/admin_exReserve_ok.do?rs="+rs+"&no="+no
			  })		  
			})

});
	

</script>
</head>
<body>
  <div class="myReserv">
      <div class="max1200 dp_pc contents_titbox">
                <h4 class="titbox">회원<strong>예약내역</strong></h4>
   	  </div>
   	 <div class="tab_contents_area">
   	  	<p class="titbox">&nbsp;&nbsp;<span class="total_num_txt offline ta_px0">총 <strong>${rSize }</strong>개의 미승인된 예약내역이 있습니다.</span></p>
   	  </div>
		<div class="pc_mt30 ta_mt40 ta_mx40 tab_area tab2 sub4 mypage">
		    <div class="tab_box">
		        <button onclick="toggleTab(0)" class="h40 on"><a href="admin_reserv.do?page=1&tab=1"><span>맛집</span></a></button>
		        <button onclick="toggleTab(1)" class="h40"><a href="admin_reserv.do?page=1&tab=2"><span>전시회</span></a></button>
		    </div>
		</div>

        <!--  맛집 예약 => 최신예약 순 출력-->
        <div id="table1" class="">
	        <!--TABLE-->
			<table class="lecture_info_table tablet_type2 mypage" style="width: 100%;">
			    <thead>
			    <tr>
			        <th class="dp_pc num2" scope="col">번호</th>
			        <th class="title double ta_txt_center" scope="col" style="text-align: center;">식당명</th>
			        <th class="dp_pc reserve_date" scope="col">예약자</th>
			        <th class="dp_pc reserve_date" scope="col">예약자ID</th>
			        <th class="dp_pc reserve_date" scope="col">예약일시</th>
			        <th class="dp_pc num2" scope="col">인원</th>
			        <th class="write_date" scope="col">승인상태</th>
			    </tr>
			    </thead>
			    <tbody id=myTable>
 					<c:choose>
					    <c:when test="${empty flist}"> 
					        <tr>
					            <td colspan="4" class="empty">
					                예약내역이 없습니다.
					            </td>
					        </tr>
 					    </c:when>
					    <c:otherwise> 
					        <c:forEach var="vo" items="${flist}" varStatus="r">
					            <tr>
					                <td class="dp_pc num2">${r.index +1}</td>
					                <td class="title double ta_px20" style="text-align: center;">
					                    <a href="../busan/food_detail.do?no=${vo.fno}">${vo.fvo.title}</a>
					                </td>
					                <td class="dp_pc writer">${vo.mvo.name}</td>
					                <td class="dp_pc writer" data-id="${vo.id}">${vo.id}</td>
					                <td class="dp_pc writer">${vo.day}<br>${vo.time}</td>
					                 <td class="dp_pc num2">${vo.inwon}명</td>
							        <td>
										<select class="ok" data-rno=${vo.rno }>
											<option ${vo.ok=='0'?"selected":"" } value=0>승인대기</option>
											<option ${vo.ok=='1'?"selected":"" } value=1>승인완료</option>
											<option ${vo.ok=='2'?"selected":"" } value=2>예약취소</option>
										</select>
									</td>                 
					            </tr>
					        </c:forEach>
					    </c:otherwise> 
 					</c:choose> 
			    </tbody>
			</table>
			<!--//TABLE-->
			<!--//PAGINATION-->
			 <div class="row">
                <div class="text-center">
                    <ul class="pagination">
                        <c:if test="${startPage>1}">
                            <li><a href="admin_reserv.do?page=${startPage-1}&tab=1">&lt;</a></li>
                        </c:if>
                        <c:forEach var="i" begin="${startPage}" end="${endPage}">
                            <li ${curpage==i?"class=active":""}><a href="admin_reserv.do?page=${i}&tab=1">${i}</a></li>
                        </c:forEach>
                        <c:if test="${endPage<totalpage}">
                            <li><a href="admin_reserv.do?page=${endPage+1}&tab=1">&gt;</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>			
        </div>
        <!--  맛집 예약 -->
        
		<!--  전시회 예약 => 최신예약 순 출력-->
		<div id="table2" class="hidden">
	        <!--TABLE-->
			<table class="lecture_info_table tablet_type2 mypage" style="width: 100%;">
			    <thead>
			    <tr>
			        <th class="dp_pc num2" scope="col">번호</th>
			        <th class="title double ta_txt_center" scope="col" style="text-align: center;">전시회명</th>
			        <th class="dp_pc reserve_date" scope="col">예약자</th>
			        <th class="dp_pc reserve_date" scope="col">예약자ID</th>
			        <th class="dp_pc reserve_date" scope="col">예약일</th>
			        <th class="dp_pc num2" scope="col">인원</th>
			        <th class="write_date" scope="col">승인상태</th>
			    </tr>
			    </thead>
			    <tbody id=myTable>
 					<c:choose>
					    <c:when test="${empty rlist}"> 
					        <tr>
					            <td colspan="4" class="empty">
					                예약내역이 없습니다.
					            </td>
					        </tr>
 					    </c:when>
					    <c:otherwise> <!-- e.eno, e.ename, ri.day, ri.inwon, ri.rok, ri.id " -->
					        <c:forEach var="vo" items="${rlist}" varStatus="r">
					            <tr id=ex>
					                <td class="dp_pc num2">${r.index +1}</td>
					                <td class="title double ta_px20" style="text-align: center;">
					                    <a href="../busan/ex_detail.do?eno=${vo.evo.eno}" class="ellipsis">${vo.evo.ename}</a>
					                </td>
					                 <td class="dp_pc writer">${vo.mvo.name}</td>
					                 <td class="dp_pc writer">${vo.mvo.id}</td>
					                <td class="dp_pc writer">${vo.day}</td>
					                 <td class="dp_pc num2">${vo.inwon}</td>
							        <td>
										<select class="rok" data-no=${vo.no }>
											<option ${vo.rok=='0'?"selected":"" } value=0>승인대기</option>
											<option ${vo.rok=='1'?"selected":"" } value=1>승인완료</option>
											<option ${vo.rok=='2'?"selected":"" } value=2>예약취소</option>
										</select>
									</td>              
					            </tr>
					        </c:forEach>
					    </c:otherwise> 
 					</c:choose> 
			    </tbody>
			</table>
			<!--//TABLE-->
			<!--//PAGINATION-->
			<div class="row">
                <div class="text-center">
                    <ul class="pagination">
                        <c:if test="${startPage>1}">
                            <li><a href="admin_reserv.do?page=${startPage-1}&tab=2">&lt;</a></li>
                        </c:if>
                        <c:forEach var="i" begin="${startPage}" end="${endPage}">
                            <li ${curpage==i?"class=active":""}><a href="admin_reserv.do?page=${i}&tab=2">${i}</a></li>
                        </c:forEach>
                        <c:if test="${endPage<totalpage}">
                            <li><a href="admin_reserv.do?page=${endPage+1}&tab=2">&gt;</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
        <!--  전시회 예약 -->
        </div>

</body>
</html>