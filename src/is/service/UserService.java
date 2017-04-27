package is.service;

import java.util.List;

import is.dao.UserDao;
import is.pojo.UserPojo;

public class UserService {
	private UserDao userDao;

	public UserService() {
		this.userDao = new UserDao();
	}

	public UserPojo queryByUsername(String usrname) {
		return userDao.queryByUsername(usrname);
	}

	public List<UserPojo> queryAll() {
		return userDao.queryAll();
	}

	public void create(UserPojo userPojo) {
		userDao.create(userPojo);
	}

	public void update(UserPojo userPojo) {
		userDao.update(userPojo);
	}

	public void delete(UserPojo userPojo) {
		userDao.delete(userPojo);
	}

	public void close() {
		userDao.close();
	}
}
