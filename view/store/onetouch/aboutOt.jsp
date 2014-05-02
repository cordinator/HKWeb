<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/store/msGeneral.jsp">
  <%
    boolean isSecure = WebContext.isSecure();
    pageContext.setAttribute("isSecure", isSecure);

    PrincipalImpl principal = (PrincipalImpl) SecurityUtils.getSubject().getPrincipal();
    if (principal != null) {
      pageContext.setAttribute("user_hash", principal.getUserHash());
      pageContext.setAttribute("gender", principal.getGender());
      pageContext.setAttribute("orderCount", principal.getOrderCount());
    } else {
      pageContext.setAttribute("user_hash", "guest");
      pageContext.setAttribute("gender", null);
      pageContext.setAttribute("orderCount", null);
    }
  %>


  <s:layout-component name="msHeader">
    <s:layout-render name="/store/onetouch/onetouchHeader.jsp"/>
  </s:layout-component>

  <s:layout-component name="msHeading">

  </s:layout-component>
    <!---- banner close --->



  <s:layout-component name="msContent">
    <div class="wrapper">
      <div class="learn">
        <h1 class="learnH">LEARN MORE <strong>ABOUT DIABETES</strong> & SELF MONITORING TAB</h1>
        </div>


      <div class="cat-strip">
        <h2 class="otH2">What is Diabetes? How is it related to blood sugar level in blood? </h2>
        <div class="cl"></div>
        <p class="otAns">Diabetes is a chronic disease in which the body does not make, or does not properly use, insulin. Insulin is the hormone that helps your body use the energy from sugar, starches and other foods.
          The result is that your body doesn't get the energy it needs, and unmetabolized glucose (undigested sugar), builds up in your blood causing damage to the body and its systems.</p>

      </div>



      <div class="cat-strip">
        <h2 class="otH2">What are the treatments available for Diabetes? </h2>
        <div class="cl"></div>
        <p class="otAns">At present, no cure is available for diabetes. But with a proper combination of diet, exercise and medication along with regular self-monitoring of blood sugar,
          people with diabetes can lead active, healthy lives. </p>

      </div>


      <div class="cat-strip">
        <h2 class="otH2">What is Self-monitoring of blood Sugar?</h2>
        <div class="cl"></div>
        <p class="otAns">Self-monitoring of blood Sugar is the process of testing your blood sugar at home at regular intervals, through the use of blood glucose monitors to stay in the Diabetes Safe Zone.
          Diabetes Safe Zone refers to blood glucose levels considered safe by your doctor.</p>

      </div>


      <div class="cat-strip">
        <h2 class="otH2">Why should you test?</h2>
        <div class="cl"></div>
        <p class="otAns">Checking your blood glucose levels can:<br/>
          - Tell you what your blood glucose level is right away <br/>
          - Show you how your activities, meals and medication are affecting your blood glucose levels<br/>
          - Help you to understand what lifestyle factors affect your blood glucose <br/>
          - Help you and your diabetes healthcare team make changes to your lifestyle and medication(s) to better manage your diabetes</p>

      </div>


      <div class="cat-strip">
        <h2 class="otH2">When should you test?</h2>
        <div class="cl"></div>
        <p class="otAns">The most effective way to manage your diabetes is to test around the events that affect your blood glucose the most: meals, exercise, medications  <br/>and mood swings.
          <br/>
          Even if you are not on medication, testing your blood glucose will give you some valuable information to help you better manage your diabetes.</p>

      </div>


      <div class="cat-strip">
        <h2 class="otH2">What you can learn from testing your blood sugar?</h2>
        <div class="cl"></div>
        <p class="otAns">The most effective way to manage your diabetes is to test around the events that affect your blood glucose the most: meals, exercise, medications  <br/>and mood swings.
          <br/>
          Even if you are not on medication, testing your blood glucose will give you some valuable information to help you better manage your diabetes.</p>

      </div>


      <div class="cat-strip">
        <h2 class="otH2">What you can learn from testing your blood sugar?</h2>
        <div class="cl"></div>
        <table class="tableOt" width="1100" border="1" bordercolor="#e8e8e8" cellspacing="0" cellpadding="0">
          <thead>
          <tr>
            <th width="414" align="left" bgcolor="#e76c2b">Possible times your doctor may tell you to test* </th>
            <th width="680" align="left" bgcolor="#e76c2b">What you can learn</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td>In the morning, before eating</td>
            <td>How well your body is regulating your blood sugar overnight. <br>
              How well an evening medication has worked to keep your blood sugar steady overnight.</td>
          </tr>
          <tr>
            <td>Before and 1-2 hours after the beginning of the meal</td>
            <td>How food and portion choices in a meal affect your blood sugar. <br>
              How well your medication is working to control the increase in blood sugar from your meal.</td>
          </tr>
          <tr>
            <td>Before a meal</td>
            <td>If your blood glucose has returned to target range after your last meal.<br>
              If the activity causes a delayed effect on your blood glucose.</td>
          </tr>
          <tr>
            <td>Before activity</td>
            <td>If you need to adjust the carbohydrates in your meal.</td>
          </tr>
          <tr>
            <td>During and after activity</td>
            <td>If you need a snack before you start an activity.</td>
          </tr>
          <tr>
            <td>Many hours after activity</td>
            <td>How the activity affects your blood glucose.</td>
          </tr>
          <tr>
            <td>When you feel sick</td>
            <td>If illness or stress is affecting your blood glucose level.</td>
          </tr>
          <tr>
            <td>As suggested by your health care professional</td>
            <td>How well your medication </td>
          </tr>
          </tbody>
        </table>
        <span>*Always test according to the recommendations of your doctor.</span>
      </div>



    </div>
    <!---- wrapper close --->
  </s:layout-component>

  <s:layout-component name="msFooter">
    <s:layout-render name="/store/onetouch/onetouchFooter.jsp"/>
  </s:layout-component>

  <s:layout-component name="msScriptComponent">
    <script>
      $(document).ready(function () {

      });

    </script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
  </s:layout-component>
</s:layout-render>