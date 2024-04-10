package com.hims.utils;

import java.util.ArrayList;
import java.util.List;

/**
 * 通用的分页工具类
 */
public class PageUtils<T> {

    private Long pageIndex; //当前页码
    private Long pageSize; //页面大小
    private Long pageCount; //总页数
    private Long totalCount; //总条数
    private List<T> records; //每页的数据

    List<Long> numbers=new ArrayList<Long>(); //存贮要显示的页码序号
    Long numberStart=1L; //开始序号
    Long numberEnd; //结束序号

    public PageUtils(Long pageIndex, Long pageSize, Long totalCount,Long pageCount,List<T> records) {
        this.pageIndex = pageIndex;
        this.pageSize = pageSize;
        this.totalCount = totalCount;
        this.records = records;
        this.pageCount = pageCount;

        if(this.pageCount<5){
            numberStart=1L;
            numberEnd=pageCount;
        }else{
            numberStart=this.pageIndex-2;
            numberEnd=this.pageIndex+2;
            if(numberStart<1){
                numberStart=1L;
                numberEnd=5L;
            }else if(numberEnd>pageCount){
                numberStart=pageCount-4;
                numberEnd=pageCount;
            }
        }

        //给集合赋值
        for(Long i=numberStart;i<=numberEnd;i++){
            numbers.add(i);
        }

    }

    public Long getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Long pageIndex) {
        this.pageIndex = pageIndex;
    }

    public Long getPageSize() {
        return pageSize;
    }

    public void setPageSize(Long pageSize) {
        this.pageSize = pageSize;
    }

    public Long getPageCount() {
        return pageCount;
    }

    public void setPageCount(Long pageCount) {
        this.pageCount = pageCount;
    }

    public Long getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Long totalCount) {
        this.totalCount = totalCount;
    }

    public List<T> getRecords() {
        return records;
    }

    public void setRecords(List<T> records) {
        this.records = records;
    }

    public List<Long> getNumbers() {
        return numbers;
    }

    public void setNumbers(List<Long> numbers) {
        this.numbers = numbers;
    }

    public Long getNumberStart() {
        return numberStart;
    }

    public void setNumberStart(Long numberStart) {
        this.numberStart = numberStart;
    }

    public Long getNumberEnd() {
        return numberEnd;
    }

    public void setNumberEnd(Long numberEnd) {
        this.numberEnd = numberEnd;
    }
}
