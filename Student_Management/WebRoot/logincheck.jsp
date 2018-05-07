<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'index.jsp' starting page</title>

		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	</head>

	<body>
		<%
			// 获取用户名和密码
			String strUname = request.getParameter("uname");
			String strUpwd = request.getParameter("upwd");
			// 采用jdbc访问数据库
			// 驱动类的mingzi
			String strClass = "com.mysql.jdbc.Driver";
			// 连接字符串
			String strUrl = "jdbc:mysql://127.0.0.1:3306/student_info_management";
			// 用户名
			String strDBUser = "goodshred";
			// 密码
			String strDBPwd = "123";

			Connection conn;
			Statement st;
			// PreparedStatement  //建议使用。
			ResultSet rs;
			
			int count =0;
			// 加载驱动类
			try {
				Class.forName(strClass);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			try {
				conn = DriverManager.getConnection(strUrl, strDBUser, strDBPwd);
				st = conn.createStatement();
				rs = st.executeQuery("select * from admin where name='"+strUname+"' and password='"+strUpwd+"' ");
				
				while(rs.next())
				{
					count = rs.getInt("rs");
				
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			if(count>0)//？
			{
				request.getRequestDispatcher("/success.jsp").forward(request,response);
			}else{
				request.getRequestDispatcher("/error.jsp").forward(request,response);
			}
		%>
	</body>
</html>