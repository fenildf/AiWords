package service;

import dao.BaseUserDao;
import dao.BaseUserDaoImpl;
import domain.User;

public class UserService {

    private BaseUserDao baseUserDao;

    public UserService(BaseUserDao baseUserDao) {
        this.baseUserDao = baseUserDao;
    }

    public boolean isPasswordMatching(User user) {
//        BaseUserDao baseUserDao = new BaseUserDaoImpl();
        User user1 = baseUserDao.getUserByUsername(user.getUsername());
        return user1 != null && user1.getPassword().equals(user.getPassword());
    }

    public boolean isUserExist(String username) {
//        BaseUserDao baseUserDao = new BaseUserDaoImpl();
        User user = baseUserDao.getUserByUsername(username);
        return user != null;
    }

    public boolean addUser(User user) {
//        BaseUserDao baseUserDao = new BaseUserDaoImpl();
        if (!isUserExist(user.getUsername())) {
            baseUserDao.addUser(user);
            return true;
        }
        return false;
    }
}
