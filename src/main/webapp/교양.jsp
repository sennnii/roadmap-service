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

    // 클릭한 과목을 세션에 저장
    String clickedCourse = (String) session.getAttribute("clickedCourse");
    clickedCourse = (clickedCourse != null) ? clickedCourse : "";
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>과목 선택 페이지</title>
    <link rel="stylesheet" type="text/css" href="교양.css">
</head>
<body>

<div class="container">
    <!-- 헤더 영역 -->
    <div class="header">
        <div>전과자들</div>
        <div onclick="navigateTo('교양')">교양</div>
        <div onclick="navigateTo('기초소양학문기초')">기본소양/학문기초(MSC/BSM)</div>
        <div onclick="navigateTo('전공')">전공</div>
        <div onclick="navigateTo('recommend')">다음</div>
    </div>
    <hr>

    <!-- 과목 테이블 -->
    <table>
        <tr>
            <th>영역</th>
            <th>과목명</th>
            <th colspan="2">이수한 과목을 클릭하세요</th>
        </tr>
        <tr>
            <th>대학생활탐구</th>
            <td class="clickable" onclick="toggleCourse(this, 1, '교양')">커리어디자인</td>
            <td></td>
        </tr>
        <tr>
            <th rowspan="3">자아성찰</th>
            <td class="clickable" onclick="toggleCourse(this, 1, '교양')">자아와 명상1</td>
            <td class="clickable" onclick="toggleCourse(this, 1, '교양')">자아와 명상2</td>
            <td class="clickable" onclick="toggleCourse(this, 2, '교양')">불교와인간</td>
        </tr>
        <tr>
            <td class="clickable" onclick="toggleCourse(this, 2, '교양')">소셜앙트레프레너십리더십</td>
            <td class="clickable" onclick="toggleCourse(this, 2, '교양')">글로벌앙트레프레너십리더십</td>
            <td class="clickable" onclick="toggleCourse(this, 2, '교양')">테크노앙트레프레너십리더십</td>
        </tr>
        <tr>
            <td style="color:#666666">디지털시대의글쓰기</td>
            <td class="clickable" onclick="toggleCourse(this, 3, '교양')">기술보고서작성발표</td>
            <td style="color:#666666">외국인을 위한 대학글쓰기</td>
        </tr>
        <tr>
            <th>영어</th>
            <td class="clickable" onclick="toggleCourse(this, 2, '교양')">Basic EAS</td>
            <td class="clickable" onclick="toggleCourse(this, 2, '교양')">EAS1</td>
            <td class="clickable" onclick="toggleCourse(this, 2, '교양')">EAS2</td>
        </tr>
        <tr>
            <th rowspan="2">세계명작세미나</th>
            <td class="clickable" onclick="toggleCourse(this, 3, '교양')">지혜의역사명작세미나</td>
            <td class="clickable" onclick="toggleCourse(this, 3, '교양')">존재의역사명작세미나</td>
            <td class="clickable" onclick="toggleCourse(this, 3, '교양')">경제와사회명작세미나</td>
        </tr>
        <tr>
            <td class="clickable" onclick="toggleCourse(this, 3, '교양')">자연과기술명작세미나</td>
            <td class="clickable" onclick="toggleCourse(this, 3, '교양')">문화예술명작세미나</td>
            <td></td>
        </tr>
    </table>


    <!-- 하단 요약 영역 -->
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

    function navigateTo(page) {
        if (page === 'recommend') {
            window.location.href = "<%= request.getContextPath() %>/recommend.jsp";
        } else {
            window.location.href = "<%= request.getContextPath() %>/" + page + ".jsp";
        }
    }
    
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
