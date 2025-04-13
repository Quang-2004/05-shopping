package vn.quangkhongbiet.shopping.converters;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class LocalDateTimeToStringConverter {
    private static final String PATTERN = "dd/MM/yyyy HH:mm:ss";
    private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern(PATTERN);

    public static String toString(LocalDateTime dateTime) {
        if (dateTime == null) return null;
        return dateTime.format(formatter);
    }

    public static LocalDateTime toLocalDateTime(String dateTimeStr) {
        if (dateTimeStr == null || dateTimeStr.isEmpty()) return null;
        return LocalDateTime.parse(dateTimeStr, formatter);
    }
}
