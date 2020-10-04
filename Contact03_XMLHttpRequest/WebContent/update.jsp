<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ajaxstudy.contact.domain.*" %>
<%@ page import="com.ajaxstudy.contact.util.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String status = "ok";
	String message = "";
	
	if(request.getMethod().equals("POST")){
		
		long no = 0;
		try{
			no = Long.parseLong(request.getParameter("no"));
		}catch(Exception e){
			e.printStackTrace();
		}
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		
		if(name==null || name.equals("") ||
		   tel==null || tel.equals("")){
			status = "fail";
			message = "수정을 원하면 이름과 전화번호는 필수";
		}else{
			Contact c = new Contact(no, name, tel, address);
			int count = SampleDAO.updateContact(c);
			if(count == 1){
				status = "ok";
				message = "일련번호 " + c.getNo() + 
						"번 데이터가 수정되었습니다";
			}
			// count == 0 인 경우
			else{
				status = "fail";
				message = "수정하려는 데이터가 존재하지 않습니다";
			}
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













