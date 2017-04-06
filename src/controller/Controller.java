package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

//x, y 좌표값 요청 및 응답
public class Controller extends HttpServlet{
   
   public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
      //System.out.println("-jk[---------------");
      String command = req.getParameter("command");
      String usrId = req.getParameter("usrId");
      String sDate = req.getParameter("sDate");
      String eDate = req.getParameter("eDate");
      String todoType = req.getParameter("todoType");
      String desc = req.getParameter("desc");
      int percent = Integer.parseInt(req.getParameter("percent"));
      res.setContentType("text/html;charset=utf-8");
      
      PrintWriter out = res.getWriter();
      HashMap<String, Object> keyValue = null; 
      ArrayList<String> list = null;
		JSONObject obj = null;
      try {
         if(command.equals("getPercent")){
           // System.out.println("---------------------");
            keyValue = statDAO.getPercent(usrId, sDate, eDate);//일자별 데이터 출력
            obj = new JSONObject(keyValue);
			out.println(obj.toJSONString());
         }else if(command.equals("getWokrStat")){
            keyValue = statDAO.getWokrStat(usrId, sDate, eDate);// 유형별 통계
            obj = new JSONObject(keyValue);
			out.println(obj.toJSONString());
         }else if(command.equals("getDayStat")){
            keyValue = statDAO.getDayStat(usrId, sDate, eDate);// 퇴근시간
            obj = new JSONObject(keyValue);
			out.println(obj.toJSONString());
         }else if(command.equals("del")){
        	 System.out.println("=====================================");
        	 System.out.println("=====================================");
        	 System.out.println("=====================================");
        	 System.out.println("=====================================");
            System.out.println(usrId + " , " + todoType + " , " + desc + " ,  " + percent);
            //res.sendRedirect("/lffort_project/DetailWork?page=1&usrid="+usrId);
            boolean isSucc = ToDoDAO.del(usrId, todoType, desc, percent);
            if(isSucc){
            	 System.out.println("=====================================");
            	 System.out.println("================삭제완료=================");
            	 System.out.println("=====================================");
            }
            res.sendRedirect("./jsp/DetailWork.jsp?page=1&usrid="+usrId);
         } else if (command.equals("selectAllTodo")) {
				System.out.println(sDate + " , " + eDate);
				// Date Parsing

				String[] sArr = sDate.split("/");
				String[] eArr = eDate.split("/");
				String sD = sArr[2] + "-" + sArr[0] + "-" + sArr[1];
				String eD = eArr[2] + "-" + eArr[0] + "-" + eArr[1];

				list = statDAO.selectAllTodo(sD, eD);// 모든일정
				String msg = list.toString(); // String 으로 변환
				System.out.println(msg);
				req.setAttribute("todo", msg);
				out.println(msg);
				// req.setAttribute("todoList", msg);

			}else{
  
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }      
      
   
   }
}