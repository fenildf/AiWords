package service;

import domain.Page;
import domain.Word;
import org.junit.Test;

import java.util.List;

public class WordServiceTest {
    @Test
    public void testpage() {
        Page page = new Page();
        page.setPage(1);
        page.setNum(5);
        WordService wordService = new WordService();
        List<Word> words = wordService.getPageWords(1, page);
        for (Word word : words) {
            System.out.println(word);
        }
    }
    @Test
    public void testmaxpage() {
        Page page = new Page();
        page.setPage(1);
        page.setNum(5);
        WordService wordService = new WordService();
        int maxPage = wordService.getMaxPage(1, page);
        System.out.println(maxPage);
    }
}
