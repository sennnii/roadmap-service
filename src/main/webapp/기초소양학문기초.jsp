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
    <link rel="stylesheet" type="text/css" href="기초소양학문기초.css">
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
       <thead>
           <tr>
               <th>영역</th>
               <th>과목명</th>
               <th colspan="2">이수한 과목을 클릭하세요</th>
           </tr>
       </thead>
       <tbody>
           <tr>
               <th rowspan="1">기본소양</th>
               <td class="clickable" onclick="toggleCourse(this, 3, '기초소양학문기초')">기술창조특허</td>
               <td class="clickable" onclick="toggleCourse(this, 3, '기초소양학문기초')">공학경제</td>
               <td class="clickable" onclick="toggleCourse(this, 3, '기초소양학문기초')">공학윤리</td>
           </tr>
           <tr>
               <th rowspan="2">수학(M) 영역 지정 교과목</th>
               <td class="clickable" onclick="toggleCourse(this, 3, '기초소양학문기초')">미적분학연습1</td>
               <td class="clickable" onclick="toggleCourse(this, 3, '기초소양학문기초')">미적분학연습2</td>
               <td class="clickable" onclick="toggleCourse(this, 3, '기초소양학문기초')">확률및통계학</td>
           </tr>
           <tr>
              <td class="clickable" onclick="toggleCourse(this, 3, '기초소양학문기초')">공학선형대수학</td>
               <td class="clickable" onclick="toggleCourse(this, 3, '기초소양학문기초')">공학수학1</td>
               <td class="clickable" onclick="toggleCourse(this, 3, '기초소양학문기초')">이산수학</td>
           </tr>
           <tr>
               <th rowspan="4">과학(S) 영역 지정 교과목</th>
               <td class="clickable" onclick="toggleCourse(this, 3, '기초소양학문기초')">일반물리학실험1</td>
               <td class="clickable" onclick="toggleCourse(this, 3, '기초소양학문기초')">일반물리학실험2</td>
               <td class="clickable" onclick="toggleCourse(this, 3, '기초소양학문기초')">물리학개론</td>
           </tr>
           <tr>
               <td class="clickable" onclick="toggleCourse(this, 3, '기초소양학문기초')">일반화학학실험1</td>
               <td class="clickable" onclick="toggleCourse(this, 3, '기초소양학문기초')">일반화학학실험2</td>
               <td class="clickable" onclick="toggleCourse(this, 3, '기초소양학문기초')">화학개론</td>
           </tr>
           <tr>
              <td class="clickable" onclick="toggleCourse(this, 3, '기초소양학문기초')">지구환경과학</td>
              <td colspan="2"></td>
           </tr>
       </tbody>
   </table>
   *C영역은 인정하지 않으므로 포함하지 않음

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
