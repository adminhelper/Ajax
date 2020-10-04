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
	
	// Origin을 등록 : http://localhost:8080
	String origin = request.getHeader("origin");
	if(origin.equals("http://localhost:8080")){
		response.setHeader("Access-Control-Allow-Origin", origin);
	}
%>
<%=json %>













