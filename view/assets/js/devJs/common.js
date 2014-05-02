if (typeof(HK) === 'undefined') {
  HK = {};
}
if (typeof(CONTEXT_ROOT) == 'undefined') {
  CONTEXT_ROOT = '';
}

//fix for legacy browsers not supporting console.log
if (typeof console === "undefined") {
  var console = {};
  console['log'] = function() {
  };
}

/**------------------------------------Lazy Load Carousel Starts--------------------------------**/
/*

!function ($) {
  "use strict"; // jshint ;_;


  */
/* CAROUSEL CLASS DEFINITION
   * ========================= *//*


  var Carousel = function (element, options) {
    this.$element = $(element)
    this.$indicators = this.$element.find('.carousel-indicators')
    this.options = options
    this.options.pause == 'hover' && this.$element
        .on('mouseenter', $.proxy(this.pause, this))
        .on('mouseleave', $.proxy(this.cycle, this))

    // LAZY LOAD START
    var that = this

    this.loading = this.$element.find('.loading');
    this.lazy_elements = this.$element.find('.item img[lazy-src]')
    this.lazy_elements.load(function() {
      var $this = $(this)
      $this.attr('lazy-load', 'success')
      that.resume($this)
    })
        .error(function() {
          var $this = $(this)
          $this.attr('lazy-load', 'error')
          that.resume($this)
        })
    // LAZY LOAD END
  }

  Carousel.prototype = {

    cycle: function (e) {
      if (!e) this.paused = false
      if (this.interval) clearInterval(this.interval);
      this.options.interval
          && !this.paused
      && (this.interval = setInterval($.proxy(this.next, this), this.options.interval))
      return this
    }

    , getActiveIndex: function () {
      this.$active = this.$element.find('.item.active')
      this.$items = this.$active.parent().children()
      return this.$items.index(this.$active)
    }

    , to: function (pos) {
      var activeIndex = this.getActiveIndex()
          , that = this

      if (pos > (this.$items.length - 1) || pos < 0) return

      if (this.sliding) {
        return this.$element.one('slid', function () {
          that.to(pos)
        })
      }

      if (activeIndex == pos) {
        return this.pause().cycle()
      }

      return this.slide(pos > activeIndex ? 'next' : 'prev', $(this.$items[pos]))
    }

    , pause: function (e) {
      if (!e) this.paused = true
      if (this.$element.find('.next, .prev').length && $.support.transition.end) {
        this.$element.trigger($.support.transition.end)
        this.cycle(true)
      }
      clearInterval(this.interval)
      this.interval = null
      return this
    }

    , next: function () {
      if (this.sliding) return
      return this.slide('next')
    }

    , prev: function () {
      if (this.sliding) return
      return this.slide('prev')
    }

    // LAZY LOAD START
    , load: function (img) {
      this.sliding = false
      this.loading.removeClass('hide')

      img.attr('src', img.attr('lazy-src'))
      img.removeAttr('lazy-src')
      img.attr('lazy-load', 'loading')
    }

    , resume: function (img) {
      var $next = img.parents('.item')
          , children = $next.parents('.carousel-inner').children()
          , nextPos = children.index($next)

      this.loading.addClass('hide')
      this.to(nextPos)

      this.options.interval && this.cycle()
    }
    // LAZY LOAD END

    , slide: function (type, next) {
      var $active = this.$element.find('.item.active')
          , $next = next || $active[type]()
          , isCycling = this.interval
          , direction = type == 'next' ? 'left' : 'right'
          , fallback = type == 'next' ? 'first' : 'last'
          , that = this
          , e

      this.sliding = true

      isCycling && this.pause()

      $next = $next.length ? $next : this.$element.find('.item')[fallback]()

      e = $.Event('slide', {
        relatedTarget: $next[0]
        , direction: direction
      })

      if ($next.hasClass('active')) return

      //LAZY LOAD START
      var $nextLazyImg = $next.find('img[lazy-src]')
      if ($nextLazyImg.length) {
        this.load($nextLazyImg)
        return this
      }
      // LAZY LOAD END

      if (this.$indicators.length) {
        this.$indicators.find('.active').removeClass('active')
        this.$element.one('slid', function () {
          var $nextIndicator = $(that.$indicators.children()[that.getActiveIndex()])
          $nextIndicator && $nextIndicator.addClass('active')
        })
      }

      if ($.support.transition && this.$element.hasClass('slide')) {
        this.$element.trigger(e)
        if (e.isDefaultPrevented()) return
        $next.addClass(type)
        $next[0].offsetWidth // force reflow
        $active.addClass(direction)
        $next.addClass(direction)
        this.$element.one($.support.transition.end, function () {
          $next.removeClass([type, direction].join(' ')).addClass('active')
          $active.removeClass(['active', direction].join(' '))
          that.sliding = false
          setTimeout(function () {
            that.$element.trigger('slid')
          }, 0)
        })
      } else {
        this.$element.trigger(e)
        if (e.isDefaultPrevented()) return
        $active.removeClass('active')
        $next.addClass('active')
        this.sliding = false
        this.$element.trigger('slid')
      }

      isCycling && this.cycle()

      return this
    }

  }


  */
/* CAROUSEL PLUGIN DEFINITION
   * ========================== *//*


  var old = $.fn.carousel

  $.fn.carousel = function (option) {
    return this.each(function () {
      var $this = $(this)
          , data = $this.data('carousel')
          , options = $.extend({}, $.fn.carousel.defaults, typeof option == 'object' && option)
          , action = typeof option == 'string' ? option : options.slide
      if (!data) $this.data('carousel', (data = new Carousel(this, options)))
      if (typeof option == 'number') data.to(option)
      else if (action) data[action]()
      else if (options.interval) data.pause().cycle()
    })
  }

  $.fn.carousel.defaults = {
    interval: 5000
    , pause: 'nothing'
    //, pause: 'nothing'
  }

  $.fn.carousel.Constructor = Carousel


  */
/* CAROUSEL NO CONFLICT
   * ==================== *//*


  $.fn.carousel.noConflict = function () {
    $.fn.carousel = old
    return this
  }

  */
/* CAROUSEL DATA-API
   * ================= *//*


  $(document).on('click.carousel.data-api', '[data-slide], [data-slide-to]', function (e) {
    var $this = $(this), href
        , $target = $($this.attr('data-target') || (href = $this.attr('href')) && href.replace(/.*(?=#[^\s]+$)/, '')) //strip for ie7
        , options = $.extend({}, $target.data(), $this.data())
        , slideIndex

    $target.carousel(options)

    if (slideIndex = $this.attr('data-slide-to')) {
      $target.data('carousel').pause().to(slideIndex).cycle()
    }

    e.preventDefault()
  })

}(window.jQuery);
*/

/**------------------------------------Lazy Load Carousel Ends--------------------------------**/

/**
 * menu-aim is a jQuery plugin for dropdown menus that can differentiate
 * between a user trying hover over a dropdown item vs trying to navigate into
 * a submenu's contents.
 * https://github.com/kamens/jQuery-menu-aim
 */
(function ($) {

  $.fn.menuAim = function (opts) {
    // Initialize menu-aim for all elements in jQuery collection
    this.each(function () {
      init.call(this, opts);
    });

    return this;
  };

  function init(opts) {
    var $menu = $(this),
        activeRow = null,
        mouseLocs = [],
        lastDelayLoc = null,
        timeoutId = null,
        options = $.extend({
          rowSelector: "> li",
          submenuSelector: "*",
          submenuDirection: "right",
          tolerance: 75,  // bigger = more forgivey when entering submenu
          enter: $.noop,
          exit: $.noop,
          activate: $.noop,
          deactivate: $.noop,
          exitMenu: $.noop
        }, opts);

    var MOUSE_LOCS_TRACKED = 3,  // number of past mouse locations to track
        DELAY = 300;  // ms delay when user appears to be entering submenu
    var mousemoveDocument = function (e) {
      mouseLocs.push({x: e.pageX, y: e.pageY});

      if (mouseLocs.length > MOUSE_LOCS_TRACKED) {
        mouseLocs.shift();
      }
    };
    var mouseleaveMenu = function () {
      if (timeoutId) {
        clearTimeout(timeoutId);
      }
      if (options.exitMenu(this)) {
        if (activeRow) {
          options.deactivate(activeRow);
        }

        activeRow = null;
      }
    };
    var mouseenterRow = function () {
      if (timeoutId) {
        // Cancel any previous activation delays
        clearTimeout(timeoutId);
      }

      options.enter(this);
      possiblyActivate(this);
    },
        mouseleaveRow = function () {
          options.exit(this);
        };
    var clickRow = function () {
      activate(this);
    };

    var activate = function (row) {
      if (row == activeRow) {
        return;
      }

      if (activeRow) {
        options.deactivate(activeRow);
      }

      options.activate(row);
      activeRow = row;
    };
    var possiblyActivate = function (row) {
      var delay = activationDelay();

      if (delay) {
        timeoutId = setTimeout(function () {
          possiblyActivate(row);
        }, delay);
      } else {
        activate(row);
      }
    };
    var activationDelay = function () {
      if (!activeRow || !$(activeRow).is(options.submenuSelector)) {
        return 0;
      }

      var offset = $menu.offset(),
          upperLeft = {
            x: offset.left,
            y: offset.top - options.tolerance
          },
          upperRight = {
            x: offset.left + $menu.outerWidth(),
            y: upperLeft.y
          },
          lowerLeft = {
            x: offset.left,
            y: offset.top + $menu.outerHeight() + options.tolerance
          },
          lowerRight = {
            x: offset.left + $menu.outerWidth(),
            y: lowerLeft.y
          },
          loc = mouseLocs[mouseLocs.length - 1],
          prevLoc = mouseLocs[0];

      if (!loc) {
        return 0;
      }

      if (!prevLoc) {
        prevLoc = loc;
      }

      if (prevLoc.x < offset.left || prevLoc.x > lowerRight.x ||
          prevLoc.y < offset.top || prevLoc.y > lowerRight.y) {
        return 0;
      }

      if (lastDelayLoc &&
          loc.x == lastDelayLoc.x && loc.y == lastDelayLoc.y) {
        return 0;
      }

      function slope(a, b) {
        return (b.y - a.y) / (b.x - a.x);
      }

      var decreasingCorner = upperRight,
          increasingCorner = lowerRight;

      if (options.submenuDirection == "left") {
        decreasingCorner = lowerLeft;
        increasingCorner = upperLeft;
      } else if (options.submenuDirection == "below") {
        decreasingCorner = lowerRight;
        increasingCorner = lowerLeft;
      } else if (options.submenuDirection == "above") {
        decreasingCorner = upperLeft;
        increasingCorner = upperRight;
      }

      var decreasingSlope = slope(loc, decreasingCorner),
          increasingSlope = slope(loc, increasingCorner),
          prevDecreasingSlope = slope(prevLoc, decreasingCorner),
          prevIncreasingSlope = slope(prevLoc, increasingCorner);

      if (decreasingSlope < prevDecreasingSlope &&
          increasingSlope > prevIncreasingSlope) {
        lastDelayLoc = loc;
        return DELAY;
      }

      lastDelayLoc = null;
      return 0;
    };

    $menu
        .mouseleave(mouseleaveMenu)
        .find(options.rowSelector)
        .mouseenter(mouseenterRow)
        .mouseleave(mouseleaveRow)
        .click(clickRow);

    $(document).mousemove(mousemoveDocument);

  }

  ;
})(jQuery);

