package com.hk.api.response.cart.offer;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.common.json.JSONObject;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jul 26, 2013
 * Time: 7:56:13 AM
 */
public class OfferDTO extends JSONObject {

  @JsonProperty(DtoJsonConstants.ID)
  private Long id;
  @JsonProperty(DtoJsonConstants.NAME)
  private String name;
  /*private Long paymentTypeId;*/
  @JsonProperty(DtoJsonConstants.TERMS)
  private String terms;

  public OfferDTO() {

  }


  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getTerms() {
    return terms;
  }

  public void setTerms(String terms) {
    this.terms = terms;
  }


  @Override
  protected List<String> getKeys() {
    List<String> keys = new ArrayList<String>();
    keys.add(DtoJsonConstants.ID);
    keys.add(DtoJsonConstants.NAME);
    keys.add(DtoJsonConstants.TERMS);

    return keys;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = new ArrayList<Object>();

    values.add(this.id);
    values.add(this.name);
    /*values.add(this.paymentTypeId);*/
    values.add(this.terms);

    return values;
  }
}