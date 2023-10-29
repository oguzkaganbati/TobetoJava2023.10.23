package core.logging;

public class MailLogger implements Logger{
    @Override
    public void log(String data1, String data2) {
        System.out.println(data1 + " " + data2 + " has been logged and sent by email..");

    }
}
