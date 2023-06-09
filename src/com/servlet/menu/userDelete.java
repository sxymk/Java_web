package com.servlet.menu;

import com.dao.UserDao;
import com.dao.impl.UserDaoImpl;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/deleteUser")
public class userDelete extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        doPost(request, response);  //将信息使用doPost方法执行   对应jsp页面中的form表单中的method
    }
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String id = request.getParameter("id");
        UserDao userDao = new UserDaoImpl();
        userDao.delete(Integer.parseInt(id));
        request.getRequestDispatcher("/account/list").forward(request, response);
    }
}
