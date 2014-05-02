package com.hk.api.response.hkr.notify;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.web.response.GenericResponse;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.List;


public class HkrNotifyMeUpdateResponse extends GenericResponse {

    @JsonProperty(DtoJsonConstants.ACCOUNT_LINK)
    private String accountLink;
    @JsonProperty(DtoJsonConstants.SUCCESS)
    private boolean isSuccess;

    public String getAccountLink() {
        return accountLink;
    }

    public void setAccountLink(String accountLink) {
        this.accountLink = accountLink;
    }

    public boolean isSuccess() {
        return isSuccess;
    }

    public void setSuccess(boolean success) {
        isSuccess = success;
    }

    @Override
    protected List<String> getKeys() {
        List<String> keys = super.getKeys();
        keys.add(DtoJsonConstants.ACCOUNT_LINK);
        keys.add(DtoJsonConstants.SUCCESS);
        return keys;
    }

    @Override
    protected List<Object> getValues() {
        List<Object> values = super.getValues();
        values.add(this.accountLink);
        values.add(this.isSuccess);
        return values;
    }
}
