<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시작화면</title>
<style>
    body {
        font-family: "SeoulNamsan", Helvetica;
        color: #426B1F;
    }

    .header {
        padding: 10px;
        display: flex;
        justify-content: space-between;
        font-weight: bold;
        font-family: "SeoulNamsan", Helvetica;
        font-size: 36px;
        margin-bottom: 20px;
    }

    .body {
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: "SeoulNamsan", Helvetica;
        font-weight: bold;
        font-size: 64px;
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
        <br><br><br><br>
        <div class="body">슬기로운 대학생활을 위한<br>4년 로드맵 관리 서비스<br>for 컴공</div><br><br>
        <div class="next-container">
            <div class="next" onclick="navigateTo('설명')">시작하기</div>
        </div>
    </div>
    <script>
        function navigateTo(page) {
            window.location.href = page + ".jsp";
        }
    </script>
</body>
</html>
