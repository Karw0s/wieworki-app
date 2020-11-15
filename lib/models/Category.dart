enum Category {
  GROMADA, SZCZEP, HUFIEC, ZHP
}

getCategoryFromString(String c) {
  for(Category category in Category.values) {
    if (category.toString().split('.')[1].toUpperCase() == c) {
      return category;
    }
  }
  return null;
}