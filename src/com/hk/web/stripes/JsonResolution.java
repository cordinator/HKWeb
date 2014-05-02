package com.hk.web.stripes;

import com.google.gson.Gson;
import com.hk.web.constants.Status;
import com.hk.web.gson.JsonUtils;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.validation.ValidationError;
import net.sourceforge.stripes.validation.ValidationErrors;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;


/*
public class JsonResolution implements Resolution {

  private static Logger logger = LoggerFactory.getLogger(JsonResolution.class);

  Gson gson;
  Object o;
  String contentType = "application/json";

  public JsonResolution(Object o) {
    gson = JsonUtils.getGsonDefault();  // default gson settings
    this.o = o;
  }

  public JsonResolution(ValidationErrors validationErrors, Locale locale) {
    gson = JsonUtils.getGsonDefault();  // default gson settings
    List<String> errorMessages = new ArrayList<String>();
    for (Map.Entry<String, List<ValidationError>> stringListEntry : validationErrors.entrySet()) {
      for (ValidationError validationError : stringListEntry.getValue()) {
        errorMessages.add(validationError.getMessage(locale));
      }
    }
    this.o = new HealthKartWebResponse(Status.BAD_REQUEST.getCode(), "Error: Bad Request", errorMessages);
  }

  public JsonResolution withContentType(String contentType) {
    this.contentType = contentType;
    return this;
  }


  public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    response.setContentType(contentType);
    String json = null;
    try {
      json = gson.toJson(o);
    } catch (Exception e) {
      logger.error("Exception in converting the object to JSON", e);
      throw e;
    }
    response.getWriter().write(json);
    response.flushBuffer();
  }
}*/
