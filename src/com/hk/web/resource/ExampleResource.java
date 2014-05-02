package com.hk.web.resource;

import org.springframework.stereotype.Component;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

/**
 * @author Rimal
 */
@Component
@Path("/example/")
public class ExampleResource {
  @GET
  @Path("/output")
  @Produces("application/json")
  public String getSampleOutput(@QueryParam("q") String query) {
    return "Output: " + query;
  }
}