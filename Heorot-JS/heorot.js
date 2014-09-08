Heorot = {
  
  each: function(array, func){
    for (var i=0, ii = array.length; i < ii; i ++) {
      func(array[i])
    }
  },

  map: function(array, func){
    returnArray = []
    for (var i=0, ii = array.length; i < ii; i ++) {
      console.log(i)
      returnArray.push(func(array[i]))
    }
    return returnArray
  },
  
  sortBySortAttr: function (parent, sortedSelector, keySelector) {
    var sections = $(parent).find(sortedSelector).sort(function(a, b) {
      var vA = Paths.grabTextParseInt($(keySelector, a));
      var vB = Paths.grabTextParseInt($(keySelector, b));
      return (vA < vB) ? -1 : (vA > vB) ? 1 : 0;
    });
    $(parent).append(sections);
  },
  
  scrollHelper : {
    scrollCheck: function(stationaryElement, event, amount){
      if (this.insideXAxisCheck(stationaryElement, event)) {
        var topOfElement = stationaryElement.offset().top

        if (topOfElement > event.pageY){
          this.scrollListUp(stationaryElement, amount);
        }

        else if (topOfElement + stationaryElement.height() < event.pageY) {
          this.scrollListDown(stationaryElement, amount);
        }
      }
    },

    insideXAxisCheck: function(stationaryElement, event) {
      var offset = stationaryElement.offset()
      var leftOfElement = offset.left
      var rightOfElement = offset.left + stationaryElement.width()

      return (event.pageX < rightOfElement && event.pageX > leftOfElement)
    },

    scrollListUp: function(stationaryElement, amount) {
      stationaryElement.scrollTop(stationaryElement.scrollTop() - amount)
    },

    scrollListDown: function(stationaryElement, amount) {
      stationaryElement.scrollTop(stationaryElement.scrollTop() + amount)
    }
  },
  
  browserSubmit: function (action, method, input) {
    var form = $('<form />', {
        action: action,
        method: method,
        style: 'display: none;'
    });
    if (typeof input !== 'undefined') {
        $.each(input, function (name, value) {
            $('<input />', {
                type: 'hidden',
                name: name,
                value: value
            }).appendTo(form);
        });
    }
    form.appendTo('body').submit();
  }
}