/**
 * @author Stéphane Roucheray
 * @extends jquery
 * https://code.google.com/p/jquery-infinite-carousel/
 */


jQuery.fn.infiniteCarousel = function (previous, next, options) {
  var sliderList = jQuery(this).children()[0];

  if (sliderList) {
    var increment = jQuery(sliderList).children().outerWidth(),
        elmnts = jQuery(sliderList).children(),
        numElmts = elmnts.length,
        sizeFirstElmnt = increment,
        shownInViewport = Math.round(jQuery(this).width() / sizeFirstElmnt),
        firstElementOnViewPort = 1,
        isAnimating = false;

    for (i = 0; i < shownInViewport; i++) {
      jQuery(sliderList).css('width', (numElmts + shownInViewport) * increment + increment + "px");
      jQuery(sliderList).append(jQuery(elmnts[i]).clone());
    }

    jQuery(previous).click(function (event) {
      if (!isAnimating) {
        if (firstElementOnViewPort == 1) {
          jQuery(sliderList).css('left', "-" + numElmts * sizeFirstElmnt + "px");
          firstElementOnViewPort = numElmts;
        }
        else {
          firstElementOnViewPort--;
        }

        jQuery(sliderList).animate({
          left: "+=" + increment},
          //y: 0,
        {  queue: true,
          complete: function () {
            isAnimating = false;
          }
        });
        isAnimating = true;
      }

    });

    jQuery(next).click(function (event) {
      if (!isAnimating) {
        if (firstElementOnViewPort > numElmts) {
          firstElementOnViewPort = 2;
          jQuery(sliderList).css('left', "0px");
        }
        else {
          firstElementOnViewPort++;
        }
        jQuery(sliderList).animate({
          left: "-=" + increment,
          y: 0,
          queue: true
        }, "swing", function () {
          isAnimating = false;
        });
        isAnimating = true;
      }
    });
  }
};

/*
 * File: jquery.flexisel.js
 * Version: 1.0.1
 * Description: Responsive carousel jQuery plugin
 * Author: 9bit Studios
 * Copyright 2012, 9bit Studios
 * http://www.9bitstudios.com
 * Free to use and abuse under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 */

(function ($) {

  $.fn.flexisel = function (options) {

    var defaults = $.extend({
      visibleItems: 3,
      noOfItemsToScroll : 1,
      animationSpeed: 200,
      autoPlay: false,
      autoPlaySpeed: 3000,
      pauseOnHover: true,
      setMaxWidthAndHeight: false,
      enableResponsiveBreakpoints: false,
      responsiveBreakpoints: {

        portrait: {
          changePoint:480,
          visibleItems: 1
        },
        landscape: {
          changePoint:640,
          visibleItems: 2
        },
        tablet: {
          changePoint:768,
          visibleItems: 3
        }
      }
    }, options);

    /******************************
     Private Variables
     *******************************/

    var object = $(this);
    var settings = $.extend(defaults, options);
    var itemsWidth; // Declare the global width of each item in carousel
    var canNavigate = true;
    var itemsVisible = settings.visibleItems;
    var noOfItemsToScroll = settings.noOfItemsToScroll;
    var isScrollable = noOfItemsToScroll < object.children().length ? true : false;  // flag telling if carousel works or not
    var responsivePoints = [];

    /******************************
     Public Methods
     *******************************/

    var methods = {

      init: function() {

        return this.each(function () {
          methods.appendHTML();
          methods.setEventHandlers();
          methods.initializeItems();

        });
      },

      /******************************
       Initialize Items
       Set up carousel
       *******************************/

      initializeItems: function() {

        var listParent = object.parent();
        var innerHeight = listParent.height();
        var childSet = object.children();
        methods.sortResponsiveObject(settings.responsiveBreakpoints);

        var innerWidth = listParent.width(); // Set widths
        itemsWidth = (innerWidth) / itemsVisible;
        childSet.width(itemsWidth);
        if (isScrollable) {
          childSet.last().insertBefore(childSet.first());
          childSet.last().insertBefore(childSet.first());
          object.css({'left' : -itemsWidth});
        }
        object.fadeIn();
        $(window).trigger("resize"); // needed to position arrows correctly

      },


      /******************************
       Append HTML
       Wrap list in markup with classes needed for carousel to function
       *******************************/

      appendHTML: function() {
        var childSet = object.children();
        object.addClass("nbs-flexisel-ul");
        object.wrap("<div class='nbs-flexisel-container'><div class='nbs-flexisel-inner'></div></div>");
        object.find("li").addClass("nbs-flexisel-item");

        if (settings.setMaxWidthAndHeight) {
          var baseWidth = $(".nbs-flexisel-item img").width();
          var baseHeight = $(".nbs-flexisel-item img").height();
          $(".nbs-flexisel-item img").css("max-width", baseWidth);
          $(".nbs-flexisel-item img").css("max-height", baseHeight);
        }


        $("<div class='nbs-flexisel-nav-left'></div><div class='nbs-flexisel-nav-right'></div>").insertAfter(object);
        if (isScrollable) {
          var cloneContent = childSet.clone();
          object.append(cloneContent);
        }
      },


      /******************************
       Set Event Handlers
       Set events for carousel
       *******************************/
      setEventHandlers: function() {

        var listParent = object.parent();
        var childSet = object.children();
        var leftArrow = listParent.find($(".nbs-flexisel-nav-left"));
        var rightArrow = listParent.find($(".nbs-flexisel-nav-right"));

        $(window).on("resize", function(event) {

          methods.setResponsiveEvents();

          var innerWidth = $(listParent).width();
          var innerHeight = $(listParent).height();

          itemsWidth = (innerWidth) / itemsVisible;

          childSet.width(itemsWidth);
          if (isScrollable) {
            object.css({'left' : -itemsWidth});
          } else {
            leftArrow.addClass('disabled');
            rightArrow.addClass('disabled');
          }
          var halfArrowHeight = (leftArrow.height()) / 2;
          var arrowMargin = (innerHeight / 2) - halfArrowHeight;
          leftArrow.css("top", arrowMargin + "px");
          rightArrow.css("top", arrowMargin + "px");

        });

        if (isScrollable) {
          $(leftArrow).on("click", function (event) {
            methods.scrollLeft();
          });

          $(rightArrow).on("click", function (event) {
            methods.scrollRight();
          });
        }
        ;

        if (settings.pauseOnHover) {
          $(".nbs-flexisel-item").on({
            mouseenter: function () {
              canNavigate = false;
            },
            mouseleave: function () {
              canNavigate = true;
            }
          });
        }

        if (settings.autoPlay) {

          setInterval(function () {
            if (canNavigate)
              methods.scrollRight();
          }, settings.autoPlaySpeed);
        }

      },

      /******************************
       Set Responsive Events
       Set breakpoints depending on responsiveBreakpoints
       *******************************/

      setResponsiveEvents: function() {
        var contentWidth = $('html').width();

        if (settings.enableResponsiveBreakpoints) {

          var largestCustom = responsivePoints[responsivePoints.length - 1].changePoint; // sorted array

          for (var i in responsivePoints) {

            if (contentWidth >= largestCustom) { // set to default if width greater than largest custom responsiveBreakpoint
              itemsVisible = settings.visibleItems;
              break;
            }
            else { // determine custom responsiveBreakpoint to use

              if (contentWidth < responsivePoints[i].changePoint) {
                itemsVisible = responsivePoints[i].visibleItems;
                break;
              }
              else
                continue;
            }
          }
        }
      },

      /******************************
       Sort Responsive Object
       Gets all the settings in resposiveBreakpoints and sorts them into an array
       *******************************/

      sortResponsiveObject: function(obj) {

        var responsiveObjects = [];

        for (var i in obj) {
          responsiveObjects.push(obj[i]);
        }

        responsiveObjects.sort(function(a, b) {
          return a.changePoint - b.changePoint;
        });

        responsivePoints = responsiveObjects;
      },

      /******************************
       Scroll Left
       Scrolls the carousel to the left
       *******************************/

      scrollLeft:function() {

        if (canNavigate) {
          canNavigate = false;

          var listParent = object.parent();
          var innerWidth = listParent.width();

          itemsWidth = (innerWidth) / itemsVisible;

          //scroll as to specified no of items
          itemsWidth = itemsWidth * settings.noOfItemsToScroll;

          var childSet = object.children();

          object.animate({
            'left' : "+=" + itemsWidth
          },
          {
            queue:false,
            duration:settings.animationSpeed,
            easing: "linear",
            complete: function() {
              for (var i = childSet.length - settings.noOfItemsToScroll; i < childSet.length; i++) {
                childSet.eq(i).insertBefore(childSet.first()); // Get the first list item and put it after the last list item (that's how the infinite effects is made)
              }
              methods.adjustScroll();
              canNavigate = true;
            }
          }
              );
        }
      },

      /******************************
       Scroll Right
       Scrolls the carousel to the right
       *******************************/

      scrollRight:function() {

        if (canNavigate) {
          canNavigate = false;

          var listParent = object.parent();
          var innerWidth = listParent.width();

          itemsWidth = (innerWidth) / itemsVisible;

          //scroll as to specified no of items
          itemsWidth = itemsWidth * settings.noOfItemsToScroll;

          var childSet = object.children();

          object.animate({
            'left' : "-=" + itemsWidth
          },
          {
            queue:false,
            duration:settings.animationSpeed,
            easing: "linear",
            complete: function() {
              for (var i = settings.noOfItemsToScroll - 1; i >= 0; i--) {
                childSet.eq(i).insertAfter(childSet.last()); // Get the first list item and put it after the last list item (that's how the infinite effects is made)
              }

              methods.adjustScroll();
              canNavigate = true;
            }
          }
              );
        }
      },

      /******************************
       Adjust Scroll
       Needed to position arrows correctly on init and resize
       *******************************/

      adjustScroll: function() {

        var listParent = object.parent();
        var childSet = object.children();

        var innerWidth = listParent.width();
        itemsWidth = (innerWidth) / itemsVisible;
        childSet.width(itemsWidth);
        object.css({'left' : -itemsWidth});
      }

    };

    if (methods[options]) {   // $("#element").pluginName('methodName', 'arg1', 'arg2');
      return methods[options].apply(this, Array.prototype.slice.call(arguments, 1));
    } else if (typeof options === 'object' || !options) {   // $("#element").pluginName({ option: 1, option:2 });
      return methods.init.apply(this);
    } else {
      $.error('Method "' + method + '" does not exist in flexisel plugin!');
    }
  };

})(jQuery);


