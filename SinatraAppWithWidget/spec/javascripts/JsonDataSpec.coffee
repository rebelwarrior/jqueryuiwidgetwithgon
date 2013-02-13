# to use Jquery put it in the helpers file, add it to jasmine.yml file and 
# add jasmine-jquery.js as well


describe "ajax", ->
  $('#open').trigger("ajax:success", ["First Article"])



      
describe "JSON DATA", ->
  beforeEach ->
    loadFixtures('index.html')
  it "should get correct data", (answer=null)->
    answer = ->
      $.ajax(
        dataType: 'jsonp'
        url: 'http://localhost:3000/articles.json'
        success: (data, status, xhr)->
          data
        )
    waitsFor -> 
      answer    
    runs ->
      expect(answer[0].name).toBe('First artilcle') #woops I misspelled it!
  