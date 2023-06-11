enum AppRoute {
  account(path: '/account', name: 'account'),
  search(path: '/search', name: 'search'),
  detail(path: '/detail', name: 'detail'),
  basket(path: '/basket', name: 'basket'),
  root(path: '/', name: 'root'),
  main(path: '/main', name: 'main');

  final String path;
  final String name;
  const AppRoute({required this.path, required this.name});
}