var PopUpUtil = function () {
  var _self = this;
  _self.root = null;
  _self.rootClass = 'popup-root';
  _self.shadowClass = 'popup-shadow';
  _self.contentClass = 'popup-content';
  _self.actionClass = 'popup-action';
  _self.closeClass = "popup-close";
  _self.removeClass = "popup-remove";
  _self.events = {
    REMOVE: 'removePop',
    HIDE: 'hidePop'
  }
  /*
   * create popup for elements existing in DOM
   */
  _self.setRootRef = function (root) {
    _self.root = root;
  }

  _self.getRootRef = function () {
    return _self.root;
  }

  _self.getContentRef = function () {
    var x = _self.root.find('.' + _self.contentClass);
    return x
  }

  /**
   *@param dimension: css rules, must be in valid json form
   */
  _self.setContentBoxProperties = function (dimension) {
    if (!(typeof dimension == 'undefined' || dimension == null)) {
      _self.getContentRef().css(dimension);
    }
  }

  /*
   * Create popup out of thin air
   */
  _self.createPopUp = function (settings, targetEle) {
    if (typeof targetEle == 'undefined' || targetEle == null || targetEle == '') {
      targetEle = 'body';
    }
    var ele = $("<div></div>").prependTo(targetEle);
    ele.addClass(_self.rootClass);
    var shdw = $('<div></div>').addClass(_self.shadowClass);
    if(typeof settings == "object" && typeof settings.shadow !== "undefined" && settings.shadow === false) {

    } else {
      ele.append(shdw);
    }
    var cntnt = $('<div></div>').addClass(_self.contentClass);
    ele.append(cntnt);
    _self.root = ele;
    _self.init(settings);
    return _self.root;
  }

  //use this when elements are available in dom, internally called by createPopUP method
  _self.init = function (settings) {
    var closeType, title, boxSize, theme , haveTitle;
    if ((typeof settings) == 'object') {
      closeType = settings.closeType;
      title = settings.title;
      boxSize = settings.boxSize;
      theme = (typeof settings.theme == 'string') ? settings.theme : '';
      haveTitle = settings.haveTitle || true;
      /*console.log(haveTitle);*/
    }
    try {
      if (_self.root == null) {
        throw("Exception : Initialzed plugin without setting root element");
      }

      _self.setTheme(theme);

      //search for CONTENT section in content layout
      var cntnt = _self.root.find('.' + _self.contentClass + ">[data-role=content]");
      if (cntnt.length == 0) {
        _self.addContentElement(_self.getContentRef());
      }

      //search for TITLE section in content layout
      var ttl = _self.root.find('.' + _self.contentClass + ">[data-role=title]");
      if (ttl.length == 0 && haveTitle != 'false') {
        _self.addTitle(_self.getContentRef(), title, closeType);
      }

      //search for Action section in content layout
      var ttl = _self.root.find('.' + _self.contentClass + ">[data-role=action]");
      if (ttl.length == 0) {
        _self.addActionContainer();
      }

      _self.shadowBindClick(closeType);

      //set dimension of content layout
      _self.setContentBoxProperties(boxSize);
      _self.root.bind(_self.events.HIDE, _self.close);
      _self.root.bind(_self.events.REMOVE, _self.remove);
      _self.root.on('click', '.' + _self.closeClass, _self.close);
      _self.root.on('click', '.' + _self.removeClass, _self.remove);

    } catch (e) {
      /*console.log(e);*/
    }
  }

  //Hide pop up when user clicks on shadow area
  _self.shadowBindClick = function (closeType) {
    if (closeType == 'remove') {
      _self.root.find('.' + _self.shadowClass).click(_self.remove);
    } else {
      _self.root.find('.' + _self.shadowClass).click(_self.close);
    }
  }

  //set theme for popup
  _self.setTheme = function (theme) {
    _self.getContentRef().addClass(theme);
  }

  _self.shadowUnbindClick = function () {
    _self.root.find('.' + _self.shadowClass).unbind('click');
  }

  //Create TITLE element in content layout
  _self.addTitle = function (ele, title, iconType) {
    if (String(typeof title) == 'undefined') {
      title = "";
    }
    var ttl = $('<div data-role=title></div>');
    ttl.html("<span class='title-string'>" + title + "</span>");
    if (iconType == 'remove') {
      ttl.append(_self.addRemoveIcon());
    } else {
      ttl.append(_self.addCloseIcon());
    }
    ele.prepend(ttl);
  }

  //Create CONTENT element in content layout
  _self.addContentElement = function (ele) {
    var cntnt = $('<div data-role=content></div>');
    cntnt.html(ele.html());
    //cntnt.append()(_self.root.find('.'+_self.contentClass).html());
    ele.html(cntnt);
  }

  //Create ACTIONS or button container in content layout
  _self.addActionContainer = function () {
    var cntnt = $('<div data-role=action></div>');
    //cntnt.append()(_self.root.find('.'+_self.contentClass).html());
    _self.getContentRef().append(cntnt);
  }

  _self.addActionButton = function (btn) {
    _self.getContentRef().find('[data-role=action]').append(btn);
  }

  _self.removeActionButtons = function () {
    _self.getContentRef().find('[data-role=action]').html("");
  }

  //add content to content element
  _self.addContent = function (content) {
    var ele = _self.root.find('.' + _self.contentClass + '>[data-role=content]');
    ele.append(content);

  }

  //set content to content element, overrides any content already available
  _self.setContent = function (content) {
    var ele = _self.root.find('.' + _self.contentClass + '>[data-role=content]');
    ele.html(content);

  }
  _self.addCloseIcon = function () {
    var close = $("<span class='icon-close " + _self.closeClass + " cont-rht'></span>");
    close.click(function () {
      _self.close();
    });
    return close
  }

  _self.addRemoveIcon = function () {
    var remove = $("<span class='icon-close " + _self.closeClass + " cont-rht'></span>");
    remove.click(function () {
      _self.remove();
    });
    return remove
  }
  /**
   *set trigger element to open popup
   *@param openRef: jquery reference of trigger element
   */
  _self.openers = function (openRef) {
    openRef.live('click', function () {
      _self.show();
    });
  }

  _self.fixZIndex = function () {
    var mx = _self.root.css('z-index');
    var modif = false;
    $('.popup-root:visible').not(_self.root).each(function () {
      if ($(this).css('z-index') >= mx) {
        mx = $(this).css('z-index');
        modif = true;
      }
    });
    (modif) ? _self.root.css('z-index', Number(mx) + 1) : '';
  }

  _self.show = function () {
    _self.showShadow();
    _self.showContent();
    _self.fixZIndex();
  }

  _self.showShadow = function () {
    _self.root.css({'height': $('body').height()}).fadeIn();
    _self.getContentRef().hide();
  }
  _self.hideShadow = function () {
    _self.close();
  }

  _self.showContent = function () {
    var windowSize = $(window).height(); // height of browser window
    var popUpHeight = _self.getContentRef().height(); // height of popup window

    _self.fixZIndex();  //when multiple popups are opened

    if (windowSize < popUpHeight) {// when browser window is smaller than pop up height
      _self.getContentRef().fadeIn().css({'top': $(document).scrollTop()});
    } else {
      _self.getContentRef().fadeIn().css({'top': $(document).scrollTop(),'margin-top': (windowSize - popUpHeight) / 2.5 + 'px'});
    }

  }

  _self.showContentOnly = function () {
    _self.root.css({'height': 0}).show();
    _self.getContentRef().fadeIn().css({'top': $(document).scrollTop()});
  }

  _self.hideContent = function () {
    _self.hideShadow();
  }

  _self.remove = function () {
    _self.root.remove();
  }

  _self.close = function () {
    _self.root.hide();
  }
  //Event

}

HK.GLBLS = {
  cntxt: CONTEXT_ROOT,
  api: CONTEXT_ROOT + '/api'
};

HK.titles = {
  smthngNtRgt: "Something's not right",
  wow: "That's not normal",
  wowHold : 'Wow! Hold on there'
};

HK.Constants = {
  AC_ITEMS : 'autoCompleteItems',
  AC_VARIANTS : 'autoCompleteVariants'
};


HK.errs = {
  requestFail: 'Request Failed',
  enterEmail: 'Please enter email address',
  invalidEmail: 'Email address is not valid',
  enterPassword: 'Please enter password',
  enterName: 'Please enter your name',
  enterTitle: 'Please enter review title',
  enterReview: 'Please enter review description',
  enterRating: 'Please give rating to product',
  enterPhoneNumber: 'Please enter phone number',
  enterAddLine: 'Please enter address line 01',
  enterCity: 'Please enter city',
  enterState: 'Please enter state',
  invalidPincode: 'Please enter a valid pincode',
  invalidPhoneNumber: 'Please enter a valid no.',
  passwordNotMatch: 'Password and confirm password are not same',
  emailNotDifferent: 'New Email and Old Email must be different',
  passwordNotDifferent: 'New Email and Old Password must be different',
  enterMessage: 'Please enter your Message'
};

HK.msgs = {
  successRemove: 'Successfully Removed',
  successAdd: 'Successfully Added',
  upldFl: 'Upload File',
  ldng: 'Loading',
  added2Crt: 'Added to your cart',
  noProductFound : 'No product found',
  enterMessage : 'It would be great, if you just enter something to search for'

};

