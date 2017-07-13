package com.dongt.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.text.ParseException;
/**
 * Created by dongt on 2017/7/13.
 * 返回格式化的当前日期
 */
public class DateUtil {
    public static Date getDate() throws ParseException{
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.parse(sdf.format(date));
    }
}
