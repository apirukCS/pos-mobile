enum INDEX_NAVBAR {
  MENU,
  SALE,
  CART,
  ORDERD,
  TABLE,
}

int getIdx(INDEX_NAVBAR idx) {
  switch (idx) {
    case INDEX_NAVBAR.MENU:
      return 0;
    case INDEX_NAVBAR.SALE:
      return 1;
    case INDEX_NAVBAR.CART:
      return 2;
    case INDEX_NAVBAR.ORDERD:
      return 3;
    case INDEX_NAVBAR.TABLE:
      return 4;
    default:
      throw Exception('Invalid enum value');
  }
}