HK.urls = {
  autoCompleter: HK.GLBLS.api + '/ac/results',
  addPackToCart: HK.GLBLS.api + '/cart/pack/add',
  updatePackInCart: HK.GLBLS.api + '/cart/pack/update',
  removePackFromCart: HK.GLBLS.api + '/cart/pack/remove',
  //addVariantToCart: HK.GLBLS.api + '/cart/variant/add',
  addVariantToCart: HK.GLBLS.api + '/cart/productVariant/add',
  addVariantWithExtOp: HK.GLBLS.api + '/cart/productVariantExtOpt/add',
  updateVariantInCart: HK.GLBLS.api + '/cart/variant/update',
  removeFromCart: HK.GLBLS.api + '/cart/variant/remove',
  summaryCart: HK.GLBLS.api + '/cart/summary',
  review: HK.GLBLS.api + '/variant/review/',
  reviewRate: HK.GLBLS.api + '/variant/review/rate',
  addReview: HK.GLBLS.api + '/variant/review/add',
  reviewVote: '/vote?voteType=',
  cartPage: HK.GLBLS.cntxt + '/beta/cart/Cart.action',
  activationEmail: HK.GLBLS.api + "/email/activate",
  /*variantPage: HK.GLBLS.cntxt + "/variant/StoreVariant.action",*/
  boughtTogether: HK.GLBLS.api + "/variant/",
  paymentCreate: HK.GLBLS.api + "/payment/create",
  locationApi: HK.GLBLS.api + "/location",
  //offers,coupons
  applyOffer : HK.GLBLS.api + '/cart/applyOffer',
  applyCoupon : HK.GLBLS.api + '/cart/applyCoupon',
  rewardPoint : HK.GLBLS.api + '/reward/results',
  notifyUserDetails : HK.GLBLS.api + '/notify/details',
  notifyUpdate : HK.GLBLS.api + '/notify/update',
  speakToNutritionistDetails: HK.GLBLS.api + '/speakTo/details',
  speakToNutritionistSubmit: HK.GLBLS.api + '/speakTo/update',
  subscribeForMails: HK.GLBLS.api + '/subscribe/',
  variantOffer: HK.GLBLS.api + '/variant/browse/',
  getAllVariantsToCompare: HK.GLBLS.api + '/variant/compare/all',
  addVariantToCompare: HK.GLBLS.api + '/variant/compare/add',
  removeVariantToCompare: HK.GLBLS.api + '/variant/compare/remove',
  removeAllVariantsToCompare: HK.GLBLS.api + '/variant/compare/remove/all',
  //catalog page api links
  urlRoot: CONTEXT_ROOT + "/catalog/result/rq",
  searchUrlRoot: CONTEXT_ROOT + "/api/search/results",
  targetMantraUrl: 'http://api.targetingmantra.com/TMWidgets',
  variantReviews: HK.GLBLS.api + "/variant/browse/",
  browseUrl : HK.GLBLS.api + "/variant/browse/"




};
HK.timeOut = {
  xxs : 300,
  xs : 1000,
  small: 2000,
  medium: 5000,
  large: 10000,
  insane: 50000
};

function HKCatalog(){};

HKCatalog.prototype = {
  constructor : HKCatalog,
  settings : {
    updateHistory : true
  },
  statics : {
    SUB_CAT_PREFIX: "SCT-",
    MENU_LANDING: "CL-",
    BRAND_PREFIX: "BR-",
    BRAND_SEP: "~",
    BRAND_PARAM: "brands",
    FILTER_PARAM: "fl",
    CAT_PARAM: "catPrefix",
    NAV_KEY : "navKey",
    DEFAULT_SORT_BY: "rank",
    DEFAULT_SORT_TYPE: "asc",
    PER_PAGE : "perPage",
    PAGE_NO : "pageNo",
    SORT_BY : "sortBy",
    SORT_TYPE : "sortType",
    MIN_PRICE : 'minPrice',
    MAX_PRICE : 'maxPrice',
    MIN_SELECTED_PRICE : 'minSelectedPrice',
    MAX_SELECTED_PRICE : 'maxSelectedPrice',
    "EXCLUDE" : "excludeOOS"

  },
  elms : {
    'brands':'.sel-brand input[type=checkbox]',
    'catPrefix' : '[name=catPrefix]',
    'navKey' : '[name=navKey]',
    'txtQ' : '[name=txtQ]',
    'perPage' : '[name=perPage]',
    'startResult' : '[data-role=startResult]',
    'filterItems' : '.fltr-items',
    'sortItems' : '.sort-items',
    'selectedSortItemClass' : 'selectd-sort',
    'searchBox' : '[name=txtQ]',
    'textFilterSpan' : '.textFilterSpan',
    'sortByVariant' : '#sortByVariants',
    'sortByAttribute' : 'data-srt-by',
    'sortTypeAttribute' : 'data-srt-type',
    'minPrice' : '[name=minPrice]',
    'maxPrice' : '[name=maxPrice]',
    'minSelectedPrice' : '[name=minSelectedPrice]',
    'maxSelectedPrice' : '[name=maxSelectedPrice]',
    'bottomPager' : '#bottomPager',
    'loadMore' : '[data-role=load-more]',
    'resetAll' : '#refresh-all',
    'excludeOutOfStock' : '#excludeOOSFilterView input[type=checkbox]'

  },
  events : {
    /*Events list for application,
     must have one to one mapping with eventMapper*/
    filterModified : 'Filter-modified',
    changePerPage : 'Change-per-page',
    sortVariants  : 'Sort-variants',
    priceRangeChanged : 'Price-range-changed',
    loadMore : 'load-more',
    resetAll : 'reset-all'
  },
  eventMapper : {
    /*This object maintains array of methods to be called for any event triggered to create url,
     key for this object is an event registered for application.
     Without setting up this object lib wont work*/
  },

  prepareBrandsText : function(){             //Prepare query string for brand filter
    var str = '',
        _self = this,
        selectedElements = $(_self.elms.brands+':checked');
    $.each(selectedElements,function(){
      str += $(this).val() + _self.statics.BRAND_SEP;
    });
    return _self.statics.BRAND_PARAM + '=' +str;
  },
  prepareFilterGroupText : function(){      //Prepare query string for filter group
    var filterGroups = $('[data-role=filterGroup]').find('.fltr-items'),
        filterGroupString = '',
        _self = this;
    $.each(filterGroups,function(){
      var filterGroup = $(this);
      var filterGroupKey = filterGroup.attr('data-name');
      var filterString= filterGroupKey+':';
      var filterItems = filterGroup.find('input[type=checkbox]:checked');
      $.each(filterItems,function(){
        filterString += $(this).val() + ',';
      });
      if(filterItems.length>0){
        filterGroupString += filterString + ';';
      }
    });
    return _self.statics.FILTER_PARAM + '=' +filterGroupString;
  },
  prepareCatPrefixText : function(){      //prepare query string for cat prefixes
    var _self = this;
    return _self.statics.CAT_PARAM + '=' + $(_self.elms.catPrefix).val();
  },
  preparePerPageText : function(){
    var _self = this,
        perPage = $(_self.elms.perPage).val();

    return _self.statics.PER_PAGE + '=' + perPage;
  },
  prepareSortByText : function(){
    var _self = this,
        elm = $(_self.elms.sortByVariant).find(':selected'),
        sortBy = elm.attr(_self.elms.sortByAttribute),
        sortType = elm.attr(_self.elms.sortTypeAttribute);
    return _self.statics.SORT_BY + '=' + sortBy + '&' + _self.statics.SORT_TYPE + '=' + sortType;
  },
  preparePriceText : function(){
    var _self = this,
        minPrice = $(_self.elms.minSelectedPrice).val(),
        maxPrice = $(_self.elms.maxSelectedPrice).val();
    return _self.statics.MIN_PRICE + '=' + minPrice + '&' + _self.statics.MAX_PRICE + '=' + maxPrice;

  },

  prepareLoadMoreText : function(){
    var _self = this;
    pageNO = $(_self.elms.loadMore).attr('data-curr-page');
    return _self.statics.PAGE_NO + '=' + pageNO ;
  },
  createURL : function(event,extraParam){            //prepare URL for AJAX call
    var _self = this,
        createdURL = HK.urls.urlRoot+'?',
        queryParam = _self.getMethodsFromEventMapper(event.type);

    createdURL += extraParam?(extraParam +'=&'):'';
    createdURL += queryParam;
    _self.updateBrowserUrl(queryParam);
    return createdURL;
  },
  createLoadMoreURL : function(event,extraParam){            //prepare URL for AJAX call
    var _self = this,
        createdURL = HK.urls.urlRoot+ '?',
        queryParam = _self.getMethodsFromEventMapper(event.type);

    createdURL += (extraParam?extraParam:'pagination') +'=&';
    createdURL += queryParam;
    //_self.updateBrowserUrl(queryParam);
    return createdURL;
  },
  updateBrowserUrl : function(queryParam){    //change browser url when ajax call is done
    if(this.settings.updateHistory){
      var baseUrl = location.protocol + '//' + location.host + location.pathname+'?',
          _self = this,
          navKey = $(_self.elms.navKey).val();
      if(typeof navKey !== 'undefined'){
        baseUrl += _self.statics.NAV_KEY + '=' + navKey + '&';
      }
      baseUrl += queryParam;
      History.pushState(null, null, baseUrl);
    }
  },
  getMethodsFromEventMapper : function(eventName){      //call methods in eventMapper object for triggered event
    var _self = this;
    var methods = _self.eventMapper[eventName];
    var text = '';
    for(mthd in methods){
      text += _self[methods[mthd]]() + '&';
    }
    text += _self.getSearchQueryString();
    text += _self.getExcludeOutOfStockQuery();
    return text;
  },
  getSearchQueryString : function(){
      var _self = this,
          txtQ = $(_self.elms.textFilterSpan).attr('value'),
          str = '';

      if(txtQ === undefined || txtQ === null || txtQ.length === 0){
        return str;
      } else {
        return "&txtQ="+txtQ;
      }
  },
  getExcludeOutOfStockQuery : function () {
    var _self = this,
        oosRef = $(_self.elms.excludeOutOfStock+':checked');
    if(oosRef.length > 0){
      return "&"+_self.statics.EXCLUDE + '=' + 'true';
    }
    return '';
  },
  resetSlider : function(minValue,maxValue){    //reset slider to min and max value
    var _self = this;
    $(_self.elms.minPrice).val(minValue);
    $(_self.elms.maxPrice).val(maxValue)
  },
  renderSlider : function() {     //call bootstrap.slider plugin to render slider
    var _self = this;
    var json = {};
    json.minPrice = Number($(_self.elms.minPrice).val());
    json.maxPrice = Number($(_self.elms.maxPrice).val());
    json.minSelectedPrice = Number($(_self.elms.minSelectedPrice).val());
    json.maxSelectedPrice = Number($(_self.elms.maxSelectedPrice).val());
    json.stepSize = Math.floor((json.maxPrice - json.minPrice) / 10);

    var html = HK.UIHelper().renderToHtml($('#priceSliderViewTemplate2').html(), json);
    if (json.minPrice != json.maxPrice) {
      $('#priceSliderView').html(html);
      $('#sl2').slider().on('slideStop', function(ev) {
        $('body').trigger(_self.events.priceRangeChanged,{minSelectedPrice:ev.value[0],maxSelectedPrice:ev.value[1]});
      });

    } else {
      $('#priceSliderView').html('<div id="priceSliderView" class="slider-cntnr"><b class="cont-lft">Rs. ' + json.minPrice +
          '</b><b class="cont-rht">Rs. ' + json.minPrice +
          '</b><div class="slider slider-horizontal"><div class="slider-track"><div class="slider-handle round" style="left: 0%;cursor:auto;background-color:#eeeef4;background-image:none"></div><div class="slider-handle round" style="left: 94%;cursor:auto;background-color:#eeeef4;background-image:none"></div></div></div>');
    }

  },
  clearPage : function(){

    /*remove href from anchor tags,
     enable collapsible plugin on page,
     enable search field for brands*/
    var _self = this;
    //Remove link from page
    $(_self.elms.filterItems).find('a').removeAttr('href');
    $(_self.elms.loadMore).removeAttr('href');
    $('.fltr-menu').html(browseByTree);
    $(".fltr-box-cont").collapsible();
    _self.renderSlider();

    $("#search-brands").keyup(function (event) {
      var keyword = $(event.target).val();
      $("#brandFilterView").children().each(function () {
        if ($(this).text().toLowerCase().search(keyword.toLowerCase()) == -1) {
          $(this).hide();
        } else {
          $(this).show();
        }
      });
    });
  },
  loadMore : function(reqURL){
    HK.Ajax.customReq({url:reqURL,dataType:'html',success: function(data){

      $('#catContainer').html(data);
      HK.catalog.clearPage();
    }})
  },
  getBaseData : function ( reqURL, sCallback, fCallback ) {

    var successCallback = function(data){

      $('#catContainer').html("<div></div>");
      $('#catContainer').append(data);
      HK.shadow.hide();
      HK.catalog.clearPage();
    };
    //use custom call back provided by user
    if(typeof sCallback === 'function'){
      successCallback = sCallback;
    } else {
      HK.shadow.show();
    }
    HK.Ajax.customReq({url:reqURL,dataType:'html',success: successCallback});
  },
  getBaseDataResetSlider : function(reqURL){
    var _self = this;
    HK.shadow.show();
    HK.Ajax.customReq({url:reqURL,dataType:'html',success: function(data){

      $('#catContainer').html("<div></div>");
      $('#catContainer').append(data);
      _self.resetSlider($(_self.elms.minSelectedPrice).val(),$(_self.elms.maxSelectedPrice).val());
      HK.shadow.hide();
      HK.catalog.clearPage();
    }});
  }
};

