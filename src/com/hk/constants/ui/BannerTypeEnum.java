package com.hk.constants.ui;

import java.util.Arrays;
import java.util.List;

/**
 * @author Rimal
 */
public enum BannerTypeEnum {

  HomeBanner(1L, "HomeBanner"),
  CategoryBanner(100L, "CategoryBanner"),
  CatalogBanner(200L, "CatalogBanner"),
  StripBanner(300L, "StripBanner");


  private Long id;
  private String name;


  BannerTypeEnum(Long id, String name) {
    this.id = id;
    this.name = name;
  }


  public Long getId() {
    return id;
  }

  public String getName() {
    return name;
  }

    public static List<String> getPagesBanners(){
      return Arrays.asList(CategoryBanner.getName(), CatalogBanner.getName());
    }
}
