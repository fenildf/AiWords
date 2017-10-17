package service;

import dao.BaseWordDao;
import dao.BaseWordDaoImpl;
import domain.Page;
import domain.Word;

import java.util.List;

public class WordService {
    public List<Word> getPageWords(int userId, Page page) {
        BaseWordDao baseWordDao = new BaseWordDaoImpl();
        return baseWordDao.getPageWordsByUserId(userId, page.getPage(), page.getNum());
    }

    public int getMaxPage(int userId, Page page) {
        BaseWordDao baseWordDao = new BaseWordDaoImpl();
        int wordsNum = (int) baseWordDao.getWordsNum(userId);
        double dPage = wordsNum * 1.0 / page.getNum();
        return (int) Math.ceil(dPage);
    }
}
