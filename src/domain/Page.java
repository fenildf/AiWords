package domain;

public class Page {
    private int num = 10;//每页显示的条目个数
    private int page = 1;//当前的页数

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }
}
