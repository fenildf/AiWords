package dao;

import domain.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import utils.DataBaseUtils;

import java.sql.SQLException;

public class BaseUserDaoImpl implements BaseUserDao {

    @Override
    public User getUserByUsername(String username) {
        QueryRunner queryRunner = new QueryRunner(DataBaseUtils.getDataSource());
        User user = null;
        try {
            user = queryRunner.query("select * from user where username=?;",
                    new BeanHandler<User>(User.class), username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public void addUser(User user) {
        QueryRunner queryRunner = new QueryRunner(DataBaseUtils.getDataSource());
        try {
            queryRunner.update("insert into user values(null,?,?);", user.getUsername(), user.getPassword());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public User getUserById(int id) {
        QueryRunner queryRunner = new QueryRunner(DataBaseUtils.getDataSource());
        User user = null;
        try {
            user = queryRunner.query("select * from user where id=?;",
                    new BeanHandler<User>(User.class), id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public void updateUserPassword(User user, String newPassword) {
        QueryRunner queryRunner = new QueryRunner(DataBaseUtils.getDataSource());
        try {
            queryRunner.update("update user set password=? where username=?;", newPassword, user.getUsername());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
