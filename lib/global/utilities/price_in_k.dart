String priceInK(int price) {
  if (price >= 1000) {
    return '${(price / 1000).toStringAsFixed(price % 1000 == 0 ? 0 : 1)}K';
  }
  return price.toString();
}
