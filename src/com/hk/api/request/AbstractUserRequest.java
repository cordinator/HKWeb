package com.hk.api.request;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.hk.common.constants.StoreConstants;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 25, 2013
 * Time: 10:44:01 PM
 */
public abstract class AbstractUserRequest {

  private static Logger logger = LoggerFactory.getLogger(AbstractUserRequest.class);
  protected Long storeId = StoreConstants.DEFAULT_STORE_ID;
  protected Long userId;


  public AbstractUserRequest() {

  }

  protected boolean validate() {
    boolean valid = true;

    if (userId == null) {
      logger.error("Error validating" + this.getClass().getSimpleName() + " user id cannot be null");
      valid = false;
    }


    return valid;
  }

  public void setUserId(Long userId) {
    this.userId = userId;
  }

  public Long getStoreId() {
    return storeId;
  }

  public Long getUserId() {
    return userId;
  }
}
