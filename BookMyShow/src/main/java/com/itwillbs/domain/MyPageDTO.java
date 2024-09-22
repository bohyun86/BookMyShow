package com.itwillbs.domain;

import lombok.Data;

@Data
public class MyPageDTO {
    private int number;          // 현재 페이지 번호
    private int size;            // 페이지 크기
    private int totalPages;      // 전체 페이지 수
    private long totalElements;  // 전체 요소 수

    public MyPageDTO(int number, int size, long totalElements) {
        this.number = number;
        this.size = size;
        this.totalElements = totalElements;
        this.totalPages = (int) Math.ceil((double) totalElements / size);
    }

    public boolean hasNext() {
        return number < totalPages - 1;
    }

    public boolean hasPrevious() {
        return number > 0;
    }
}