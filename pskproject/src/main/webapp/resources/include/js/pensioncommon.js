function displaytype(n,t,li_name,div_name) {
	for (var i = 1; i <= t; i++) {
		var objdiv = document.getElementById(div_name+ "_" + i);
		var objli = document.getElementById(li_name+ "_" +i);
		if (i == n) {
			objdiv.style.display = "block";
			objli.className = "on";
		} else {
			objdiv.style.display = "none";
			objli.className = "";
		}
	}
}


function OnlyNumber(obj) {
	for(var i=0; i<obj.value.length; i++) {
		var chr=obj.value.substr(i,1);
		if(chr<'0' || chr > '9') {
			alert('번호!');
			obj.focus();
			obj.select();
			return;
		}
	}
}
function CheckPoint() {
	form = document.config_fm;
	var use = (form.use_point[0].checked == true) ? false: true;
	form.default_point.disabled = use;
	form.pay_point.disabled = use;
	form.usable_point.disabled = use;
	form.rate_point.disabled = use;
}

function Reserve() {
	form = document.RealFm;
	var str = false;
	for(i=5; i<form.elements.length; i++) {
		if(form.elements[i].name=="room_uid[]" && form.elements[i].checked==true) str = true;
	}
	if(str==false) {
		alert("!");
		return;
	}
	form.submit();
}