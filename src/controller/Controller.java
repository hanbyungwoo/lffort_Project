package controller;

import java.sql.SQLException;
import java.util.ArrayList;

import model.domain.UsrDTO;
import view.EndView;

public class Controller {
	public static void select() throws SQLException {
		ArrayList<UsrDTO> list = DAO.selectAll();
		EndView.printList(list);
	}

	public static void update(int code, int buy) {
		boolean isSucc = false;
		try {
			isSucc = DAO.update(code, buy);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(isSucc) {
			EndView.printMsg("���ſ� �����߽��ϴ�!!");
		} else {
			EndView.printMsg("���ſ� ���� �̤�");
		}
	}

	public static void insert(UsrDTO UsrDTO) {
		boolean isSucc = false;
		try {
			isSucc = DAO.insert(UsrDTO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(isSucc) {
			EndView.printMsg("��ǰ�߰� ����");
		} else {
			EndView.printMsg("��ǰ�߰� ����");
		}
	}
}
