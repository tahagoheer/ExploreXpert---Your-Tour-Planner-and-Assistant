String capitalizeFirstLetter(String text) {
  if (text.isEmpty) {
    return text;
  }

  List<String> words = text.split(' ');
  List<String> capitalizedWords = words.map((word) {
    if (word.isEmpty) {
      return word;
    }
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }).toList();

  return capitalizedWords.join(' ');
}