/** Maintain objects needed across application Start **/
HK.dataObj = {};
/* method to generate an object of specified type
 Example:

 */
HK.dataObj.getObject = function (type) {
  if (HK.dataObj.hasOwnProperty(type)) {
    return HK.dataObj[type]()
  }
  return null
}
// a list of methods that are available
HK.dataObj.type = {
  UPDATE_CART: 'updateCart',
  VARIANT_DETAIL: 'variantDetail',
  CART_OFFER : 'cartOffer'
}
// generates object used in popup which is displayed when product is added to cart
HK.dataObj.updateCart = function () {

  function _UpdateCart() {
    this.cartValue = 0;
    this.noOfItems = 0;
    this.svName = '';
  }

  _UpdateCart.prototype.getCartValue = function () {
    return this.cartValue
  }
  _UpdateCart.prototype.setCartValue = function (cv) {
    this.cartValue = cv
  }
  _UpdateCart.prototype.getNoOfItems = function () {
    return this.noOfItems
  }
  _UpdateCart.prototype.setNoOfItems = function (noi) {
    this.noOfItems = noi
  }
  _UpdateCart.prototype.getSvName = function () {
    return this.svName
  }
  _UpdateCart.prototype.setSvName = function (name) {
    this.svName = name
  }
  return new _UpdateCart();
}

// Used to handle data related to offers on cart
HK.dataObj.cartOffer = function () {

  function _CartOffer() {
    this.id = null;
    this.nm = null;
    this.terms = '';
    this.applied = false;
    this.target = "javascript:void(0)";
  }

  return new _CartOffer();
}

HK.dataObj.variantDetail = function () {
  function _variantDetail() {

    this.sv_id = null;
    this.bt_var = {
      id: null,
      nm: "",
      offer_pr: null,
      catPre: null,
      mrp: null,
      discount: null,
      rank: null,
      rating: null,
      pr_img: {
          altText: null,
         //altText: null,
         caption: null,
         cap: null,
         xxt_link: null,
         xt_link: null,
         t_link: null,
         xxs_link: null,
         s_link: null,
         m_link: null,
         l_link: null
      },
      oos: null,
      cod_allowed: null,
      min_dsptch: null,
      max_dsptch: null,
      nv: 0
    };
    this['do'] = null;

  }

  return new _variantDetail()
}

/** Maintain objects needed across application End **/
HK.utils = {};
//Processes response from ajax calls
HK.utils.Response = {};

//Generates anchor tags
HK.utils.Link = {};

//Auto scroll from one section to another
HK.utils.Scroll = {};

//create an alert box as provided by bootstrap
HK.utils.createBootStrapAlert = function (errs) {
  var alertEle = createParentElement();
  alertEle.append(createCloseButton());
  alertEle.append(prepareMessage(errs));
  alertEle.alert();
  return alertEle;
  function createParentElement() {
    return $('<div class="alert alert-bootstrap"></div>')
  }

  function createCloseButton() {
    return $('<a class="close" data-dismiss="alert" href="#">&times;</a>')
  }

  function prepareMessage(msg) {
    if ($.isArray(msg)) {
      return HK.utils.createMessageList(msg)
    } else if (typeof msg == 'string') {
      return createMessage(msg)
    }
  }

  function createMessage(msgs) {
    return  "<div>" + msgs[i] + "</div>"
  }

}

//create html for an exceptions. Exceptions can be passed in form of single string or an array
HK.utils.generateHTMLForException = function (exptns) {
  var resultString = '';
  if (typeof exptns == 'undefined') {
    return resultString
  } else if (typeof exptns == 'string') {
    return exptns
  } else if ($.isArray(exptns)) {
    return HK.utils.createListFromArray(exptns)
  }
  return resultString
}

//create an unordered list for an array
HK.utils.createMessageList = function (msgs) {
  return HK.utils.createListFromArray(msgs);
}

//create an unordered list for an array
HK.utils.createListFromArray = function (arr) {
  var list = $('<ul class="gl"></ul>');
  if ($.isArray(arr)) {
    $.each(arr, function (i) {
      list.append("<li>" + arr[i] + "</li>");
    });
  }
  return list
}

HK.utils.getTextBeforeSeparator = function(input, separator, start) {
  var separatorIndex = input.indexOf(separator);
  var startCounter = (typeof start === "number") ? start : 0;
  if (separatorIndex) {
    return input.slice(startCounter, separatorIndex);
  } else {
    return '';
  }
}

HK.utils.getTextAfterSeparator = function(input, separator, end) {
  var separatorIndex = input.indexOf(separator) + 1; //+1 to read text after separator
  var endCounter = (typeof start === "number") ? start : input.length;
  if (separatorIndex) {
    return input.slice(separatorIndex, endCounter);
  } else {
    return '';
  }
}

HK.utils.fixGlobalMenu = function() {
  //fix height of global menu's sub categories
  $('.gm-sc-cntnr').css('min-height', $('#dropDownbox1').height() - 5);

  //fix width of global menu's sub categories
  $.each($('.gm-sc-cntnr'), function() {
    var self = $(this);
    var subCatCount = self.find('.span3').length; // provide count of how many vertical row are there in sub cat
    var multiplier = self.find('.span3:first').width(); // width of first vertical row
    var padParam = subCatCount * 32; // used to take into consideration paddings and margins
    self.width((subCatCount * multiplier) + padParam);
  });
};

HK.utils.getHeaderCartSummary = function () {
  HK.Ajax.getJson(CONTEXT_ROOT + "/api/cart/summary", function (resp) {
    alert(resp);
  });
}

//Check if response from ajax call contains exception or not
HK.utils.Response.hasErr = function (data) {
  if (data.exception) {
    return true
  }
  return false
}

//Check if response from ajax call contains exception or not
HK.utils.Response.getErr = function (data) {
  return HK.utils.createMessageList(data.messages)
}


HK.utils.Scroll.toTop = function (speed) {//soft scroll to top of the page
  this.toPosition();
}

HK.utils.Scroll.toElement = function (ele, speed) {//soft scroll to specified element
  var position = 0;
  try {
    position = $(ele).position().top;
  } catch (e) {
    //Un comment line below to see error on chrome, mozila, ie9 onwards
    //console.log(e)
  }
  this.toPosition(position, speed);
}
HK.utils.Scroll.toPosition = function (position, speed) {//soft scroll to specified position
  if (typeof speed != 'number') {
    speed = 300;
  }
  if (typeof position != 'number') {
    position = 0;
  }
  $('html,body').animate({scrollTop: position}, speed);
}

HK.utils.setHeight = function(elm, height) {

};

HK.utils.getElmWithMaxHeight = function(child, parent) {//returns element with largest height
  var pEle = parent, //parent selector
      pChi = child,  //child selector
      selector, //array of final elements
      maxHeight = 0, //contains maxHeight obtained till now
      largetElement; //reference to element with largest height
  if (typeof pEle === 'undefined') {//find if method invoked with single parameter
    selector = $(child);
  } else {//if both parameters are provided by user
    selector = $(parent).find(child);
  }

  $.each(selector, function() {//iterate over array of elements obtained from selector
    var curEleHeight = $(this).height();
    if (curEleHeight > maxHeight) {
      maxHeight = curEleHeight;
      largetElement = $(this);
    }
  });

  return largetElement;
}

HK.utils.updateHeightOfElements = function(height, child, parent) {//returns element with largest height
  var pEle = parent, //parent selector
      pChi = child,  //child selector
      selector; //array of final elements


  if (typeof pEle === 'undefined') {//find if method invoked with single parameter
    selector = $(child);
  } else {//if both parameters are provided by user
    selector = $(parent).find(child);
  }

  selector.height(height);


}

HK.utils.resetHeightOfCarousel = function() {
  var parentSelector = '.nbs-flexisel-ul';
  var childSelector = '.nbs-flexisel-item';

  $.each($(parentSelector), function() {
    var pEle = $(this);
    var cEle = $(this).find(childSelector);
    var height;
    resetHeight(cEle, pEle);
    height = getMaxHeight(cEle, pEle);
    cEle.height(height);
  });

  function resetHeight(cEle, pEle) {
    pEle.height('initial');
    cEle.height('initial');
  }

  function getMaxHeight(cEle, pEle) {
    return HK.utils.getElmWithMaxHeight(cEle, pEle).height();
  }


}
HK.element = {};

HK.element.disable = function (ele) {
  ele.attr('disabled', 'disabled');
}

HK.element.enable = function (ele) {
  ele.removeAttr('disabled');
}

