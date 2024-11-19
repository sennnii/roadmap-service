<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    Integer totalCredits = (Integer) session.getAttribute("totalCredits");
    Integer liberalArtsCredits = (Integer) session.getAttribute("liberalArtsCredits");
    Integer basicCredits = (Integer) session.getAttribute("basicCredits");
    Integer majorCredits = (Integer) session.getAttribute("majorCredits");

    // 초기값 설정
    totalCredits = (totalCredits != null) ? totalCredits : 0;
    liberalArtsCredits = (liberalArtsCredits != null) ? liberalArtsCredits : 0;
    basicCredits = (basicCredits != null) ? basicCredits : 0;
    majorCredits = (majorCredits != null) ? majorCredits : 0;
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>과목 선후수 관계</title>
    <link rel="stylesheet" type="text/css" href="전공.css">
</head>
<body>
	<div class="container">
	    <div class="header">
	        <div>전과자들</div>
	        <div onclick="navigateTo('교양')">교양</div>
	        <div onclick="navigateTo('기초소양학문기초')">기본소양/학문기초(MSC/BSM)</div>
	        <div onclick="navigateTo('전공')">전공</div>
	        <div onclick="navigateTo('recommend')">다음</div>
	    </div>
	    <hr>
	    
	    <table>
	        <tr>
	            <td class="clickable" data-next="public_sw_project" onclick="toggleVisibility(this); toggleCourse(this, 3, '전공')">어드벤처디자인</td>
	            <td class="hidden" id="public_sw_project" data-next="computer_engineering_project1">공개SW프로젝트</td>
	            <td class="hidden" id="computer_engineering_project1" data-next="computer_engineering_project2">컴퓨터공학종합설계1</td>
	            <td class="hidden" id="computer_engineering_project2" data-next="null">컴퓨터공학종합설계2</td>
	        </tr>
	        <tr>
	            <td class="clickable" data-next="object_oriented_programming,data_communication_intro,advanced_programming,programming_language_theory,data_structure" onclick="toggleVisibility(this); toggleCourse(this, 3, '전공')" rowspan="15">기초프로그래밍</td>
	            <td class="hidden" id="object_oriented_programming" data-next="software_engineering,object_oriented_programming_pattern,web_programming" rowspan="3">객체지향프로그래밍</td>
	            <td class="hidden" id="software_engineering" data-next="null">소프트웨어공학개론</td>
	        </tr>
	        <tr>
	        <td class="hidden" id="object_oriented_programming_pattern" data-next="null">객체지향설계와패턴</td>
	        </tr>
	        <tr>
	            <td class="hidden" id="web_programming" data-next="null">웹프로그래밍</td>
	        </tr>
	        <tr>
	            <td class="hidden" id="data_communication_intro" data-next="null">데이터통신입문</td>
	        </tr>
	        <tr>
	            <td class="hidden" id="advanced_programming" data-next="null">심화프로그래밍</td>
	        </tr>
	        <tr>
	            <td class="hidden" id="programming_language_theory" data-next="null">프로그래밍언어론</td>
	        </tr>
	        <tr>
	            <td class="hidden" id="data_structure" data-next="system_software_practice,algorithm,artificial_intelligence,database,database_design,hci,computer_graphics,bioinformatics_algorithm,quantum_computing" rowspan="9">자료구조</td>
	            <td class="hidden" id="system_software_practice" data-next="operating_system">시스템소프트웨어와실습</td>
	            <td class="hidden" id="operating_system" data-next="embedded_system">운영체제</td>
	            <td class="hidden" id="embedded_system" data-next="null">임베디드시스템</td>
	        </tr>
	        <tr>
	            <td class="hidden" id="algorithm" data-next="algorithm_application">알고리즘</td>
	            <td class="hidden" id="algorithm_application" data-next="null">알고리즘응용</td>
	        </tr>
	        <tr>
	            <td class="hidden" id="artificial_intelligence" data-next="null">인공지능</td>
	        </tr>
	        <tr>
	            <td class="hidden" id="database" data-next="null">데이터베이스</td>
	        </tr>
	        <tr>
	            <td class="hidden" id="database_design" data-next="null">데이터베이스설계</td>
	        </tr>
	        <tr>
	            <td class="hidden" id="hci" data-next="null">인간컴퓨터상호작용</td>
	        </tr>
	        <tr>
	            <td class="hidden" id="computer_graphics" data-next="null">컴퓨터그래픽스</td>
	        </tr>
	        <tr>
	            <td class="hidden" id="bioinformatics_algorithm" data-next="null">바이오인포매틱스알고리즘</td>
	        </tr>
	        <tr>
	            <td class="hidden" id="quantum_computing" data-next="null">양자컴퓨팅</td>
	        </tr>
	        <tr>
	            <td class="clickable" onclick="toggleVisibility(this); toggleCourse(this, 3, '전공')" data-next="computer_organization,formal_language" rowspan="2">이산수학</td>
	            <td class="hidden" id="computer_organization" data-next="computer_structure">컴퓨터구성</td>
	            <td class="hidden" id="computer_structure" data-next="null">컴퓨터구조</td>
	        </tr>
	        <tr>
	            <td class="hidden" id="formal_language" data-next="compiler_design">형식언어</td>
	            <td class="hidden" id="compiler_design" data-next="null">컴파일러구성</td>
	        </tr>
	        <tr>
	            <td class="clickable" data-next="machine_learning" onclick="toggleVisibility(this); toggleCourse(this, 3, '전공')">확률및통계학</td>
	            <td class="hidden" id="machine_learning" data-next="null">머신러닝</td>
	        </tr>
	
	    </table>
	    <hr>
	    <table>
	        <tr>
	            <td class="clickable" onclick="toggleCourse(this, 3, '전공')">인공지능수학</td>
	            <td class="clickable" onclick="toggleCourse(this, 3, '전공')">게임프로그래밍</td>
	            <td class="clickable" onclick="toggleCourse(this, 3, '전공')">디지털영상처리</td>
	            <td class="clickable" onclick="toggleCourse(this, 3, '전공')">게임엔진프로그래밍</td>
	            <td class="clickable" onclick="toggleCourse(this, 3, '전공')">디지털신호처리</td>
	        </tr>
	        <tr>
	            <td class="clickable" onclick="toggleCourse(this, 3, '전공')">다변량및시계열데이터분석</td>
	            <td class="clickable" onclick="toggleCourse(this, 3, '전공')">컴파일러</td>
	            <td class="clickable" onclick="toggleCourse(this, 3, '전공')">컴퓨터네트워크</td>
	            <td class="clickable" onclick="toggleCourse(this, 3, '전공')">병렬처리</td>
	            <td class="clickable" onclick="toggleCourse(this, 3, '전공')">딥러닝입문</td>
	        </tr>
	        <tr>
	            <td class="clickable" onclick="toggleCourse(this, 3, '전공')">컴퓨터보안</td>
	            <td class="clickable" onclick="toggleCourse(this, 3, '전공')">가상현실</td>
	            <td class="clickable" onclick="toggleCourse(this, 3, '전공')">컴퓨터비전입문</td>
	            <td class="clickable" onclick="toggleCourse(this, 3, '전공')">자연어처리개론</td>
	            <td class="clickable" onclick="toggleCourse(this, 3, '전공')">병렬처리</td>
	        </tr>
	        <tr>
	            <td class="clickable" onclick="toggleCourse(this, 3, '전공')">웹서비스보안</td>
	            <td class="clickable" onclick="toggleCourse(this, 3, '전공')">암호학과네트워크보안</td>
	            <td class="clickable" onclick="toggleCourse(this, 3, '전공')">계산적사고법</td>
	            <td class="clickable" onclick="toggleCourse(this, 3, '전공')">모바일컴퓨팅</td>
	            <td class="clickable" onclick="toggleCourse(this, 3, '전공')">S/W품질관리및테스팅</td>
	        </tr>
	        <tr>
	            <td class="clickable" onclick="toggleCourse(this, 3, '전공')">SW비지니스와창업</td>
	            <td class="clickable" onclick="toggleCourse(this, 3, '전공')">테크니컬프레젠테이션</td>
	            <td class="clickable" onclick="toggleCourse(this, 3, '전공')">데이터분석및실습</td>
	        </tr>
	    </table>
	    <div class="footer">
	        <table>
	            <tr>
	                <th>총 이수 학점: <span id="totalCredits"><%= totalCredits %></span> /130 점</th>
	                <th>교양: <span id="liberalArtsCredits"><%= liberalArtsCredits %></span> / 17 점</th>
	                <th>기초소양/학문기초: <span id="basicCredits"><%= basicCredits %></span> / 30 점</th>
	                <th>전공: <span id="majorCredits"><%= majorCredits %></span> / 84 점</th>
	            </tr>
	        </table>
	    </div>
	</div>

    <script>
        let currentTotalCredits = <%= totalCredits %>;
        let currentLiberalArtsCredits = <%= liberalArtsCredits %>;
        let currentBasicCredits = <%= basicCredits %>;
        let currentMajorCredits = <%= majorCredits %>;
	    function toggleCourse(element, credits, type) {
	        const courseName = element.textContent.trim(); // 과목명 가져오기
	        const isClicked = element.classList.toggle("clicked");
	
	        // 클릭 상태에 따라 총 학점 및 세션 데이터 업데이트
	        const change = isClicked ? credits : -credits;
	        currentTotalCredits += change;
	
	        if (type === '교양') {
	            currentLiberalArtsCredits += change;
	        } else if (type === '기초소양학문기초') {
	            currentBasicCredits += change;
	        } else if (type === '전공') {
	            currentMajorCredits += change;
	        }
	
	        // 화면에 학점 업데이트
	        document.getElementById("totalCredits").innerText = currentTotalCredits;
	        document.getElementById("liberalArtsCredits").innerText = currentLiberalArtsCredits;
	        document.getElementById("basicCredits").innerText = currentBasicCredits;
	        document.getElementById("majorCredits").innerText = currentMajorCredits;
	
	        // 세션에 과목 상태 업데이트 (AJAX 요청)
	        updateSessionCourses(courseName, isClicked);
	        updateSessionCredits();
	    }

        function toggleVisibility(element) {
            let nextElementsIds = element.getAttribute('data-next').split(',');  // data-next 속성을 콤마로 구분하여 배열로 만듦

            nextElementsIds.forEach(function(nextElementId) {
                let nextElement = document.getElementById(nextElementId);

                if (nextElement && nextElement.classList.contains('hidden')) {
                    nextElement.classList.remove('hidden');
                    nextElement.classList.add('clickable');
                    nextElement.setAttribute('onclick', 'toggleVisibility(this); toggleCourse(this, 3, "전공");');
                    element.classList.add('active');
                }
            });

            // "null"인 경우에도 active 클래스 추가
            if (element.getAttribute('data-next') === "null") {
                element.classList.add('active');
            }
        }

        function navigateTo(page) {
            if (page === 'recommend') {
                window.location.href = "<%= request.getContextPath() %>/recommend.jsp";
            } else {
                window.location.href = "<%= request.getContextPath() %>/" + page + ".jsp";
            }
        }
        
        
        function updateSessionCourses(courseName, isAdded) {
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "<%= request.getContextPath() %>/updateCourses", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.send("courseName=" + encodeURIComponent(courseName) + "&isAdded=" + isAdded);
        }
        function updateSessionCredits() {
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "<%= request.getContextPath() %>/updateCredits", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.send("totalCredits=" + currentTotalCredits + "&liberalArtsCredits=" + currentLiberalArtsCredits + "&basicCredits=" + currentBasicCredits + "&majorCredits=" + currentMajorCredits);
        }
    </script>
</body>
</html>
