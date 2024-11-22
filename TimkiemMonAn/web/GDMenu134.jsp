<%-- 
    Document   : GDMenu134
    Created on : Nov 21, 2024, 4:26:02 PM
    Author     : tutran
--%>

<%@page import="model.MonAn134"%>
<%@page import="dao.MonAnDAO134"%>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%@ page import="java.util.List"%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% 
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>


<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Menu món ăn</title>
    <!-- gg fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Josefin+Sans:ital,wght@0,100..700;1,100..700&display=swap" rel="stylesheet" />

  <style>
        *,
        *::before,
        *::after {
            margin: 0;
            padding: 0;
            font-family: "Josefin Sans", sans-serif;
            font-weight: 400;
            font-style: normal;
            box-sizing: border-box;
        }

    h1 {
      text-align: center;
      color: #a366f1;
      font-size: 3em;
      margin-top: 30px;
      margin-bottom: 30px;
    }

    .header {
      text-align: center;
      margin-bottom: 30px;
    }

    .header a {
      margin: 0 20px;
      text-decoration: none;
      color: #a366f1;
      font-size: 1.2em;
      padding: 10px 15px;
      border-radius: 5px;
      transition: background-color 0.3s, color 0.3s;
    }
    .header a:hover {
      background-color: #a366f1;
      color: white;
    }
    form {
      text-align: center;
      margin-bottom: 40px;
    }

    input[type="text"] {
      padding: 15px;
      width: 300px;
      border-radius: 10px;
      border: 1px solid #ccc;
      font-size: 1.2em;
      transition: border-color 0.3s;
    }

    input[type="text"]:focus {
      border-color: #a366f1;
      outline: none;
    }

    input[type="submit"] {
      padding: 15px 30px;
      border-radius: 10px;
      border: none;
      background-color: #a366f1;
      color: white;
      font-size: 1.2em;
      cursor: pointer;
      transition: background-color 0.3s, transform 0.2s;
    }

    input[type="submit"]:hover {
      background-color: #0056b3;
      transform: translateY(-2px);
    }

    table {
      width: 100%;
      max-width: 1200px;
      margin: 0 auto;
      border-collapse: collapse;
      background-color: white;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
      margin-top: 20px;
    }

    th, td {
      padding: 20px;
      text-align: left;
      border: 1px solid #ccc;
      font-size: 1.1em;
    }

    th {
      background-color: #a366f1;
      color: white;
      font-size: 1.2em;
    }

    td a {
      color: #a366f1;
      text-decoration: none;
      transition: color 0.3s;
    }
    td a:hover {
      color: #0056b3;
    }
    p {
      text-align: center;
      font-size: 1.3em;
      margin-top: 30px;
    }
  </style>
</head>
<body>
<div class="header">
  <h1>Tìm kiếm món ăn</h1>
</div>

<form method="post" action="GDMenu134.jsp">
  <input type="text" name="tukhoa" required/><br><br>
  <input type="submit" name="btnTimKiem" value="Tìm Kiếm"/>
</form>

<%
  String tukhoa = request.getParameter("tukhoa");
  if (tukhoa != null && !tukhoa.isEmpty()) {
    MonAnDAO134 monandao = new MonAnDAO134();
    List<MonAn134> danhSachMonAn = monandao.getDSMonAnTheoTuKhoa(tukhoa);
%>
<p>Kết quả tìm kiếm cho: <%= tukhoa%> </p>
<%
    if (danhSachMonAn != null && !danhSachMonAn.isEmpty()) {
%>
<table>
  <tr>
    <th>ID</th>
    <th>Tên Món Ăn</th>
    <th>Giá</th>
  </tr>
  <%for (MonAn134 monAn : danhSachMonAn) {%>
  <tr>
    <td><%= monAn.getId() %></td>
    <td><a href="GDChiTietMonAn.jsp?id=<%= monAn.getId() %>&ten=<%= monAn.getTenMonAn() %>&gia=<%= monAn.getGiaMonAn() %>&mota=<%= monAn.getMoTa() %>">
      <%= monAn.getTenMonAn() %></a></td>
    <td><%= monAn.getGiaMonAn() %>k VNĐ</td>
  </tr>
  <%
    }
  %>
</table>
<%
    } else {
      out.println("<p style = 'color: red;'>Nhà hàng hiện không có món ăn này, quý khách vui lòng tìm kiếm một món ăn khác!</p>");
    }
  } else {
    MonAnDAO134 monandao = new MonAnDAO134();
    List<MonAn134> danhSachMonAn = monandao.getDSMonAn();
    if (danhSachMonAn != null && !danhSachMonAn.isEmpty()) {
%>
<table>
  <tr>
    <th>ID</th>
    <th>Tên Món Ăn</th>
    <th>Giá</th>
  </tr>
  <%for (MonAn134 monAn : danhSachMonAn) {%>
  <tr>
    <td><%= monAn.getId() %></td>
    <td><a href="GDChiTietMonAn.jsp?id=<%= monAn.getId() %>&ten=<%= monAn.getTenMonAn() %>&gia=<%= monAn.getGiaMonAn() %>&mota=<%= monAn.getMoTa() %>">
      <%= monAn.getTenMonAn() %></a></td>
    <td><%= monAn.getGiaMonAn() %>k VNĐ</td>
  </tr>
<%
        
    }
%>
</table>
<%
  }
}
%>
</body>
</html>