HK.element.loader = {
  loaderEle: $('<span class=loader></span>'),
  add: function (ele, hideEle) {

    this.loaderEle.insertAfter(ele);
    if (hideEle === true) {
      ele.hide();
    }
  },
  remove: function (ele, showEle) {
    ele.siblings('.' + this.loaderEle.attr('class')).remove();
    if (showEle === true) {
      ele.show();
    }
  }
}

HK.Cart = {
  elm: {
    //individaul item details

    cartItem : '[data-role=item]',
    itemQuantity : '[data-role=item-quantity]',
    itemMinus : '[data-role=item-minus]',
    itemPlus : '[data-role=item-plus]',
    packQuantity : '[data-role=pack-quantity]',
    packMinus : '[data-role=pack-minus]',
    packPlus : '[data-role=pack-plus]',
    itemRemove : '[data-role=item-remove]',
    packRemove : '[data-role=pack-remove]',
    itemOfferPrice : '[data-role=item-offer-price]',
    itemMrpPrice : '[data-role=item-mrp-price]',
    //cart summary details
    cartSummary: '[data-role=cart-summary]',
    totalPayable: '[data-role=total-payable]',
    totalMrpPrice: '[data-role=total-mrp-price]',
    totalOfferPrice: '[data-role=total-offer-price]',
    promoDiscount: '[data-role=promo-discount]',
    shippingCharges: '[data-role=shipping-charges]',
    totalSave: '[data-role=total-save]',
    //offers
    cartOffer : '.offers-container'

  },
  events :{
    update : 'update',
    packUpdate : 'packUpdate',
    offerUpdate : 'cartOfferUpdate',
    add : 'add',
    packAdd : 'packAdd',
    sub : 'sub',
    packSub : 'packSub',
    remove : 'drop',
    packRemove : 'packDrop'
  }
}


$(document).ready(function () {

  HK.utils.fixGlobalMenu();

  //patch to trigger auto carousel effect of banners && focus on search box
  setTimeout(function(){
  $('.carousel-indicators').find('[data-slide-to]:first').trigger('click').parents('.carousel').bind('click',function(){
    $(this).data('carousel').options.interval=false;
  });
    $('[name=txtQ]').focus();
  },100);

  /**--------------------------------------Error/Success msgs begins----------------------------------**/
  $('.remove-error').click(function () {
    $(this).parent('.err-cntnr').remove();
  });
  $('.remove-success').click(function () {
    $(this).parent('.alert-cntnr').remove();
  });
  /**--------------------------------------Error/Success msgs end----------------------------------**/

  /**--------------------------------------- custom pop up box JS starts --------------------------------------------------**/
  HK.POPUP = {
    THEME: {
      ALERT: 'popup-theme-orange'
    }
  }

  HK.shadow = function() {
    var shdwPrnt = $('<div></div>');
    var shdw = $('<div></div>');
    var loader = $('<div></div>')
    shdwPrnt.css({width:'100%',position:'absolute','z-index':'1000',top:0,display:'none'});
    shdw.css({height:'inherit',opacity:'0.5',alpha:'0.5','background-color':'#eee'});
    loader.css({position:'fixed',top:'40%',right:'48%'}).addClass('icn-loader-large');

    shdwPrnt.append(shdw);
    shdwPrnt.append(loader);

    $('body').append(shdwPrnt);

    return {show : function() {
      shdwPrnt.css({'display':'block',height:$('html').height()});
    },
      hide : function() {
        shdwPrnt.css('display', 'none');
      }
    }

  }();
  /*
   * HK.alert({title:"custom",theme:HK.POPUP.THEME.ALERT,content:"Sample alert"});
   * HK.alert("Sample alert");
   */
  HK.alert = function () {
    /**
     *@param content: text to be displayed
     *@param type: type of alert to be displayed
     */
    return function (settings, type) {
      if (typeof settings == undefined || settings == null) {
        settings = 'Nothing specified';
      }
      var conf = {title: 'Alert', closeType: 'remove', theme: 'popup-theme', content: '', boxSize: {'min-height': '100px', 'height': 'auto'}};
      if (typeof settings == 'string') {
        content = settings;
      }
      if (typeof settings == 'object') {
        content = settings.content;
        $.extend(conf, settings);
      }
      var pop = new PopUpUtil();
      pop.createPopUp(conf);

      pop.shadow = function () {
        pop.showShadow();
        pop.shadowUnbindClick();
      };
      pop.removeShadow = function () {
        pop.shadowBindClick();
        pop.close();
      }

      pop.removeActionButtons();
      if (type == "error") {
        pop.getContentRef().addClass('err');
      } else {
        pop.getContentRef().removeClass('err');
      }
      pop.setContent(content);
      pop.show();
      return pop;
    }

  }();

  /*
   * HK.confirm({title:"custom",theme:HK.POPUP.THEME.ALERT,content:"Sample alert",btnArr : [{text:'ok',callback:function(){},title:"hint",data:object},{text:'Close',callback:function(){},title:"hint",data:object}]});
   * HK.confirm("Sample alert",[{text:'',callback:function(){},title:"hint",data:object,{text:'Something',callback:function(){},title:"hint",data:object}}]);
   */
  HK.confirm = function () {

    return function (settings, btnArr) {
      if (typeof settings == undefined || settings == null) {
        settings = 'Nothing specified';
      }
      var conf = {title: 'Confirm', closeType: 'remove', theme: 'popup-theme', content: '', boxSize: {'min-height': '100px', 'height': 'auto'}};
      if (typeof settings == 'string') {
        content = settings;
      }
      if (typeof settings == 'object') {
        content = settings.content;
        btnArr = settings.btnArr;
        $.extend(conf, settings);
      }
      var pop = new PopUpUtil();
      pop.createPopUp(conf);
      //
      try {
        var btns = $("<div></div>");
        pop.removeActionButtons();
        $(btnArr).each(function () {
          var text = '';
          var callback;
          var title = '';

          if ((typeof this.text).toLowerCase() == 'string') {
            text = this.text;
          } else {
            throw('Button text is mandatory');
          }

          if ((typeof this.callback).toLowerCase() != 'undefined') {
            callback = this.callback;
          } else {
            throw('Callback function is mandatory');
          }

          if ((typeof this.title).toLowerCase() == 'string') {
            title = this.title;
          }

          var btn = $('<a href="javascript:void(0)" class="btn btn-blue popup-remove"></a>');
          btn.html(text).attr('title', title);
          if (this.data != null) {
            btn.click(this.data, callback);
          } else {
            btn.click(callback);
          }
          pop.addActionButton(btn);
        });
        pop.setContent(content + "<br>");
        pop.addContent(btns);
        pop.getContentRef().removeClass('err');
        pop.show();
        return pop;
      } catch (e) {
        //console.log(e);
      }
    }

  }();


  /*
   *
   * HK.vTooltip("Sample alert",[{text:'',callback:function(){},title:"hint",data:object,{text:'Something',callback:function(){},title:"hint",data:object}}]);
   */
  HK.vTooltip = function () {

    return function (element) {

      //22 is based on the tooltip padding, margin and font-size 5+5+12+20=42
      var top = element.offset().top + (element.height() - 42) / 2;
      var left = element.position().left;
      /*console.log(top);
       console.log(left);*/

      //element.before(tooltipContent);
      //just now added prev
      prev = element.prev();
      left = left - prev.outerWidth() - 17;
      prev.css({'left': left});

      content = "sample";

      var conf = {boxSize: {position: 'absolute', 'top': top, height: 'auto', width: '100px', margin: '0px'}, haveTitle: false};
      var pop = new PopUpUtil();

      pop.createPopUp(conf, element);
      pop.root.css({top: 'initial', left: 'initial'});
      pop.setContent(content + "<br>");


      pop.showContentOnly();
      return pop;

    }

  }();
  /**-------------------------------------- Custom pop up JS ends --------------------------------------------------------**/


  /**-------------------------------------- Banner layout JS starts ------------------------------------------------------**/

  /*    //rotation speed and timer
   var speed = 5000;
   var run = setInterval('rotate()', speed);
   //grab the width and calculate left value
   var item_width = $('#slides li').outerWidth();
   var left_value = item_width * (-1);
   //move the last item before first item, just in case user click prev button
   $('#slides li:first').before($('#slides li:last'));
   //set the default item to the correct position
   $('#slides ul').css({'left' : left_value});
   //if user clicked on prev button
   $('#prev').click(function() {
   //get the right position
   var left_indent = parseInt($('#slides ul').css('left')) + item_width;

   //slide the item
   $('#slides ul:not(:animated)').animate({
   'left' : left_indent}, 200, function() {
   //move the last item and put it as first item
   $('#slides li:first').before($('#slides li:last'));
   //set the default item to correct position
   $('#slides ul').css({'left' : left_value});
   });
   //cancel the link behavior
   return false;
   });
   //if user clicked on next button
   $('#next').click(function() {
   //get the right position
   var left_indent = parseInt($('#slides ul').css('left')) - item_width;
   //slide the item
   $('#slides ul:not(:animated)').animate({'left' : left_indent}, 200, function () {
   //move the first item and put it as last item
   $('#slides li:last').after($('#slides li:first'));
   //set the default item to correct position
   $('#slides ul').css({'left' : left_value});
   });
   //cancel the link behavior
   return false;
   });

   //cancel the link behavior
   return false;
   });
   //if mouse hover, pause the auto rotation, otherwise rotate it
   $('#slides').hover(
   function() {
   clearInterval(run);
   },
   function() {
   run = setInterval('rotate()', speed);
   }
   );*/
  $('.hdr-drop-cntnr').hover(function () {
    $(this).addClass('hdr-drop-cntnr-hover').find('.hdr-drop-down').show();
    $('.cart-pop-container ').removeClass('cart-pop-container-hover').find('#cartPop').hide();
    },
      function () {
        $(this).removeClass('hdr-drop-cntnr-hover').find('.hdr-drop-down').hide();
      });

  $('.hdr-drop-cntnr').on('click', function(e) {

    $(this).trigger('mouseenter');
    $('.cart-pop-container').trigger('mouseleave');
    e.stopPropagation();
  });

  $('.cart-pop-container').hover(function () {
    $(this).addClass('cart-pop-container-hover').find('#cartPop').show();
  }/*,
      function () {
        $(this).removeClass('cart-pop-container-hover').find('#cartPop').hide();
      }*/);
  $('.cart-pop-container').click(function(e) {
    $(this).trigger('mouseenter');
    $('.hdr-drop-cntnr').trigger('mouseleave');
    e.stopPropagation();
  });
  (function () {
    var onSuccess = function (json) {


      if (json.exception) {
        HK.alert({title: HK.titles.smthngNtRgt, content: HK.utils.generateHTMLForException(json.results), theme: HK.POPUP.THEME.ALERT});
      } else {
        var results = json.results;
        var updateCartData = HK.dataObj.getObject(HK.dataObj.type.UPDATE_CART);

        updateCartData.setCartValue(results.cartValue);
        updateCartData.setNoOfItems(results.noOfItems);

        //updateCartData.setSvName(results.svName);
        HK.updateCartPop(updateCartData, false);
      }
    };
    var onError = function (xhr, a_status) {
      HK.alert({title: HK.titles.smthngNtRgt, content: HK.errs.requestFail, theme: HK.POPUP.THEME.ALERT});

    }
    HK.Ajax.getJson(HK.urls.summaryCart, onSuccess, onError);
  }()
      )


  $('.go-to-top').click(function (e) {
    e.preventDefault();
    HK.utils.Scroll.toTop();
  })

  //show go to top button in footer
  if ($(window).height() < $(document).height()) {
    $('#footer').find('.go-to-top').show();
  }

  //fix body height
  if ($(window).height() > $('body').height()) {
    $('.mainContainer').css('min-height', $(window).height() - $('#header').height() - 200);
  }

  //fix for carousel image loading using lazyload
  setTimeout(function() {
    if ($('.nbs-flexisel-nav-left,.nbs-flexisel-nav-right')) {
      $('img.lazy').lazyload({skip_invisible:false});
      $('body').on('click', '.nbs-flexisel-nav-right', function() {
        setTimeout(function() {
          $(window).trigger('scroll')
        }, HK.timeOut.xxs);
      });
      $('body').on('click', '.nbs-flexisel-nav-left', function() {
        setTimeout(function() {
          $(window).trigger('scroll')
        }, HK.timeOut.xxs);
      });
    }
  }, HK.timeOut.medium);


  //Scroll to an element
  $('[data-scroll-target]').on('click', function() {
    var curEle = $(this);
    HK.utils.Scroll.toElement($(curEle.data('scrollTarget')), curEle.data('scrollTime'));
  });
  //document ready ends
});


