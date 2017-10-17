package domain;

import java.util.Date;

public class Word {
    private int id;
    private int uid;
    private String word;
    private String symbol;
    private String meaning;
    private Date datetime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getWord() {
        return word;
    }

    public void setWord(String word) {
        this.word = word;
    }

    public String getSymbol() {
        return symbol;
    }

    public void setSymbol(String symbol) {
        this.symbol = symbol;
    }

    public String getMeaning() {
        return meaning;
    }

    public void setMeaning(String meaning) {
        this.meaning = meaning;
    }

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }

    @Override
    public String toString() {
        return "Word{" +
                "id=" + id +
                ", uid=" + uid +
                ", word='" + word + '\'' +
                ", symbol='" + symbol + '\'' +
                ", meaning='" + meaning + '\'' +
                ", datetime=" + datetime +
                '}';
    }
}
