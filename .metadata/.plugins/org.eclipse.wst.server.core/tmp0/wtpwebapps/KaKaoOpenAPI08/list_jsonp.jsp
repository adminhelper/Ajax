<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ajaxstudy.contact.domain.*" %>
<%@ page import="com.ajaxstudy.contact.util.*" %>
<%
	String strPageno = request.getParameter("pageno");
	String strPagesize = request.getParameter("pagesize");
	int pageno = 0;		// 전체 페이지의 의미
	int pagesize = 3;	// 페이지 기본 크기
	try{
		pageno = Integer.parseInt(strPageno);
	}catch(Exception e){
		e.printStackTrace();
	}
	try{
		pagesize = Integer.parseInt(strPagesize);
	}catch(Exception e){
		e.printStackTrace();
	}
	
	ContactList contactList = null;
	// 전체 주소록 데이터
	if(pageno == 0){
		contactList = SampleDAO.getContacts();
	}
	// 일부 주소록 데이터
	else{
		contactList = SampleDAO.getContacts(pageno, pagesize);
	}
	
	// java Object -> json 문자열로 변환
	String json = Converter.convertToJson(contactList);
	
	// JSONP(JSON Padding)을 테스트 하기 위해
	/* callback 파라미터에 등록한 이름이 존재하면
	해당이름() 로 만들어서 전송해라
	즉, 함수 호출 형식으로 전송해라
	*/
	String callback = request.getParameter("callback");
	if(callback != null && !callback.equals("")){
		json = callback + "(" + json + ")";
	}
%>
<%=json %>













