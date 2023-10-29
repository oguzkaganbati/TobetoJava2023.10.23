package core.logging;

public class DatabaseLogger implements Logger {

    public void log(String data1, String data2) {
        System.out.println(data1 + " " + data2 + " has been logged to the database..");
    }
}
