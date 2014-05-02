if (typeof(HK) == 'undefined') {
  HK = {};
}

/*function handleExpandCollapseOnClickEvents(expandAllButton, collapseAllButton) {
 $('.ui-accordion-header').click(function () {
 expandAllButton.removeAttr("disabled");
 collapseAllButton.removeAttr("disabled");
 });
 }*/

/**
 * el: element on which accordion is to be implemented
 * collapsible: Whether all the sections can be closed at once. Allows collapsing the active section
 * active: which panel has to remain open by default(zero index followed); pass true for opening all the panels by default
 */
HK.Accordion = function() {
  return{
    accordion : function(el, collapsible, active) {
      el.accordion({
        collapsible:collapsible,
        active: active,
        create: function (event, ui) {
          if (active == true) {
            HK.Accordion().accordionExpandAll(el);
          }
        }
      });
    },

    accordionExpandAll : function(el) {
      var icons = el.accordion("option", "icons");
      $('.ui-accordion-header').removeClass('ui-corner-all').addClass('ui-accordion-header-active ui-state-active ui-corner-top').attr({
        'aria-selected': 'true',
        'tabindex': '0'
      });
      $('.ui-accordion-header-icon').removeClass(icons.header).addClass(icons.headerSelected);
      $('.ui-accordion-content').addClass('ui-accordion-content-active').attr({
        'aria-expanded': 'true',
        'aria-hidden': 'false'
      }).show();
      /*if (expandAllButton) {
       expandAllButton.attr("disabled", "disabled");
       }
       if (collapseAllButton) {
       collapseAllButton.removeAttr("disabled");
       }*/
    },

    accordionCollapseAll : function(el) {
      var icons = el.accordion("option", "icons");
      $('.ui-accordion-header').removeClass('ui-accordion-header-active ui-state-active ui-corner-top').addClass('ui-corner-all').attr({
        'aria-selected': 'false',
        'tabindex': '-1'
      });
      $('.ui-accordion-header-icon').removeClass(icons.headerSelected).addClass(icons.header);
      $('.ui-accordion-content').removeClass('ui-accordion-content-active').attr({
        'aria-expanded': 'false',
        'aria-hidden': 'true'
      }).hide();
      /*if (expandAllButton) {
       collapseAllButton.attr("disabled", "disabled");
       }
       if (collapseAllButton) {
       expandAllButton.removeAttr("disabled");
       }*/
    }
  };
};