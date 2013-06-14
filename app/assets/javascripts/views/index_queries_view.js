VI.Views.IndexQueriesView = Backbone.View.extend({

  events: {
    "click button.search": "initiateSearch"
  },

  initialize: function() {
    var that = this;
    // that.$("nav-search").searchRender();
    that.collection.on("all", function() {
      // When the CurrentlyPlaying collection is changed, the navbar refreshes itself to display new metadata
      that.render();
    });
  },

  //Navigates to a hashtag url encompassing the user's current querystring

  initiateSearch: function() {
    var that = this;
    var queryString = encodeURIComponent($(".search-query").val())
    Backbone.history.navigate("search?" + queryString, {trigger: true});
  },

  render: function(){
    var that = this;
    var renderedContent = JST["queries/index"]({
      queries: that.collection
    })
    console.log(that.$el);
    that.$el.html(renderedContent);
    return that
  },

  searchRender: function() {
    var that = this;
    var renderedContent = JST["queries/searchbar"]()
    that.$el.find(".nav-search").first().html(renderedContent);
    return that;
  }
});