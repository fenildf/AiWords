package dao;

import domain.User;
import domain.Word;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.junit.Test;
import utils.DataBaseUtils;

import java.sql.SQLException;
import java.util.List;

public class test {

    @Test
    public void testLink() {
        QueryRunner queryRunner = new QueryRunner(DataBaseUtils.getDataSource());
        List<User> users;
        try {
            users = queryRunner
                    .query("select * from user;", new BeanListHandler<User>(User.class));
            for (User user : users) {
                System.out.println(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testAdd() {
        Word word = new Word();
        word.setUid(1);
        word.setWord("her");
        word.setMeaning("她t他她t他她t他她t他她t他她t他她t他她t他她t他她t他她t他她t他她t他她t他她t他她t他");
        BaseWordDao baseWordDao = new BaseWordDaoImpl();
        baseWordDao.addWord(word);
    }

    @Test
    public void testQueryWordById() {
        BaseWordDao baseWordDao = new BaseWordDaoImpl();
        List<Word> words = baseWordDao.getWordsByUserId(1);
        if (words == null) {
            return;
        }
        for (Word word : words) {
            System.out.println(word);
        }
    }

    @Test
    public void testGetWordById() {
        BaseWordDao baseWordDao = new BaseWordDaoImpl();
        Word word = baseWordDao.getWordById(4);
        if (word != null) {
            System.out.println(word);
        }
    }

    @Test
    public void testGetUserById() {
        BaseUserDao baseUserDao = new BaseUserDaoImpl();
        User user = baseUserDao.getUserById(1);
        System.out.println(user);
    }

    @Test
    public void testGetWords() {
        int userid = 1;
        BaseWordDao baseWordDao = new BaseWordDaoImpl();
        int wordsNum = (int) baseWordDao.getWordsNum(userid);
        System.out.println(wordsNum);
    }
}
