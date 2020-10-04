<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ajaxstudy.contact.domain.*" %>
<%@ page import="com.ajaxstudy.contact.util.*" %>
<%
	// POST 방식을 사용
	request.setCharacterEncoding("UTF-8");
	String status = "ok";
	String message = "";
	
	if(request.getMethod().equals("POST")){
		
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		
		if(name==null || name.equals("") ||
		   tel==null || tel.equals("")){
			status = "fail";
			message = "이름과 전화번호는 필수입력사항입니다";
		}else{
			Contact c = new Contact(0, name, tel, address);
			SampleDAO.addContact(c);
			message = "일련번호 " + c.getNo() + 
					"번 데이터가 추가되었습니다";
		}
		
		
	}else{
		status = "fail";
		message = "POST 메서드만 지원합니다";
	}
%>
{
	"status" : "<%=status %>",
	"message" : "<%=message %>"
}













