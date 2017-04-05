package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
		res.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = res.getWriter();
		HashMap<String, Object> keyValue = null; 
		try {
			if(command.equals("getPercent")){
				System.out.println("---------------------");
				keyValue = statDAO.getPercent(usrId, sDate, eDate);//일자별 데이터 출력
			}else if(command.equals("getWokrStat")){
				keyValue = statDAO.getWokrStat(usrId, sDate, eDate);// 유형별 통계
			}else if(command.equals("getDayStat")){
				keyValue = statDAO.getDayStat(usrId, sDate, eDate);// 퇴근시간
			}else{
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		
		JSONObject obj = new JSONObject(keyValue);
		//System.out.println(obj.toJSONString());
		out.println(obj.toJSONString());
	}
}
