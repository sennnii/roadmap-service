<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시작화면</title>
<style>
    body {
        font-family: "SeoulNamsan", Helvetica;
        
    }

    .header {
    	color:#426B1F;
    	padding: 10px;
        display: flex;
        justify-content: space-between;
        font-weight: bold;
        font-family: "SeoulNamsan", Helvetica;
        font-size: 36px;
        margin-bottom: 20px;
    }
    .title{
    	color:#426B1F;
    	display: flex;
        justify-content: center;
        align-items: center;
        font-family: "SeoulNamsan", Helvetica;
        font-weight: bold;
        font-size: 64px;
        text-align: center; /* 가운데 정렬 */
        margin-bottom: 20px;
    }

    .body {
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: "SeoulNamsan", Helvetica;
        font-weight: bold;
        font-size: 32px;
        text-align: center; /* 가운데 정렬 */
        margin-bottom: 20px;
    }

    .next-container {
        display: flex;
        justify-content: center; /* 가운데 정렬 */
        align-items: center;
    }

	.next {
	    width: 417px;
	    height: 71px;
	    background-color: #426B1F;
	    color: white;
	    padding: 5px 15px;
	    border-radius: 5px;
	    font-size: 24px;
	    display: flex; /* Flexbox를 사용하여 중앙 정렬 */
	    justify-content: center; /* 수평 중앙 정렬 */
	    align-items: center; /* 수직 중앙 정렬 */
	    text-align: center;
	    cursor: pointer;
	    font-size:24px;
	    font-weight: bold;
	}


    .container {
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center; /* 텍스트 가운데 정렬 */
    }
</style>
</head>
<body>
	<div class="header">
            <div>전과자들</div>
    </div>
    <div class="container">
        <br><br>
		<div class="title">서비스 가이드</div><br><br>
        <div class="body">이 서비스는 AI소프트융합학부 컴퓨터공학전공 23학번을 기준으로 한 학업이수가이드를 따릅니다.<br><br>
        	-과목 구분에 맞게 본인이 지금까지 이수한 과목을 클릭하여 선택하세요.<br>
			-클릭할 때마다 화면 하단에 누적 학점이 계산됩니다.<br>
			-모든 선택이 끝나면 결과 화면을 통해 남은 학점과 수강해야 할 과목,<br>
			빨리 수강이 필요한 전공 과목을 추천하여 보여줍니다.</div><br><br><br><br>
        <div class="next-container">
            <div class="next" onclick="navigateTo('교양')">선택 시작</div>
        </div>
    </div>
    <script>
	    function navigateTo(page) {
	        window.location.href = "<%= request.getContextPath() %>/navigate?page=" + page;
	    }
    </script>
</body>
</html>

