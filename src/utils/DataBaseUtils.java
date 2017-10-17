package utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DataBaseUtils {
    private static ComboPooledDataSource comboPooledDataSource;


    static {
        comboPooledDataSource = new ComboPooledDataSource();
    }

    public static ComboPooledDataSource getDataSource(){
        return comboPooledDataSource;
    }

}
