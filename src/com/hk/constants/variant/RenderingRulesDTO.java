package com.hk.constants.variant;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Sep 28, 2013
 * Time: 4:45:37 PM
 */
public class RenderingRulesDTO {

  private boolean speakToNutriExpert;                     //3
  private boolean speakToFitnessExpert;                     //5
  private boolean contactLensLayout;              //7


  public RenderingRulesDTO() {
  }

  public RenderingRulesDTO(long renderingRuleType) {
    this.speakToNutriExpert = renderingRuleType % RenderingRuleConstants.SPEAK_TO_NUTRI_EXPERT == 0;
    this.speakToFitnessExpert = renderingRuleType % RenderingRuleConstants.SPEAK_TO_FITNESS_EXPERT == 0;
    this.contactLensLayout = renderingRuleType % RenderingRuleConstants.CONTACT_LENS_LAYOUT == 0;
  }

  public static void main(String[] args) {
    RenderingRulesDTO renderingRulesDTO = new RenderingRulesDTO(1L);

    System.out.println(renderingRulesDTO.isContactLensLayout());
    System.out.println(renderingRulesDTO.isSpeakToNutriExpert());
    System.out.println(renderingRulesDTO.isSpeakToFitnessExpert());
  }


  public long generateBooleanFromRenderingRuleType() {
    long renderginRuleType = 1;

    renderginRuleType = this.speakToNutriExpert ? renderginRuleType : renderginRuleType * RenderingRuleConstants.SPEAK_TO_NUTRI_EXPERT;
    renderginRuleType = this.speakToFitnessExpert ? renderginRuleType : renderginRuleType * RenderingRuleConstants.SPEAK_TO_FITNESS_EXPERT;
    renderginRuleType = this.contactLensLayout ? renderginRuleType : renderginRuleType * RenderingRuleConstants.CONTACT_LENS_LAYOUT;

    return renderginRuleType;
  }

  public boolean isSpeakToNutriExpert() {
    return speakToNutriExpert;
  }

  public void setSpeakToNutriExpert(boolean speakToNutriExpert) {
    this.speakToNutriExpert = speakToNutriExpert;
  }

  public boolean isSpeakToFitnessExpert() {
    return speakToFitnessExpert;
  }

  public void setSpeakToFitnessExpert(boolean speakToFitnessExpert) {
    this.speakToFitnessExpert = speakToFitnessExpert;
  }

  public boolean isContactLensLayout() {
    return contactLensLayout;
  }

  public void setContactLensLayout(boolean contactLensLayout) {
    this.contactLensLayout = contactLensLayout;
  }
}
