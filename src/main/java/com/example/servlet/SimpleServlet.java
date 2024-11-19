package com.example.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/navigate")
public class SimpleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 요청 인코딩을 UTF-8로 설정 (쿼리 파라미터에 포함된 한글 처리)
        request.setCharacterEncoding("UTF-8");

        // 응답 인코딩을 UTF-8로 설정 (응답에서 한글 처리)
        response.setContentType("text/html; charset=UTF-8");

        String page = request.getParameter("page");

        // 세션을 가져옵니다.
        HttpSession session = request.getSession();

        // 총 학점 및 교양 학점을 설정합니다.
        Integer totalCredits = (Integer) session.getAttribute("totalCredits");
        Integer liberalArtsCredits = (Integer) session.getAttribute("liberalArtsCredits");
        Integer basicCredits = (Integer) session.getAttribute("basicCredits");
        Integer majorCredits = (Integer) session.getAttribute("majorCredits");

        // 초기값 설정
        totalCredits = (totalCredits != null) ? totalCredits : 0;
        liberalArtsCredits = (liberalArtsCredits != null) ? liberalArtsCredits : 0;
        basicCredits = (basicCredits != null) ? basicCredits : 0;
        majorCredits = (majorCredits != null) ? majorCredits : 0;

        // 페이지에 따라 이동
        switch (page) {
            case "교양":
            case "기초소양학문기초":
            case "전공":
                // 세션에 학점 저장
                session.setAttribute("totalCredits", totalCredits);
                session.setAttribute("liberalArtsCredits", liberalArtsCredits);
                session.setAttribute("basicCredits", basicCredits);
                session.setAttribute("majorCredits", majorCredits);

                request.setAttribute("totalCredits", totalCredits);
                request.setAttribute("liberalArtsCredits", liberalArtsCredits);
                request.setAttribute("basicCredits", basicCredits);
                request.setAttribute("majorCredits", majorCredits);
                request.getRequestDispatcher("/" + page + ".jsp").forward(request, response);
                break;
            default:
                response.getWriter().write("페이지를 찾을 수 없습니다.");
                break;
        }
    }

    // 로그아웃 또는 세션 종료 시 호출하여 세션을 무효화하고 학점 초기화
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        // 세션 무효화
        session.invalidate();
        
        // 세션 무효화 후 리다이렉트 또는 다른 작업 수행
        response.sendRedirect(request.getContextPath() + "/login.jsp");  // 예시로 로그인 페이지로 리다이렉트
    }
}

