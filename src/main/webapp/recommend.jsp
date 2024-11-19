<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Collections" %>
<%
    // 세션에서 선택된 과목 리스트 가져오기
    List<String> selectedCourses = (List<String>) session.getAttribute("selectedCourses");
    if (selectedCourses == null) {
        selectedCourses = new ArrayList<>();
    }

    // 영역별 과목 리스트
    List<String> generalCourses = new ArrayList<>(Arrays.asList(
        "커리어디자인", "자아와명상1", "자아와명상2", "불교와인간",
        "소셜앙트레프레너십리더십", "글로벌앙트레프레너십리더십", 
        "테크노앙트레프레너십리더십", "기술보고서작성발표", 
        "Basic EAS", "EAS1", "EAS2", 
        "지혜의역사명작세미나", "존재의역사명작세미나", 
        "경제와사회명작세미나", "자연과기술명작세미나", "문화예술명작세미나"
    ));

    List<String> foundationalCourses = new ArrayList<>(Arrays.asList(
        "기술창조특허", "공학경제", "공학윤리",
        "미적분학연습1", "미적분학연습2", "확률및통계학", 
        "공학선형대수학", "공학수학1", "이산수학",
        "일반물리학실험1", "일반물리학실험2", "물리학개론",
        "일반화학실험1", "일반화학실험2", "화학개론",
        "지구환경과학"
    ));

    List<String> majorCourses = new ArrayList<>(Arrays.asList(
        "시스템소프트웨어", "공개SW프로젝트", "컴퓨터공학종합설계1", "컴퓨터공학종합설계2",
        "객체지향프로그래밍", "자료구조", "운영체제", "알고리즘",
        "데이터베이스", "컴퓨터구조", "네트워크", "인공지능",
        "딥러닝입문", "컴퓨터비전입문", "자연어처리개론", "보안개론"
    ));

    // 과목 영역별 추천 리스트 생성
    generalCourses.removeAll(selectedCourses);
    foundationalCourses.removeAll(selectedCourses);
    majorCourses.removeAll(selectedCourses);

    Collections.shuffle(generalCourses);
    List<String> recommendedGeneralCourses = generalCourses.subList(0, Math.min(3, generalCourses.size()));

    Collections.shuffle(foundationalCourses);
    List<String> recommendedFoundationalCourses = foundationalCourses.subList(0, Math.min(3, foundationalCourses.size()));

    Collections.shuffle(majorCourses);
    List<String> recommendedMajorCourses = majorCourses.subList(0, Math.min(3, majorCourses.size()));
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>추천 과목</title>
    <link rel="stylesheet" href="recommend.css">
</head>
<body>
    <div class="header">
        <div id="team">전과자들</div>
        <hr><br><br>
    </div>

    <!-- h2가 가운데 정렬 되도록 -->
    <div class="container">
        <h2>최종 결과</h2>

        <!-- result-box는 container 아래에 배치됨 -->
        <div class="result-box">
            <div class="score-row">
                <span>교양:     </span>
                <span><%= session.getAttribute("liberalArtsCredits") != null ? session.getAttribute("liberalArtsCredits") : 0 %>     / 17</span>
            </div>
            <div class="score-row">
                <span>기본소양/학문기초(MSC):     </span>
                <span><%= session.getAttribute("basicCredits") != null ? session.getAttribute("basicCredits") : 0 %>     / 30</span>
            </div>
            <div class="score-row">
                <span>전공:     </span>
                <span><%= session.getAttribute("majorCredits") != null ? session.getAttribute("majorCredits") : 0 %>     / 84</span>
            </div>
            <div class="score-row">
                <span>총 이수 학점:     </span>
                <span><%= session.getAttribute("totalCredits") != null ? session.getAttribute("totalCredits") : 0 %>    </span>
            </div>
            <div class="score-row">
                <span>총 남은 학점:     </span>
                <span><%= 150 - (session.getAttribute("totalCredits") != null ? (Integer) session.getAttribute("totalCredits") : 0) %>    </span>
            </div>
        </div>

        <!-- 과목 추천 리스트 -->
        <h3>이 과목부터 수강하는 것을 추천해요</h3>
        <div class="recommend-box">
            <!-- 교양 과목 추천 리스트 -->
            <div class="category">
                <h4>교양</h4>
                <ul>
                    <% for (String course : recommendedGeneralCourses) { %>
                        <li><%= course %></li>
                    <% } %>
                </ul>
            </div>

            <!-- 기본소양/학문기초 과목 추천 리스트 -->
            <div class="category">
                <h4>기본소양/학문기초(MSC/BSM)</h4>
                <ul>
                    <% for (String course : recommendedFoundationalCourses) { %>
                        <li><%= course %></li>
                    <% } %>
                </ul>
            </div>

            <!-- 전공 과목 추천 리스트 -->
            <div class="category">
                <h4>전공</h4>
                <ul>
                    <% for (String course : recommendedMajorCourses) { %>
                        <li><%= course %></li>
                    <% } %>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>