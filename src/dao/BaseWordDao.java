package dao;

import domain.Word;

import java.util.List;

public interface BaseWordDao {
    void addWord(Word word);

    List<Word> getWordsByUserId(int id);

    Word getWordById(int id);

    void updateWord(Word word);

    void deleteWord(int id);

    List<Word> getPageWordsByUserId(int userid, int page, int num);

    long getWordsNum(int userid);

}
