<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ajaxstudy.contact.domain.*" %>
<%@ page import="com.ajaxstudy.contact.util.*" %>
<%
	// 클라이언트로부터 json데이터를 받아서 ContactList로 변환
	// 하여 여러 명 update가 가능하도록 구현
	request.setCharacterEncoding("UTF-8");
	String status = "ok";
	String message = "";
	
	if(request.getMethod().equals("POST")){
		// 클라이언트의 json 스트림 -> ContactList로 변환
		ContactList contactList = 
			Converter.convertFromJSONStream(
					request.getInputStream(),
					ContactList.class);
		if(contactList == null){
			status = "fail";
			message = "요청 정보 json 데이터 객체 변환 실패";
		}else{
			int count = SampleDAO.updateBatch(contactList);
			if(count > 0){
				message = "총 " + count + "건의 업데이트 성공";
			}else{
				status = "fail";
				message = "업데이트할 데이터가 존재하지 않습니다";
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












