package com.hk.web.resource;

import com.hk.common.json.JSONResponseBuilder;
import com.hk.web.constants.WebResponseConstants;
import com.hk.web.response.AbstractGenericResponse;
import com.hk.web.response.GenericErrorResponse;
import com.hk.web.response.GenericResponse;
import org.jboss.resteasy.annotations.interception.ServerInterceptor;
import org.jboss.resteasy.core.ServerResponse;
import org.jboss.resteasy.spi.interception.PostProcessInterceptor;

import javax.ws.rs.core.MultivaluedMap;
import javax.ws.rs.ext.Provider;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 18, 2013
 * Time: 3:19:28 PM
 */
@Provider
@ServerInterceptor
public class ResponseFormatterInterceptor implements PostProcessInterceptor {

  private static final String CONTENT_TYPE_HEADER_KEY = "Content-Type";
  private static final String CONTENT_TYPE_JSON = "application/json";


  @Override
  public void postProcess(ServerResponse serverResponse) {
    Long startTime = System.currentTimeMillis();
    Object responseEntity = serverResponse.getEntity();
    setContentTypeHeader(serverResponse);
    String response;

    if (responseEntity == null) {
      GenericErrorResponse nullErrorResponse = new GenericErrorResponse();
      nullErrorResponse.setException(true);
      nullErrorResponse.addMessage("Something went wrong, please try in some time ");
      //TODO: logger
      response = getResponse(nullErrorResponse);
      serverResponse.setStatus(ServerResponse.Status.OK.getStatusCode());
    } else if (!(responseEntity instanceof GenericResponse)) {
      GenericErrorResponse genericErrorResponse = new GenericErrorResponse();
      genericErrorResponse.setException(true);
      genericErrorResponse.addMessage("Response from web is not in correct format. Check you extend superclass");

      response = getResponse(genericErrorResponse);
    } else {
      AbstractGenericResponse genericResponseEntity = (AbstractGenericResponse) responseEntity;
      response = getResponse(genericResponseEntity);
    }
    serverResponse.setEntity(response);
    Long endTime = System.currentTimeMillis();
    System.out.println("in formatter web" + (endTime - startTime) + " ms" + " -> " + responseEntity.getClass());
  }

  private void setContentTypeHeader(ServerResponse serverResponse) {
    MultivaluedMap<String, Object> headers = serverResponse.getMetadata();
    List<Object> contentType = new ArrayList<Object>();
    contentType.add(CONTENT_TYPE_JSON);
    headers.put(CONTENT_TYPE_HEADER_KEY, contentType);
  }

  private String getResponse(AbstractGenericResponse abstractGenericResponse) {
    return new JSONResponseBuilder().addField(WebResponseConstants.RESULTS, abstractGenericResponse)
        .addField(WebResponseConstants.EXCEPTION, abstractGenericResponse.isException())
        .addField(WebResponseConstants.MESSAGES, abstractGenericResponse.getMessages()).buildAsString();
  }
}
