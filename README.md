# 🎓 슬기로운 대학생활 - 4년 로드맵 관리 서비스

**동국대학교 컴퓨터공학전공 23학번**을 위한 맞춤형 웹 애플리케이션입니다.  
효율적인 수강 계획 수립과 관리, 전공 이수 체계 파악을 통해 더 나은 대학생활을 설계하세요.

![Java](https://img.shields.io/badge/Java-Servlet-orange?style=flat-square)
![JSP](https://img.shields.io/badge/JSP-Supported-blueviolet?style=flat-square)
![For 동국대](https://img.shields.io/badge/Target-DGU_23학번-important?style=flat-square)

---

## 🌟 주요 기능

| 기능 | 설명 |
|------|------|
| 🔄 수강한 강의 삭제 | 이미 들은 강의를 삭제하여 로드맵 갱신 |
| 📌 수강 예정 강의 추천 | 아직 듣지 않은 필수/권장 과목을 알림 |
| 🧭 선후수 과목 시각화 | 과목 간 선후수 관계를 시각적으로 표시하여 학기별 계획에 도움 |
| 📊 전공/교양 구분 관리 | 전공, 기초, 교양 등 카테고리별로 정리된 UI |
| 🧾 학점 계산 | 학기별/전체 이수 학점 계산 기능 제공 |

---

## 🛠️ 기술 스택

- **Java Servlet & JSP**
- HTML, CSS, JavaScript
- 구조화된 `tokens.json` 기반 데이터 처리
- 단일 서버 기반 정적/동적 웹 페이지 구성

---

## 🗂️ 주요 파일 구조

```bash
📁 src/main/java/com/example/servlet
 ┣ 📄Course.java                   # 과목 객체 정의
 ┣ 📄SimpleServlet.java            # 메인 서블릿
 ┣ 📄UpdateCoursesServlet.java     # 강의 삭제 처리
 ┗ 📄UpdateCreditsServlet.java     # 학점 갱신 처리

📁 src/main/webapp/
 ┣ 📄시작.jsp, 설명.jsp              # 메인 화면 & 가이드
 ┣ 📄전공.jsp, 교양.jsp 등           # 카테고리별 JSP 페이지
 ┣ 📄recommend.jsp                 # 추천 강의 뷰
 ┗ 📄*.css                         # 각 페이지별 스타일

📄 index.html                      # 시작 페이지
📄 tokens.json                     # 과목 정보 JSON 포맷
```
---
## 🚀 실행 방법
```bash
1. 이 프로젝트를 Eclipse 또는 IntelliJ에 import합니다.
   - Eclipse 기준: File > Import > Existing Projects into Workspace
   - Dynamic Web Project로 설정되어 있어야 합니다.

2. Apache Tomcat 서버를 설정 후, 해당 프로젝트를 배포합니다.

3. 브라우저에서 아래 주소로 접속합니다:
   http://localhost:8080/roadmap-service/
```
---
## 🎯 타겟 사용자
- 동국대학교 컴퓨터공학전공 23학번
- 전공 커리큘럼을 체계적으로 관리하고 싶은 학생
- 4년간의 수강 계획을 미리 시각화하고 싶은 사람


