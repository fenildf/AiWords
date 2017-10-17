package dao;

import domain.User;

public interface BaseUserDao {
    User getUserByUsername(String username);

    void addUser(User user);

    User getUserById(int id);

    void updateUserPassword(User user, String newPassword);
}
