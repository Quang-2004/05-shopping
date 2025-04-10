package vn.quangkhongbiet.shopping.service.util;

import java.text.Normalizer;

public class UrlSlugging {
    public static String toSlug(String name){
        return Normalizer.normalize(name, Normalizer.Form.NFD)
                     .replaceAll("[\\p{InCombiningDiacriticalMarks}]", "") // bỏ dấu tiếng Việt
                     .replaceAll("[^\\w\\s-]", "") // bỏ ký tự đặc biệt
                     .trim()
                     .replaceAll("[-\\s]+", "-")
                     .toLowerCase();
    }
}
