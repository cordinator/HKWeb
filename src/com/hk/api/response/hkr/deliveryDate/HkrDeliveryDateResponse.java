package com.hk.api.response.hkr.deliveryDate;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.web.response.GenericResponse;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Shakti Singh
 * Date: 3/25/14
 * Time: 4:44 PM
 * To change this template use File | Settings | File Templates.
 */
public class HkrDeliveryDateResponse extends GenericResponse {

    @JsonProperty(DtoJsonConstants.EST_DEL_DATE)
    private String estDeliveryDate;
    @JsonProperty(DtoJsonConstants.IS_COD_ALLOWED)
    private String isCODAllowed;
    @JsonProperty(DtoJsonConstants.PINCODE)
    private String pin;
    @JsonProperty(DtoJsonConstants.EXP_DISPATCH_DATE)
    private String estDispatchDate;


    public String getEstDeliveryDate() {
        return estDeliveryDate;
    }

    public void setEstDeliveryDate(String estDeliveryDate) {
        this.estDeliveryDate = estDeliveryDate;
    }

    public String getCODAllowed() {
        return isCODAllowed;
    }

    public void setCODAllowed(String CODAllowed) {
        isCODAllowed = CODAllowed;
    }

    public String getPin() {
        return pin;
    }

    public void setPin(String pin) {
        this.pin = pin;
    }

    public String getEstDispatchDate() {
        return estDispatchDate;
    }

    public void setEstDispatchDate(String estDispatchDate) {
        this.estDispatchDate = estDispatchDate;
    }

    @Override
    protected List<String> getKeys() {
        List<String> keys = new ArrayList<String>();
        keys.add(DtoJsonConstants.EST_DEL_DATE);
        keys.add(DtoJsonConstants.IS_COD_ALLOWED);
        keys.add(DtoJsonConstants.PINCODE);
        keys.add(DtoJsonConstants.EXP_DISPATCH_DATE);
        return keys;
    }

    @Override
    protected List<Object> getValues() {
        List<Object> values = new ArrayList<Object>();
        values.add(this.estDeliveryDate);
        values.add(this.isCODAllowed);
        values.add(this.pin);
        values.add(this.estDispatchDate);
        return values;
    }
}
