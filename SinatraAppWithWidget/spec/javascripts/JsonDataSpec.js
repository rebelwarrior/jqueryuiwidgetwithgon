// Generated by CoffeeScript 1.4.0
(function() {

  describe("JSON DATA", function() {
    return it("should get correct data", function(answer) {
      if (answer == null) {
        answer = null;
      }
      answer = function() {
        return $.ajax({
          dataType: 'jsonp',
          url: 'http://participant-media-take2-4567.herokuapp.com/articles.json'
        });
      };
      return runs(function() {
        return expect(answer[0].name).toBe('First artilcle');
      });
    });
  });

}).call(this);
