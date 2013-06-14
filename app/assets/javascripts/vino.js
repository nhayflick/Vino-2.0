window.VI = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  Store: {},


  initialize: function(queries, $navbar, $main, $content) {
    var that = this;
    VI.Store.Queries = new VI.Collections.Queries(queries);
    VI.Store.CurrentlyPlaying = new VI.Collections.Vines();
    new VI.Routers.QueriesRouter($content);
    that.installNav($navbar);
    that.installMainView($main);
    Backbone.history.start();
  },


  installNav: function(navbar) {
    var that = this;
    var indexQueriesView = new VI.Views.IndexQueriesView({
      collection: VI.Store.CurrentlyPlaying
    })
    $(navbar).html(indexQueriesView.render().$el)
  }, 

  installMainView: function(main) {
    var that = this;
    var mainView = new VI.Views.MainView({
      collection: VI.Store.Queries
    })
    $(main).html(mainView.render().$el)
  }


};