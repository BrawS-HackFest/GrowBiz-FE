class Categories {
  String name;
  String icon;

  Categories({required this.name, required this.icon});

  static final List<Categories> getAllCategories=[
    Categories(name: 'Fashion', icon: 'fashion_icon.svg'),
    Categories(name: 'Kuliner', icon: 'kuliner_icon.svg'),
    Categories(name: 'Agribisnis', icon: 'agribisnis_icon.svg'),
    Categories(name: 'Kosmetik', icon: 'kosmetik_icon.svg'),
    Categories(name: 'Dagangan', icon: 'dagangan_icon.svg'),
  ];
}