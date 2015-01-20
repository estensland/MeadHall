window.heorot = (function(){
  var Heorot = function (input) {
    if (input instanceof Array){
      this.heorotKind = 'array';
      for(var i = 0; i < input.length; i++ ) {
        this[i] = input[i];
      }
      this.length = input.length;
    }

    else{
      this.heorotKind = 'object';
      for (var key in input) {
        if (input.hasOwnProperty(key)) {
          this[key] = input[key];
        }
      }
    }
  }

  var heorot = {
    t: function(input){
      return new Heorot(input);
    },

    each: function(input, func){
      if (input.heorotKind ==='array'){
        for (var i=0, ii = input.length; i < ii; i ++) {
          func(input[i]);
        }
      }
      else if (input.heorotKind==='object'){
        for (var key in input) {
          if (input.hasOwnProperty(key) && key !== 'heorotKind') {
            func(key, input[key]);
          }
        }
      }
    },

    stringEach: function(input, i, deal) {
      var func = new Function(i, deal);
      return heorot.each(input, func);
    },

    map: function(input, func){
      returnArray = [];

      if (input.heorotKind ==='array'){
        for (var i=0, ii = input.length; i < ii; i ++) {
          returnArray.push(func(input[i]));
        }
      }
      else if (input.heorotKind==='object'){
        for (var key in input) {
          if (input.hasOwnProperty(key) && key !== 'heorotKind') {
            returnArray.push(func(key, input[key]));
          }
        }
      }
      return returnArray;

    },

    stringMap: function(input, i, deal) {
      var func = new Function(i, deal);
      return heorot.map(input, func);
    },

    select: function(input, func){
      returnArray = [];
      for (var i=0, ii = input.length; i < ii; i ++) {
        if (func(input[i])){
          returnArray.push(input[i]);
        }
      }
      return returnArray
    },
    
    stringSelect: function(input, i, deal) {
      var func = new Function(i, deal);
      return heorot.select(input, func);
    },

    reject: function(input, func){
      returnArray = [];
      for (var i=0, ii = input.length; i < ii; i ++) {
        if (!func(input[i])){
          returnArray.push(input[i]);
        }
      }
      return returnArray;
    },
    
    stringReject: function(input, i, deal) {
      var func = new Function(i, deal);
      return heorot.reject(input, func);
    },
    
    sortBySortAttr: function (parent, sortedSelector, keySelector) {
      var sections = $(parent).find(sortedSelector).sort(function(a, b) {
        var vA = Paths.grabTextParseInt($(keySelector, a));
        var vB = Paths.grabTextParseInt($(keySelector, b));
        return (vA < vB) ? -1 : (vA > vB) ? 1 : 0;
      });
      $(parent).append(sections);
    },
    
    browserSubmit: function (action, method, input) {
      var form = $('<form />', {
        action: action,
        method: method,
        style: 'display: none;'
      });
      if (typeof input !== 'undefined') {
        if (typeof input === 'string'){
          $('<input />', {
            type: 'hidden',
            name: 'submittedParams',
            value: input
          }).appendTo(form);
        }
        else{
          $.each(input, function (name, value) {
            $('<input />', {
              type: 'hidden',
              name: name,
              value: value
            }).appendTo(form);
          });
        }
      }
      form.appendTo('body').submit();
    }
  }

  Heorot.prototype.each = function (callback) {
    return heorot.each(this, callback);
  };
  
  Heorot.prototype.iEach = function (callback) {
    return heorot.stringEach(this, 'i', callback);
  };

  Heorot.prototype.xEach = function (callback) {
    return heorot.stringEach(this, 'x', callback);
  };

  Heorot.prototype.yEach = function (callback) {
    return heorot.stringEach(this, 'y', callback);
  };
  
  Heorot.prototype.map = function (callback) {
    return heorot.map(this, callback);
  };

  Heorot.prototype.iMap = function (callback) {
    return heorot.stringMap(this, 'i', callback);
  };

  Heorot.prototype.xMap = function (callback) {
    return heorot.stringMap(this, 'x', callback);
  };

  Heorot.prototype.yMap = function (callback) {
    return heorot.stringMap(this, 'y', callback);
  };

  Heorot.prototype.select = function (callback) {
    return heorot.select(this, callback);
  };
  
  Heorot.prototype.iSelect = function (callback) {
    return heorot.stringSelect(this, 'i', callback);
  };

  Heorot.prototype.xSelect = function (callback) {
    return heorot.stringSelect(this, 'x', callback);
  };

  Heorot.prototype.ySelect = function (callback) {
    return heorot.stringSelect(this, 'y', callback);
  };

  Heorot.prototype.reject = function (callback) {
    return heorot.reject(this, callback);
  };
  
  Heorot.prototype.iReject = function (callback) {
    return heorot.stringReject(this, 'i', callback);
  };

  Heorot.prototype.xReject = function (callback) {
    return heorot.stringReject(this, 'x', callback);
  };

  Heorot.prototype.ySelect = function (callback) {
    return heorot.stringReject(this, 'y', callback);
  };

  return heorot;
}());

H = heorot;
