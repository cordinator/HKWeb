package com.hk.api.response.hkr.deliveryDate;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created with IntelliJ IDEA.
 * User: Shakti Singh
 * Date: 3/25/14
 * Time: 9:05 PM
 * To change this template use File | Settings | File Templates.
 */
public class HkrDeliveryDateWrapper extends AbstractBaseResponseApiWrapper {

    @JsonProperty(DtoJsonConstants.RESULTS)
    private HkrDeliveryDateResponse hkrDeliveryDateResponse;

    public HkrDeliveryDateResponse getHkrDeliveryDateResponse() {
        return hkrDeliveryDateResponse;
    }

    public void setHkrDeliveryDateResponse(HkrDeliveryDateResponse hkrDeliveryDateResponse) {
        this.hkrDeliveryDateResponse = hkrDeliveryDateResponse;
    }
}
