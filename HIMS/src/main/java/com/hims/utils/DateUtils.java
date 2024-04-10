package com.hims.utils;

import com.sun.javafx.image.impl.IntArgb;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtils {

    public static String nowTime() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return simpleDateFormat.format(new Date());
    }

    public static String getFinallyDate(String date, int year, int month, int day) {
        try {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date d = simpleDateFormat.parse(date);
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(d);

            calendar.add(Calendar.YEAR, year);
            calendar.add(Calendar.MONTH, month);
            calendar.add(Calendar.DATE, day);
            Date time = calendar.getTime();
            return simpleDateFormat.format(time);
        } catch (ParseException e) {
            e.printStackTrace();
        } finally {
        }
        return null;
    }

    public static void main(String[] args) {
        //String time = getFinallyDate("2021-8-26", 1, 2, 10);
        //System.out.println(time);

        int count = differentDaysByMillisecond("2021-10-10 01:11:11","2021-10-16 11:23:11");
        System.out.println(count);
    }

    /**
     * 通过时间秒毫秒数判断两个时间的间隔
     * @param date1
     * @param date2
     * @return
     */
    public static int differentDaysByMillisecond(String date1, String date2) {
        try {
            SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            Date d1=format.parse(date1);
            Date d2=format.parse(date2);
            int days = (int)(Math.ceil((d2.getTime() - d1.getTime()) / (1000.0 * 3600 * 24)));
            return days;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return -1;
    }


}
