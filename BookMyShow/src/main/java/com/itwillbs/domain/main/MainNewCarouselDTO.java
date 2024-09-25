package com.itwillbs.domain.main;

import lombok.Data;

@Data
public class MainNewCarouselDTO {

    private String postFilePath;
    private int musicalId;
    private String area;
    private String category;
    private String title;
    private String discountRate;
    private String price;
    // 평점, 리뷰수
    private String rating;
    private String reviewCount;

}
