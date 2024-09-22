package com.itwillbs.domain.Performance;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Data
@Entity(name = "Region")
public class RegionDTO {

    @Id
    @Column(name = "region_id")
    private String regionId;

    @Column(name = "region_name")
    private String regionName;

}
