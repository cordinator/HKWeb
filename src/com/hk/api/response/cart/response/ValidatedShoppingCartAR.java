package com.hk.api.response.cart.response;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.api.response.cart.ShoppingCartTrimmedVariant;
import com.hk.constants.rest.HKWebJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 10, 2013
 * Time: 2:53:53 PM
 */
public class ValidatedShoppingCartAR extends AbstractShoppingCartAR {


  @JsonProperty(DtoJsonConstants.CART_TRIMMED_VARIANTS)
  private List<ShoppingCartTrimmedVariant> trimmedShoppingCartVariants = new ArrayList<ShoppingCartTrimmedVariant>();

  public List<ShoppingCartTrimmedVariant> getTrimmedShoppingCartVariants() {
    return trimmedShoppingCartVariants;
  }

  public void setTrimmedShoppingCartVariants(List<ShoppingCartTrimmedVariant> trimmedShoppingCartVariants) {
    this.trimmedShoppingCartVariants = trimmedShoppingCartVariants;
  }

  @Override
  protected List<String> getKeys() {
    List<String> keys = super.getKeys();
    keys.add(HKWebJsonConstants.CART_TRIMMED_VARIANTS);
    return keys;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = super.getValues();
    values.add(this.trimmedShoppingCartVariants);
    return values;
  }
}
