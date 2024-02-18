class AppRouter {
  static final homePage = Page(name: "homePage", path: "/");
  static final addNotePage = Page(name: "addNotePage", path: "addNotePage");
  static final notePage = Page(name: "notePage", path: "notePage");
  static final searchPage = Page(name: "searchPage", path: "searchPage");
}

class Page {
  Page({required this.name, required this.path});
  final String name;
  final String path;
}
