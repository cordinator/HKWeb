<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-render name="/templates/general.jsp">
  <s:useActionBean beanclass="com.hk.web.action.beta.example.ExampleAction" var="action"/>
  <s:layout-component name="content">
    <div class="wrap">
      <div id="add-cmpr-msg"></div>

      Was this review helpful?
      <a href="#" class="review-yes" reviewId="1">Yes</a>
      <a href="#" class="review-no" reviewId="1">No</a>
    </div>
  </s:layout-component>
  <s:layout-component name="scriptComponent">
    <script type="text/javascript">
      $(document).ready(function() {
        $('a.review-yes').click(function() {
          var reviewId = $(this).attr("reviewId");
          HK.Ajax.getJson(
              "/api/variant/review/" + reviewId + "/vote?voteType=true",
              function(responseData) {
                alert(responseData.message);
              },
              ""
              );
        });
        $('a.review-no').click(function() {
          var reviewId = $(this).attr("reviewId");

          HK.Ajax.getJson(
              "/api/variant/review/" + reviewId + "/vote?voteType=false",
              function(responseData) {
                alert(responseData.message);
              },
              ""
              );
        });
      });
    </script>
  </s:layout-component>
</s:layout-render>