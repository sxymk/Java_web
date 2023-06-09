package com.servlet.fee;

import com.dao.FeeDao;
import com.dao.impl.FeeDaoImpl;
import com.entity.record.EleRecord;
import com.entity.record.WaterRecord;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/fee/eleList3")
public class resiEle extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);  //将信息使用doPost方法执行   对应jsp页面中的form表单中的method
    }
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        FeeDao feeDao = new FeeDaoImpl();
        List<EleRecord> list = null;
        try {
            list  = feeDao.getEleByHid(Integer.parseInt(name),1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("eleList",list);
        request.getRequestDispatcher("/page/client/ele.jsp").forward(request, response);
    }

}
