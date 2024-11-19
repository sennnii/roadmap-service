package com.example.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/updateCredits")
public class UpdateCreditsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        try {
            Integer totalCredits = Integer.parseInt(request.getParameter("totalCredits"));
            Integer liberalArtsCredits = Integer.parseInt(request.getParameter("liberalArtsCredits"));
            Integer basicCredits = Integer.parseInt(request.getParameter("basicCredits"));
            Integer majorCredits = Integer.parseInt(request.getParameter("majorCredits"));

            session.setAttribute("totalCredits", totalCredits);
            session.setAttribute("liberalArtsCredits", liberalArtsCredits);
            session.setAttribute("basicCredits", basicCredits);
            session.setAttribute("majorCredits", majorCredits);

            response.setStatus(HttpServletResponse.SC_OK);
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("잘못된 학점 값입니다.");
        }
    }
}
