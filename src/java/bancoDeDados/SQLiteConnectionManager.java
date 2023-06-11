package bancoDeDados;

import java.sql.*;

public class SQLiteConnectionManager {
    
    public static final String CLASS_NAME = "org.sqlite.JDBC";
    public static final String URL = "jdbc:sqlite:/home/onboarding/NetBeansProjects/POO-semestral/src/sqlite/concessionaria.db";

    public static Connection getConnection() throws Exception {
        Class.forName(CLASS_NAME);
        return (Connection) DriverManager.getConnection(URL);
    }
    
    
}