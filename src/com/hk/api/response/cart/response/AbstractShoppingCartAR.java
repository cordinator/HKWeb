package com.hk.api.response.cart.response;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.api.response.cart.ShoppingCartPricingDto;
import com.hk.common.constants.DtoJsonConstants;
import com.hk.constants.rest.HKWebJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 10, 2013
 * Time: 2:45:36 PM
 */
public class AbstractShoppingCartAR extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.CART_PRICING_DTO)
  protected ShoppingCartPricingDto shoppingCartPricingDto;

  /*@JsonProperty(DtoJsonConstants.CART_ID)
  protected Long shoppingCartId;
*/

  /*public Long getShoppingCartId() {
    return shoppingCartId;
  }

  public void setShoppingCartId(Long shoppingCartId) {
    this.shoppingCartId = shoppingCartId;
  }*/

  public ShoppingCartPricingDto getShoppingCartPricingDto() {
    return shoppingCartPricingDto;
  }

  public void setShoppingCartPricingDto(ShoppingCartPricingDto shoppingCartPricingDto) {
    this.shoppingCartPricingDto = shoppingCartPricingDto;
  }

  @Override
  protected List<String> getKeys() {
    List<String> keys = super.getKeys();
    keys.add(HKWebJsonConstants.CART_PRICING_DTO);
    return keys;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = super.getValues();
    values.add(this.shoppingCartPricingDto);
    return values;
  }
}
