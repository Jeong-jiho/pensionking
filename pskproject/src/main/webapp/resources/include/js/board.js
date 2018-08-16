var keyword="", search="", start_date="", end_date="";

$(function(){
		
	if(search !="b_date"){
		$("#dateCheck").hide();
		var date = getDateFormat(new Date());
		$("#start_date").val(date);
		$("#end_date").val(date);
	}else{
		$("#search").val(search);
		$("#textCheck").hide();
		$("#start_date").val(start_date);
		$("#end_date").val(end_date);
	}
	
	if(keyword!=""){
		$("#search").val(search);
		$("#keyword").val(keyword);
	}
			
	
	//검색 버튼 클릭 시 처리 이벤트
	$("#searchBtn").click(function(){
		if($("#search").val()!="b_date"){
			if(!chkData($('#keyword'), "검색어를")) return;
		}else if($("#search").val()=="b_date"){
			if(!chkData($('#start_date'),"시작날짜를")) return;
			else if(!chkData($('#end_date'),"종료날짜를")) return;
			else if($('#start_date').val()>$('#end_date').val()){
				alert("시작날짜가 종료 날짜보다 더 클 수 없습니다.");
				return;
			}
		}
		goPage();
	}); 
	
	// 전체 목록 보기 버튼
	$("#allSearchBtn").click(function(){
		$("#search > option:selected").val("");
		$("#keyword").val("");
		$("#start_date").val("");
		$("#end_date").val("");
		goPage();
	})
	
	
	//검색 대상이 변결될 때마다 처리 이벤트
	$("#search").change(function(){
		if($("#search").val()!="b_date"){
			$("#dateCheck").hide(); 		// 등록일 검색 화면 숨기기
			$("#textCheck").show(); 		// 검색 단어 화면 보이기
		}if($("#search").val()=="b_date"){
			$("#textCheck").hide();
			$("#dateCheck").show();
		}
	});
	
	/*엑셀 다운로드 버튼 클릭시 처리 이벤트*/
	   $("#excelDownBtn").click(function(){
	      $("#f_search").attr({
	         "method" : "get",
	         "action" : "/admin/board/boardExcel.do"
	      });
	      $("#f_search").submit();
	   });	
})

function goPage(){
	if($("#search").val()=="all"){
		$("#keyword").val("");
	}
	$("#f_search").attr({
		"method":"get",
		"action":"/admin/board/boardList.do"
	});
	$("#f_search").submit();	
}


