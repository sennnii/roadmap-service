package com.example.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateCourses")
public class UpdateCoursesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        String courseName = request.getParameter("courseName");
        boolean isAdded = Boolean.parseBoolean(request.getParameter("isAdded"));

        // 세션에 저장된 선택 과목 리스트 가져오기
        @SuppressWarnings("unchecked")
        List<String> selectedCourses = (List<String>) session.getAttribute("selectedCourses");
        if (selectedCourses == null) {
            selectedCourses = new ArrayList<>();
        }

        if (isAdded) {
            if (!selectedCourses.contains(courseName)) {
                selectedCourses.add(courseName);
            }
        } else {
            selectedCourses.remove(courseName);
        }

        // 세션에 업데이트
        session.setAttribute("selectedCourses", selectedCourses);
        response.setStatus(HttpServletResponse.SC_OK);
    }
}
