package dao;

import domain.Word;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.DataBaseUtils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BaseWordDaoImpl implements BaseWordDao {

    @Override
    public void addWord(Word word) {
        QueryRunner queryRunner = new QueryRunner(DataBaseUtils.getDataSource());
        try {
            queryRunner.update("insert into word values(?,?,?,?,?,null)", word.getUid(),
                    word.getWord(), word.getSymbol(), word.getMeaning(), word.getDatetime());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Word> getWordsByUserId(int id) {
        QueryRunner queryRunner = new QueryRunner(DataBaseUtils.getDataSource());
        List<Word> words = null;
        try {
            words = queryRunner.query("select * from word where uid=? order by date desc;", new BeanListHandler<Word>(Word.class), id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return words;
    }

    @Override
    public Word getWordById(int id) {
        QueryRunner queryRunner = new QueryRunner(DataBaseUtils.getDataSource());
        Word word = null;
        try {
            word = queryRunner.query("select * from word where id=?;",
                    new BeanHandler<Word>(Word.class), id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return word;
    }

    @Override
    public void updateWord(Word word) {
        QueryRunner queryRunner = new QueryRunner(DataBaseUtils.getDataSource());
        try {
            queryRunner.update("update word set word=?,symbol=?,meaning=?,date=? where id=?;", word.getWord(),
                    word.getSymbol(), word.getMeaning(), word.getDatetime(), word.getId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteWord(int id) {
        QueryRunner queryRunner = new QueryRunner(DataBaseUtils.getDataSource());
        try {
            queryRunner.update("delete from word where id=?;", id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Word> getPageWordsByUserId(int userid, int page, int num) {
        QueryRunner queryRunner = new QueryRunner(DataBaseUtils.getDataSource());
        List<Word> words = new ArrayList<>();
        try {
            words = queryRunner.query("select * from word where uid=? order by date desc limit ?,?;",
                    new BeanListHandler<Word>(Word.class), userid, (page - 1) * num, num);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return words;
    }

    @Override
    public long getWordsNum(int userid) {
        QueryRunner queryRunner = new QueryRunner(DataBaseUtils.getDataSource());
        Long count = 0L;
        try {
            count = queryRunner.query("select count(*) as p from word where uid=?;",
                    new ScalarHandler<>(), userid);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }


}
