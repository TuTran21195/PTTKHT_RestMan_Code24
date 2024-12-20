<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Chọn Thời Gian Thống Kê</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Chọn font chữ hiện đại và dễ đọc */
            margin: 0; /* Xóa margin mặc định */
            padding: 0; /* Xóa padding mặc định */
            background-color: #f0f0f0; /* Màu nền nhẹ nhàng */
        }
        .container {
            display: flex; /* Sử dụng flexbox để căn giữa nội dung */
            flex-direction: column; /* Đặt chiều dọc cho flexbox */
            align-items: center; /* Căn giữa theo chiều ngang */
            margin-top: 50px; /* Khoảng cách từ đầu trang */
        }
        form {
            background-color: white; /* Màu nền cho form */
            padding: 50px; /* Khoảng cách bên trong form */
            border-radius: 10px; /* Bo góc cho form */
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1); /* Đổ bóng cho form */
            width: 450px; /* Chiều rộng của form */
            text-align: center; /* Căn giữa nội dung trong form */
        }
        h2 {
            margin-bottom: 30px; /* Khoảng cách giữa tiêu đề và form */
            font-weight: bold; /* Chữ đậm cho tiêu đề */
            font-size: 28px; /* Kích thước chữ cho tiêu đề */
            color: #333; /* Màu chữ cho tiêu đề */
        }
        label {
            display: block; /* Hiển thị label dưới dạng khối */
            margin-bottom: 8px; /* Khoảng cách giữa label và input */
            color: #555; /* Màu chữ cho label */
        }
        input[type="date"] {
            width: 100%; /* Chiều rộng đầy đủ */
            padding: 12px; /* Khoảng cách bên trong input */
            margin: 10px 0; /* Khoảng cách trên và dưới input */
            border: 1px solid #ccc; /* Đường viền cho input */
            border-radius: 4px; /* Bo góc cho input */
            font-size: 16px; /* Kích thước chữ cho input */
            box-sizing: border-box; /* Bao gồm padding và border trong width */
        }
        input[type="submit"] {
            width: 100%; /* Chiều rộng đầy đủ */
            padding: 12px; /* Khoảng cách bên trong nút submit */
            background-color: #007bff; /* Màu nền cho nút submit */
            color: white; /* Màu chữ cho nút submit */
            font-size: 16px; /* Kích thước chữ cho nút submit */
            font-weight: bold; /* Chữ đậm cho nút submit */
            border: none; /* Xóa đường viền cho nút submit */
            border-radius: 4px; /* Bo góc cho nút submit */
            cursor: pointer; /* Con trỏ chuột khi di chuột qua nút submit */
            transition: background-color 0.3s; /* Hiệu ứng chuyển đổi cho nút */
            margin-top: 40px; /* Thêm khoảng cách trên nút submit */
            /* Đặt chiều rộng theo % nếu muốn dãn ra hơn nữa */
            /* width: calc(100% + 20px);  // Ví dụ dãn ra thêm 20px */
        }
        input[type="submit"]:hover {
            background-color: #007bff; /* Màu nền khi di chuột qua nút submit */
        }
                body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }
        .container {
            background-color: #fff; /* Màu nền cho thẻ div */
            padding: 40px; /* Khoảng cách bên trong */
            border-radius: 8px; /* Bo góc cho thẻ div */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Đổ bóng */
        }
        h2 {
            color: #333;
            text-align: center;
        }
        h3 {
            text-align: center;
            color: #007bff;
            font-size: 1.5em;
            margin: 10px 0;
            font-weight: bold;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        .no-data {
            color: #ff0000;
            font-weight: bold;
        }
        .currency {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <form action="GDDanhSachKhachHang252.jsp" method="post">
        <h2>Chọn Thời Gian Thống Kê</h2>

        <label for="dteThoiGianBatDau">Chọn thời gian bắt đầu:</label>
        <input type="date" id="dteThoiGianBatDau" name="dteThoiGianBatDau" required
               min="2023-01-01" max="2024-12-31" /> <!-- Thêm min và max nếu cần -->

        <label for="dteThoiGianKetThuc">Chọn thời gian kết thúc:</label>
        <input type="date" id="dteThoiGianKetThuc" name="dteThoiGianKetThuc" required
               min="2023-01-01" max="2024-12-31" /> <!-- Thêm min và max nếu cần -->

        <input type="submit" value="Xem Thống Kê Khách Hàng">
    </form>
<!--========================DANH SÁCH ĐƠN HÀNG==========================================-->
    <h2>Danh Sách Đơn Hàng</h2>
    <%
        String tenKhachHang = request.getParameter("ten");
        if (tenKhachHang != null) {
    %>
    <h3><%= tenKhachHang %></h3>
    <%
        }
    %>
    <table>
        <tr>
            <th>Ngày</th>
            <th>Thời Gian</th>
            <th>Hóa Đơn</th>
        </tr>
        <%
            try {
                String khachHangIdStr = request.getParameter("id");
                String thoiGianBatDauStr = request.getParameter("dteThoiGianBatDau");
                String thoiGianKetThucStr = request.getParameter("dteThoiGianKetThuc");

                int khachHangId = Integer.parseInt(khachHangIdStr);
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

                Date thoiGianBatDau = dateFormat.parse(thoiGianBatDauStr);
                Date thoiGianKetThuc = dateFormat.parse(thoiGianKetThucStr);

                HoaDon252DAO hoaDonDAO = new HoaDon252DAO();
                List<HoaDon252> danhSachDonHang = hoaDonDAO.getDanhSachDonHang(khachHangId, thoiGianBatDau, thoiGianKetThuc);

                DecimalFormatSymbols decimalFormatSymbols = new DecimalFormatSymbols();
                decimalFormatSymbols.setGroupingSeparator('.');

                NumberFormat currencyFormat = NumberFormat.getInstance();
                currencyFormat.setGroupingUsed(true);
                currencyFormat.setMinimumFractionDigits(0);
                ((java.text.DecimalFormat) currencyFormat).setDecimalFormatSymbols(decimalFormatSymbols);

                if (danhSachDonHang != null && !danhSachDonHang.isEmpty()) {
                    for (HoaDon252 hoaDon : danhSachDonHang) {
        %>
        <tr style="cursor: pointer;" onclick="window.location.href='GDChiTietDonHang252.jsp?id=<%= hoaDon.getId() %>&ten=<%=tenKhachHang%>'">
            <td><%= new SimpleDateFormat("dd/MM/yyyy").format(hoaDon.getNgay()) %></td>
            <td><%= new SimpleDateFormat("HH:mm:ss").format(hoaDon.getThoigian()) %></td>
            <td class="currency"><%= currencyFormat.format(hoaDon.getTonghoadon()) + " VNĐ" %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="3" class="no-data">Không có đơn hàng nào trong khoảng thời gian đã chọn.</td>
        </tr>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        %>
        <tr>
            <td colspan="3" class="no-data">Đã xảy ra lỗi khi lấy danh sách đơn hàng.</td>
        </tr>
        <%
            }
        %>
    </table>
</div>
</body>
</html>