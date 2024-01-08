/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import javax.swing.JOptionPane;
import com.constant.ServerConstants;
import com.helper.DBUtils;
import com.helper.SMSSender;
import com.helper.StringHelper;
import com.helper.UserModel;
import com.sun.javafx.css.CalculatedValue;
import com.sun.xml.internal.ws.api.ha.StickyFeature;

public class ConnectionManager extends DBUtils {

	public static Connection getDBConnection() {
		Connection conn = null;
		try {
			Class.forName(ServerConstants.db_driver);
			conn = DriverManager.getConnection(ServerConstants.db_url,
					ServerConstants.db_user, ServerConstants.db_pwd);
			System.out.println("Got Connection");
		} catch (SQLException ex) {
			ex.printStackTrace();
			JOptionPane.showMessageDialog(
					null,
					"Please start the mysql Service from XAMPP Console.\n"
							+ ex.getMessage());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		return conn;
	}

	public static UserModel checkLogin(HashMap parameters) {
		String userNameId = StringHelper.n2s(parameters.get("username"));
		String pass = StringHelper.n2s(parameters.get("password"));
		System.out.println("Name :" + userNameId + " and password :" + pass);
		// String pass=new
		// StringEncrypter(StringEncrypter.DESEDE_ENCRYPTION_SCHEME).encrypt(password);
		String query = "SELECT * FROM userdata where username like ? and password like ?";
		UserModel um = null;
		List list = DBUtils.getBeanList(UserModel.class, query, userNameId,
				pass);
		System.out.println("size:" + list.size());

		if (list.size() > 0) {
			um = (UserModel) list.get(0);
			System.out.println("Here in" + (UserModel) list.get(0));
		}
		System.out.println("Here out:" + list.size());
		System.out.println("um::" + um);
		return um;
	}

	public static String registerNewUser(HashMap parameters) {
		System.out.println(parameters);
		System.out.println("register connectionmanager");
		String success = "";
		String sql;
		int list = 0;
		String ngo = StringHelper.n2s(parameters.get("ngo"));
		String fname = StringHelper.n2s(parameters.get("fname"));
		String lname = StringHelper.n2s(parameters.get("lname"));
		String phoneno = StringHelper.n2s(parameters.get("phoneno"));
		String email = StringHelper.n2s(parameters.get("email"));
		String address = StringHelper.n2s(parameters.get("address"));
		String pancardno = StringHelper.n2s(parameters.get("pancardno"));
		String username = StringHelper.n2s(parameters.get("username"));
		String password = StringHelper.n2s(parameters.get("password"));
		String roleid = StringHelper.n2s(parameters.get("roleid"));
		String name = fname + " " + lname;

		if (roleid.equalsIgnoreCase("1")) {
			// ngo
			sql = "insert into userdata (ngo, phoneno, email, address, pancardno, username, password, roleid) "
					+ "values(?,?,?,?,?,?,?,?)";
			list = DBUtils.executeUpdate(sql, ngo, phoneno, email, address,
					pancardno, username, password, roleid);
		} else if (roleid.equalsIgnoreCase("2")) {
			// user

			sql = "insert into userdata (name, phoneno, email, address, pancardno, username, password, roleid)"
					+ " values(?,?,?,?,?,?,?,?)";
			list = DBUtils.executeUpdate(sql, name, phoneno, email, address,
					pancardno, username, password, roleid);

		} else if (roleid.equalsIgnoreCase("3")) {
			// admin
			sql = "insert into userdata (name, phoneno, email, address,  username, password, roleid)"
					+ " values(?,?,?,?,?,?,?)";
			list = DBUtils.executeUpdate(sql, name, phoneno, email, address,
					username, password, roleid);
		}
		if (list > 0) {
			success = "1";
		} else {
			success = "0";
		}

		return success;
	}

	public static com.helper.UserModel getTotalBalance(String userId) {
		String query = "SELECT SUM(tbal) FROM transaction WHERE tuserid  LIKE '"
				+ userId + "' ";
		UserModel um = null;
		List list = DBUtils.getBeanList(UserModel.class, query);
		if (list.size() > 0) {
			um = (UserModel) list.get(0);
			System.out.println("Here in");
		}
		System.out.println("Here out:" + list.size());
		return um;

	}

	public static String getUserName(String uid) {
		String name = "";
		UserModel um = null;
		String query = "SELECT name FROM `userdata` where userid like  "
				+ uid + "";
		List list = DBUtils.getBeanList(UserModel.class, query);
		if (list.size() > 0) {
			um = (UserModel) list.get(0);
			name = um.getName();
			System.out.println("Here in"+			name);
		}
		return name;
	}

	public static com.helper.UserModel getUserId(String pancardno) {
		String query = "SELECT userid FROM userdata where pancardno like '"
				+ pancardno + "'";
		UserModel um = null;
		List list = DBUtils.getBeanList(UserModel.class, query);
		if (list.size() > 0) {
			um = (UserModel) list.get(0);
			System.out.println("Here in");
		}
		System.out.println("Here out:" + list.size());
		return um;
	}

	public static String transferFunds(HashMap parameters) {

		System.out.println(parameters);
		String success = "";

		String userId = StringHelper.n2s(parameters.get("userId"));
		String amount = StringHelper.n2s(parameters.get("amount"));
		String currentBalance = StringHelper.n2s(parameters
				.get("currentBalance"));
		String balance = String.valueOf(Float.parseFloat(amount)
				+ Float.parseFloat(currentBalance));
		if (currentBalance.equalsIgnoreCase("0")) {

			String sqls = "insert into transaction (tuserid, tbal, tamt)"
					+ "values(?,?,?)";
			int lists = DBUtils.executeUpdate(sqls, userId, balance, amount);
			if (lists > 0) {
				success = "Funds Transfered Successfully";
			} else {
				success = "Error Funds Transfered";
			}
		} else {
			String sql = "update transaction set tbal = ? where tuserid = ?;";
			int list = DBUtils.executeUpdate(sql, balance, userId);
			if (list > 0) {
				success = "Funds Transfered Successfully";
			} else {
				success = "Error Funds Transfered";
			}
		}
		return success;
	}

	public static String sendMSGToMobile(String mobile, String message) {

		String sms[] = { mobile };
		System.out.println(":::::" + sms[0]);
		for (int i = 0; i < sms.length; i++) {

			SMSSender sender = new SMSSender(sms[i], message);
			try {
				sender.send();
				Thread.sleep(4000);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return "Y";
	}

	public static String getCsvString(String query) {
		String success = "";
		Connection conn = null;
		ResultSet rs = null;
		StringBuffer sv = new StringBuffer();
		try {
			conn = ConnectionManager.getDBConnection();
			rs = conn.createStatement().executeQuery(query);
			System.out.println("Executing " + query);
			while (rs.next()) {
				success = rs.getString(1);
				sv.append(success + ",");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sv.toString();
	}

	public static void closeConnection(Connection conn) {
		try {
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public static void main(String[] args) {
		getDBConnection();
	}
}
