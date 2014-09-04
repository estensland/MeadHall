Heorot = {
  sortBySortAttr: function (parent, sortedSelector, keySelector) {
    var sections = $(parent).find(sortedSelector).sort(function(a, b) {
      var vA = Paths.grabTextParseInt($(keySelector, a));
      var vB = Paths.grabTextParseInt($(keySelector, b));
      return (vA < vB) ? -1 : (vA > vB) ? 1 : 0;
    });
    $(parent).append(sections);
  }
}
