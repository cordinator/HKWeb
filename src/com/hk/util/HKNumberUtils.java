package com.hk.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.DecimalFormat;

/**
 * @author Rimal
 */
public class HKNumberUtils {

  private static Logger logger = LoggerFactory.getLogger(HKNumberUtils.class);

  private static final DecimalFormat twoDecimalPlaceFormatter = new DecimalFormat("###.##");

  public static Double formatNumberUptoTwoDecimals(Double number) {
    if (null != number) {
      try {
        String format = twoDecimalPlaceFormatter.format(number);
        return Double.parseDouble(format);
      } catch (NumberFormatException nfe) {
        logger.error("Exception encountered while trying to format number: " + number + ": " + nfe.getMessage());
      } catch (IllegalArgumentException iae) {
        logger.error("Exception encountered while trying to format number: " + number + ": " + iae.getMessage());
      }
    }

    return null;
  }
}