function rotate() {
  $('#next').click();
}
/**-------------------------------------- Banner layout JS ends --------------------------------------------------------**/

/**--------------------------------------AUTO COMPLETER STARTS--------------------------------------------------------------**/

/*
 * el: target element for autocomplete
 * dataUrl: url resource that will return json data
 * onSuccess: method to be called on successfully receiving json data
 * onSelect: method to be called on the select event
 * minLength: minimum length on which autocomplete shall be triggered
 */
HK.AutoCompleter = function () {
  return {
    autocomplete: function (el, dataUrl, onSuccess, onSelect, minlength, items) {
      var itemsList = new Array();
      var NoResultsLabel = "No Results";
      el.autocomplete({
        source: function (request, response) {
          $.ajax({
            url: dataUrl,
            dataType: "json",
            data: {
              q: request.term,
              noRs: items > 0 ? items : 10
            },
            success: function (responseData) {
              var autoId = el.parent('.autoParent').find('.autoId');
              itemsList = onSuccess.call(this, responseData, autoId);

              if (!itemsList.length) {
                itemsList = [NoResultsLabel];
              }
              response(itemsList);
            }
          });
        },
        minLength: minlength,
        delay: 300,
        select: function (event, ui) {
          if (onSelect != null) {
            onSelect.call(this, ui);
          }
        }
      });
    }
  }
};

HK.AutoCompleterStatic = function () {
  return {
    autocomplete: function (el, dataUrl, onSuccess, onSelect, minlength) {
      var itemsList = new Array();
      var NoResultsLabel = "No Results";

      $.ajax({
        url: dataUrl,
        dataType: "json",
        success: function (responseData) {
          var autoId = el.parent('.autoParent').find('.autoId');
          itemsList = onSuccess.call(this, responseData, autoId);
        },
        async: false
      });

      el.autocomplete({
        source: function (request, response) {
          var results = $.ui.autocomplete.filter(itemsList, request.term);

          if (!results.length) {
            results = [NoResultsLabel];
          }

          response(results);
        },
        minLength: minlength,
        select: function (event, ui) {
          if (ui.item.label === NoResultsLabel) {
            event.preventDefault();
          }
          if (onSelect != null) {
            onSelect.call(this, ui);
          }
        },
        focus: function (event, ui) {
          if (ui.item.label === NoResultsLabel) {
            event.preventDefault();
          }
        }
      });
    }
  }
};

/**--------------------------------------AUTO COMPLETER ENDS--------------------------------------------------------------**/

HK.updateCartPop = function (data, showPop) {
  try {
    var nm = data.getSvName();
    var cartValue = data.getCartValue();

    //var pForm = data.pForm;
    var cartSize = data.getNoOfItems();

  }
  catch (e) {

  }
  var ele = $('#cartPop');
  var txt = ele.find('.body .msg');
  txt.html('');
  if (nm != null && nm.length > 0) {
    txt.append('<div class="fnt-bold mrgn-b-5">Recent</div>');
    txt.append(nm + '<div class="fnt-light">' + HK.msgs.added2Crt + "</div>");
    txt.append('<hr>');
  }
  txt.append('<div class="fnt-bold mrgn-b-5">Cart summary</div>');
  txt.append('<div>' + cartSize + ' items ');
  if (cartSize > 0)
  {
    //txt.append('| Rs. ' + cartValue + '</div>');
  } else {
    txt.append('</div>');
  }
  txt.append('<br>');
  txt.append('<div class=""><a href="' + HK.urls.cartPage + '" style=""class="btn btn-blue fnt-caps btn-mini">Proceed to Cart</a></div>');
  //updateCartCounter(cartSize);
  $('[data-role=cart-counter]').text(cartSize);
  if (showPop != false) {
    $('.cart-pop-container').addClass('cart-pop-container-hover');
    ele.show();
/*
    $('.cart-pop-container').unbind();
*/


  }
}

/**
 * map implementation
 */

HK.HashMap = function Map() {
  this.keys = new Array();
  this.data = new Object();

  this.put = function(key, value) {
    if (this.data[key] == null) {
      this.keys.push(key);
    }
    this.data[key] = value;
  };

  this.get = function(key) {
    return this.data[key];
  };

  this.remove = function(key) {
    var index = $.inArray(key, this.keys) ;
    if (index > -1) {
      this.keys.splice(index, 1);
      this.data[key] = null;
    }
  };

  this.each = function(fn) {
    if (typeof fn != 'function') {
      return;
    }
    var len = this.keys.length;
    for (var i = 0; i < len; i++) {
      var k = this.keys[i];
      fn(k, this.data[k], i);
    }
  };

  this.entrys = function() {
    var len = this.keys.length;
    var entrys = new Array(len);
    for (var i = 0; i < len; i++) {
      entrys[i] = {
        key : this.keys[i],
        value : this.data[i]
      };
    }
    return entrys;
  };

  this.isEmpty = function() {
    return this.keys.length == 0;
  };

  this.size = function() {
    return this.keys.length;
  };
}

/**
 * map end
 */

HK.Ajax = function () {


  return {

    getJson: function (url, onSuccess, onError) {
      jQuery.ajax({type: "GET", url: url, dataType: "json", cache : false,
        success: function (json) {

          if (HK.utils.Response.hasErr(json)) {
            //console.log("has err su" + json + " url " + url);
            HK.alert({content: HK.utils.Response.getErr(json), theme: HK.POPUP.THEME.ALERT});
          } else {
            if (typeof onSuccess === "function")
              onSuccess.call(this, json);
          }
        },
        error: function (xhr, a_status) {
          var errorMsg;
          //console.log("has err er" + a_status + " xhr " + xhr);
          if (typeof onError === "function") {
            onError.call(this, xhr, a_status);
          } else if (a_status === "error") { // Expected status: timeout/error/notmodified/parsererror
            if (xhr.status == 404) {
              errorMsg = " This request does not exist.";
            } else if (xhr.status == 500) {
              errorMsg = "An unexpected error occured on server while processing this request. Try Again."
            }
          } else if (a_status === "timeout") {
            errorMsg = "Stay the patient course. Of little worth is your ire. The network is down."
          } else if (a_status === "parsererror") {
            errorMsg = "Yesterday it worked. Today it is not working. The response from server couldn't be processed properly."
          }
          if (errorMsg) {
            HK.alert({title: 'We cannot allow that', content: errorMsg, theme: HK.POPUP.THEME.ALERT});
          }
        },
        beforeSend: function (xhr) {
          if (xhr) {
            xhr.setRequestHeader("Accept", "application/json");
          }
        }
      });
    },
    postJson: function (url, map, onSuccess, onError) {
      jQuery.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: url,
        data: JSON.stringify(map),
        dataType: "json",
        cache : false,
        success: function (json) {
          if (typeof onSuccess === "function") {
            onSuccess.call(this, json);
          } else {
            if (HK.utils.Response.hasErr(json)) {
              logE.push(logE.create({"error":json.messages[0],"target":url,"params":map}));
              HK.alert({content: HK.utils.Response.getErr(json), theme: HK.POPUP.THEME.ALERT});
            }
          }
        },
        error: function (xhr, a_status) {
          var errorMsg;
          if (typeof onError === "function") {
            onError.call(this, xhr, a_status);
          } else if (a_status === "error") { // Expected status: timeout/error/notmodified/parsererror
            if (xhr.status == 404) {
              errorMsg = " This request does not exist.";
            } else if (xhr.status == 500) {
              errorMsg = "An unexpected error occured on server while processing this request. Try Again."
            }
          } else if (a_status === "timeout") {
            errorMsg = "Stay the patient course. Of little worth is your ire. The network is down."
          } else if (a_status === "parsererror") {
            errorMsg = "Yesterday it worked. Today it is not working. The response from server couldn't be processed properly."
          }
          if (errorMsg) {
            logE.push(logE.create({"error":errorMsg,"target":url,"params":map,"responseStatus":xhr.status,"status":a_status}));
            HK.alert({title: 'We cannot allow that', content: errorMsg, theme: HK.POPUP.THEME.ALERT});
          }
        },
        beforeSend: function (xhr) {
          if (xhr) {
            xhr.setRequestHeader("Accept", "application/json");
          }
        }
      });
    },
    customReq: function (reqObj) {
      var def = {
        type: "GET",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        cache : false,
        success: function (json) {

        },
        error: function (xhr, a_status) {
          var errorMsg;
          if (typeof onError === "function") {
            onError.call(this, xhr, a_status);
          } else if (a_status === "error") { // Expected status: timeout/error/notmodified/parsererror
            if (xhr.status == 404) {
              errorMsg = " This request does not exist.";
            } else if (xhr.status == 500) {
              errorMsg = "An unexpected error occured on server while processing this request. Try Again."
            }
          } else if (a_status === "timeout") {
            errorMsg = "Stay the patient course. Of little worth is your ire. The network is down."
          } else if (a_status === "parsererror") {
            errorMsg = "Yesterday it worked. Today it is not working. The response from server couldn't be processed properly."
          }
          if (errorMsg) {
            HK.alert({title: 'We cannot allow that', content: errorMsg, theme: HK.POPUP.THEME.ALERT});
          }
        },
        beforeSend: function (xhr) {
          if (xhr) {
            xhr.setRequestHeader("Accept", "application/json");
          }
        }
      };
      var ajaxObj = $.extend(def, reqObj);
      jQuery.ajax(ajaxObj);
    }
  };
}();


