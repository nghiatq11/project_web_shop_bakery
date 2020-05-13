/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import entity.Product;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author quang
 */
public class Helper {

    public int pageCount(int countProduct) {
        int pageSize = 9;
        int pageCount = (countProduct % pageSize == 0) ? countProduct / pageSize : countProduct / pageSize + 1;
        return pageCount;
    }

    //k nên dùng phân trang bằng cái này
    public List<Integer> numberPage(int numberProduct) {
        int numberPage = 0;
        if (numberProduct % 9 != 0) {
            numberPage = (numberProduct / 9) + 1;
        } else {
            numberPage = (numberProduct / 9);
        }
        List<Integer> number = new ArrayList<>();
        for (int i = 0; i < numberPage; i++) {
            number.add(i + 1);
        }
        return number; //trả về 1 list trang web
    }

    public static int getValidateId(String id) {
        int number = -1;
        try {
            number = Integer.parseInt(id);
        } catch (NumberFormatException e) {
//            e.printStackTrace(System.out);
        }
        return number;
    }

    public String getPriceFormat(double price) {
        return NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(price);
    }

    public static String hyperlink(String label, String href) {
        return "<a class=\"page_hyperlink\" href=\"" + href + "\">" + "<div class=\"numberpage\">" + label + "</div>" + "</a>";
    }

    //nên dùng phân trang bằng cái này
    public static String pager(int pageindex, int pagecount, int gap, String href) {
        String result = "";
        if (pagecount <= 4) {
            for (int i = gap + 1; i > 0; i--) {
                if (pageindex - i > 0) {
                    result += hyperlink("" + (pageindex - i), href + (pageindex - i));
                }
            }

            result += "<div class=\"numberpage index\">" + pageindex + "</div>";
            for (int i = 1; i <= gap + 1; i++) {
                if (pageindex + i <= pagecount) {
                    result += hyperlink("" + (pageindex + i), href + (pageindex + i));
                }
            }
        } else {
            if (pageindex > gap + 1) {
                result += hyperlink("<div class=\"numberpage\"><img src=\"img/left_arrow_26px.png\"></div>", href + 1);
            }

            for (int i = gap; i > 0; i--) {
                if (pageindex - i > 0) {
                    result += hyperlink("" + (pageindex - i), href + (pageindex - i));
                }
            }

//            result += "<span class=\"page_pageindex\">" + pageindex + "</span>";
            result += "<div class=\"numberpage index\">" + pageindex + "</div>";

            for (int i = 1; i <= gap; i++) {
                if (pageindex + i <= pagecount) {
                    result += hyperlink("" + (pageindex + i), href + (pageindex + i));
                }
            }

            if (pageindex + gap < pagecount) {
                result += hyperlink("<div class=\"numberpage\"><img src=\"img/right_arrow_26px.png\"></div>", href + pagecount);
            }
        }
        return result;
    }
}
