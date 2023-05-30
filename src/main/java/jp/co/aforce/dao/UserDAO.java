package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jp.co.aforce.beans.User;

public class UserDAO extends DAO{
	
	
	
	public User search(String id) throws Exception {
		
		User u = new User();
		
		Connection con = getConnection();
		
		PreparedStatement st = con.prepareStatement("SELECT * FROM Login WHERE id = ?");
		st.setString(1, id);
		ResultSet rs = st.executeQuery();
		
		if(rs.next()){
			u.setId(rs.getString("id"));
			u.setPassword(rs.getString("password"));
			u.setName(rs.getString("name"));
			u.setGender(rs.getString("gender"));
			u.setBirthday(rs.getString("birthday"));
			u.setEmail(rs.getString("email"));
			u.setTel(rs.getString("telephone"));
		}
		return u;
	}
	public int insert(User user) throws Exception {
		
		Connection con = getConnection();
		
		PreparedStatement st = con.prepareStatement("INSERT INTO Login VALUES (?, ?, ?, ?, ?, ?, ?)");
		st.setString(1, user.getId());
		st.setString(2, user.getPassword());
		st.setString(3, user.getName());
		st.setString(4, user.getGender());
		st.setString(5, user.getBirthday());
		st.setString(6, user.getEmail());
		st.setString(7, user.getTel());
		int line = st.executeUpdate();
		
		st.close();
		con.close();
		
		return line;
	}
}
