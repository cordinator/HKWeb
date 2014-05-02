package com.hk.constants.ui;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 10, 2013
 * Time: 3:34:17 PM
 */
public enum PageTypeEnum {

  HOME(1L, "Home"),
  CATEGORY(2L, "Category"),
  CATEGORY_VARIANT(3L, "Category Variant"),
  VARIANT(4L, "Variant"),
  MENU_LANDING(5L, "Menu Landing"),
  BRAND(6L, "Brand"),
  SUB_CAT(7L, "Sub Category");

  private Long id;
  private String type;


  PageTypeEnum(Long id, String type) {
    this.id = id;
    this.type = type;
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }
}
