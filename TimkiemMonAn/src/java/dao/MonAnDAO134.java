package dao;

import model.MonAn134;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class MonAnDAO134 {
     public List<MonAn134> getDSMonAnTheoTuKhoa(String tuKhoa)throws  SQLException, ClassNotFoundException{
         List<MonAn134> listMonAn = new ArrayList<>();
         String query = "SELECT id, tenMonAn, giaMonAn, moTa FROM monan134 WHERE tenMonAn LIKE ?";
         
         java.sql.Connection connection = DBConnection134.getConnection();
         PreparedStatement statement = connection.prepareStatement(query);
         String tutimkiem = "%" + tuKhoa + "%";
         statement.setString(1, tutimkiem);
         
//         đưa các định dạng về vùng VN
         NumberFormat formatter = NumberFormat.getInstance(new Locale("vi", "VN"));
          
         ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            MonAn134 monAn = new MonAn134();
                    monAn.setId(String.valueOf(resultSet.getInt("id")));
                    monAn.setTenMonAn(resultSet.getString("tenMonAn"));

                    // Định dạng giá tiền Việt Nam
                    double gia = resultSet.getDouble("giaMonAn");
                    String giaFormatted = formatter.format(Math.round(gia));
                    monAn.setGiaMonAn(giaFormatted);

                    monAn.setMoTa(resultSet.getString("moTa"));
                    listMonAn.add(monAn);
        }
         return listMonAn;
     }
     public List<MonAn134> getDSMonAn()throws  SQLException, ClassNotFoundException{
         List<MonAn134> listMonAn = new ArrayList<>();
         String query = "SELECT id, tenMonAn, giaMonAn, moTa FROM monan134 ";
         
         java.sql.Connection connection = DBConnection134.getConnection();
         PreparedStatement statement = connection.prepareStatement(query);
         
//         đưa các định dạng về vùng VN
         NumberFormat formatter = NumberFormat.getInstance(new Locale("vi", "VN"));
          
         ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            MonAn134 monAn = new MonAn134();
                    monAn.setId(String.valueOf(resultSet.getInt("id")));
                    monAn.setTenMonAn(resultSet.getString("tenMonAn"));

                    // Định dạng giá tiền Việt Nam
                    double gia = resultSet.getDouble("giaMonAn");
                    String giaFormatted = formatter.format(Math.round(gia));
                    monAn.setGiaMonAn(giaFormatted);

                    monAn.setMoTa(resultSet.getString("moTa"));
                    listMonAn.add(monAn);
        }
         return listMonAn;
     }
}