/**---------------------------------------Accordion Plugin starts--------------------------------------------------------**/
/**
 * Created with IntelliJ IDEA.
 * User: Sachit
 * Date: 23/05/13
 * Time: 13:44
 *
 * ele : class of parent container where accordion to be applied
 */
$.fn.collapsible = function (elementClass) {
  return this.each(function () {

    //define
    var ele = $(this);
    var collapsibleHeading = ele.find(".collapsible-hdr");
    var collapsibleContent = ele.find(".collapsible-cntnt");
    //modify markup & attributes

    collapsibleHeading.children("span").addClass('collapsible-heading')
        .prepend('<span class="collapsible-heading-status"></span>')
        .wrapInner('<a href="#" class="collapsible-heading-toggle"></a>');
    collapsibleContent.addClass('collapsible-content');
    //events
    collapsibleHeading.unbind('collapse')
        .bind('collapse', function () {
      $(this).children("span")
          .addClass('collapsible-heading-collapsed icn-expand');
      //.find('.collapsible-heading-status').text('Show ');

      collapsibleContent.slideUp(function () {
        $(this).addClass('collapsible-content-collapsed').removeAttr('style').attr('aria-hidden', true);
      });
    }).unbind('expand').
        bind('expand', function () {
      $(this).children("span")
          .removeClass('collapsible-heading-collapsed icn-expand');
      //.find('.collapsible-heading-status').text('Hide ');
      collapsibleContent
          .slideDown(function () {
        $(this).removeClass('collapsible-content-collapsed').removeAttr('style').attr('aria-hidden', false);
      });
    }).unbind('click')
        .click(function () {

      if ($(this).children("span").is('.collapsible-heading-collapsed')) {
        $(this).trigger('expand');
      }
      else {
        $(this).trigger('collapse');
      }
      return false;
    })
        .trigger('expand');
  });
};
/**---------------------------------------Accordion Plugin ends----------------------------------------------------------**/

/*dialog js plugin begins dont change without consulting author :)*/
function ShowHide(divId, status)
{
  var viewportwidth = $(document).width();
  var viewportheight = $(document).height();
  if (status != '1') var status = '0';
  if (status == '0')
  {

    $('#' + divId).removeClass('hide').addClass('show');
    $('#overlayDIV').removeClass('hide').addClass('show').css({width: viewportwidth + 'px', height: viewportheight + 'px'});
  }
  else
  {
    $('#' + divId).removeClass('show').addClass('hide');
    $('#overlayDIV').removeClass('show').addClass('hide');
  }
}

/*dialog Js plugin ends */

/**---------------------------------------handle bar template handler starts----------------------------------------------------------**/
HK.UIHelper = function () {
  return{
    renderToHtml: function (template, json) {
      var handleBarTemplate = Handlebars.compile(template);
      var html = handleBarTemplate(json);

      //return html.replace("<!--\n", "");
      return $.trim(html);
    }
  };
};

/**---------------------------------------handle bar template handler ends----------------------------------------------------------**/

/**--------------------------------------Validation add ons start----------------------------------**/
HK.regex = {};
HK.regex.EMAIL = /^([A-Za-z0-9_\-\.\+])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

HK.regex.phone = /[\+0-9\-]+$/;
HK.regex.number = /^[0-9]+$/;
HK.regex.pincode = /^[0-9]{6}$/;

HK.validator = {};

HK.validator.prep = function (ref) {
  return this.jqfy(ref);
}

HK.validator.jqfy = function (ref) {
  if (typeof ref == 'string') {
    return $(ref);
  } else if (typeof ref == 'object') {
    return ref;
  }
  return false
}

HK.validator.getLength = function (ele) {
  //textarea use case not covered yet
  var trimmedVal = $.trim(ele.val());
  return trimmedVal.length;
}

HK.validator.minLength = function (ele, ln) {
  ele = this.prep(ele);
  if (HK.validator.getLength(ele) >= ln) {
    return true;
  }
  return false;
}

HK.validator.maxLength = function (ele, ln) {
  ele = this.prep(ele);
  if (HK.validator.getLength(ele) <= ln) {
    return true;
  }
  return false
}

HK.validator.isNull = function (ele) {
  ele = this.prep(ele);
  if (HK.validator.getLength(ele) <= 0) {
    return true
  }
  return false
}


HK.validator.isEqual = function (ele1, ele2) {
  ele1 = this.prep(ele1);
  ele2 = this.prep(ele2);
  if (ele1.val() === ele2.val()) {
    return true
  }
  return false
}

HK.validator.isEmail = function (ele) {
  ele = this.prep(ele);
  var rege = HK.regex.EMAIL;
  if (rege.test(ele.val())) {
    return true;
  }
  return false
}

HK.validator.isPhoneNumber = function (ele) {
  ele = this.prep(ele);
  var rege = HK.regex.phone;
  if (rege.test(ele.val())) {
    return true;
  }
  return false
}

HK.validator.isNumber = function (ele) {
  ele = this.prep(ele);
  var rege = HK.regex.number;
  if (rege.test(ele.val())) {
    return true;
  }
  return false
}


HK.validator.isPincode = function (ele) {
  ele = this.prep(ele);
  var trimmedEle = $.trim(ele.val());
  var rege = HK.regex.pincode;
  if (rege.test(trimmedEle)) {
    return true;
  }
  return false
}
HK.validator.showErrMsg = function (ele, msg) {
  ele = this.prep(ele);
  var errorIcn = $("<span class='icn-warning-small err-icn' ></span>");
  var errTxtMsg = $("<p class='err-txt'>" + msg + "</p>");
  if (!$(ele).hasClass('err-brdr')) {
    $(ele).addClass('err-brdr');
    $(ele).after(errorIcn);
    $(ele).after(errTxtMsg);
    return true
  }
  return false
}

HK.validator.hideErrMsg = function (ele) {
  ele = this.prep(ele);
  $(ele).removeClass('err-brdr');
  $(ele).next('.err-txt').remove();
  $(ele).next('.icn-warning-small').remove();

}


/**--------------------------------------Validation add ons end----------------------------------**/

$(document).click(function () {
  $('.cart-pop-container').removeClass('cart-pop-container-hover');
  $('.hdr-drop-cntnr').removeClass('hdr-drop-cntnr-hover');
  $('.popUp,.hdr-drop-down').hide();
/*
    $('.cart-pop-container').bind("mouseleave mouseenter", function(){});
*/

});

/*Review box plugin begins*/

function reviewParamsCalc(reviewList, total_reviews_count, variantId) {
  var avgRating = 0,
      avgRatingRounded = 0,
      totalRating = 0,
      key, displayOrder = [];

  avgRating = reviewList.ovrall_rtng;
  totalRating = reviewList.ttl_rtng;
  reviewList.rating = [];
  reviewList.displayOrder = displayOrder;
  avgRatingRounded = avgRating.toFixed(1);

  function createRatingObj(count, totalRating, ratingType) {
    return {ratingCount: count, ratingPercent: Math.round(count / totalRating * 100), ratingKey: ratingType };
  }

  for (key in reviewList.rtng_dmn) {
    if (reviewList.rtng_dmn.hasOwnProperty(key)) {
      displayOrder.push(key);
    }
  }
  displayOrder.reverse();
  for (rtng in  displayOrder) {
    reviewList.rating[rtng] = createRatingObj(reviewList.rtng_dmn[displayOrder[rtng]], totalRating, displayOrder[rtng]);
  }
  reviewList.avgRatingRounded = avgRatingRounded;
  reviewList.total_reviews_count =   total_reviews_count  ;
  reviewList.varId = variantId;
}

function checkHoverPosition(_this) {

  var pageType = _this.parents('.js-hvr-rvw').data("page-type"),
      hvrThreshold = 700,
      leftRvwCntnrWidth= 0,
      cntOffset= 0,
      rightRvwCntnrWidth = "-" + ($('.vrnt-rvw-cnt').width() + 20) + "px";
      console.log(pageType);
      pageType == 'catalog' ? cntOffset = _this.parents('.varnt-cont').offset().left : '';
      pageType == 'catalog' ? leftRvwCntnrWidth = $('.varnt-cont').width() + "px" : '';



  if (_this.hasClass("active")) {
    if (cntOffset > hvrThreshold) {
      _this.find('[data-review-for]').find('.ratng-desc').removeClass('left-arrw');
      _this.find('[data-review-for]').find('.rtng-bars-cnt').addClass('right-arrw');
      _this.find('[data-review-for]').css('margin-left', rightRvwCntnrWidth).show();
    }
    else {
      if(pageType == 'variant'){
        _this.find('[data-review-for]').find('.ratng-desc').removeClass('left-arrw').addClass('up-arrw');
        _this.find('[data-review-for]').css({'margin-left' :  '0', 'margin-top' :  '10px'}).show();


      }
      _this.find('[data-review-for]').css('margin-left', leftRvwCntnrWidth).show();

    }
  }
  else {
    _this.find('[data-review-for]').hide();

  }
}
///variant review box

$('.js-hvr-rvw').on('mouseenter', '.rating-cont',function (e) {
  var _this = $(this),
      status = _this.attr('data-status');
  _this.addClass('active');

  if (status === "true") {
    _this.attr('data-status', "false");
    var variantId = _this.data("varid"),
        total_reviews_count =_this.data("reviews-count");

    HK.Ajax.customReq({url: HK.urls.variantReviews + variantId + "/reviews",
      success: function (responseData) {
        var reviewList = responseData.results.vrnt_rtng;
        var variantTemplate = Handlebars.compile($('#variantReviewTemplate').html());
        var reviewContainer = _this;
        if (!$.isEmptyObject(reviewList)) {
          reviewParamsCalc(reviewList, total_reviews_count, variantId);
          var content = variantTemplate(reviewList);
          reviewContainer.append(content);
          checkHoverPosition(_this);

        }
      }, dataType: "json", cache: true});

  } else {

    checkHoverPosition(_this);
  }
}).on('mouseleave', '.rating-cont', function (e) {
      var _this = $(this);
      _this.removeClass('active');
      _this.find('[data-review-for]').hide();
    })
/*Review box plugin ends*/

