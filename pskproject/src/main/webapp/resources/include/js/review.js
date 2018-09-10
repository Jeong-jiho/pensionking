var keyword = ""; search = "", start_date = "", end_date = "";

		$(function(){
			
			if(search != "rv_date"){
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

			if(keyword != ""){
				$("#search").val(search);
				$("#keyword").val(keyword);
			}	
								
			//검색버튼 클리시 처리 이벤트
			$("#searchBtn").click(function(){
				if($("#search").val() != "rv_date"){
					if(!chkData("#keyword","검색어를")) return;
				}else if($("#search").val() == "rv_date"){
					if(!chkData("#start_date", "시작 날짜를")) return;
					else if(!chkData("#end_date", "종료날짜를")) return;
					else if($("#start_date").val()>$("#end_date").val()){
						alert("시작날짜가 종료날짜보다 더 클 수 없습니다.");
						return;
					}
				}
				goPage();
			})
		

			//전체 목록 보기 버튼
			$("#allSearchBtn").click(function(){
				$("#search > option:selected").val("");
				$("#keyword").val("");
				$("#start_date").val("");
				$("#end_date").val("");
				goPage();
			})
			
			// 검색 대상이 변경될 때마다 처리 이벤트
			$("#search").change(function(){
				if($("#search").val() != "rv_date"){
					$("#dateCheck").hide();  //등록일 검색 화면 숨기기
					$("#textCheck").show();  //검색 단어 화면 보이기

				}if($("#search").val() == "rv_date"){
					$("#textCheck").hide();
					$("#dateCheck").show();
				}
			});
			
		});	
		