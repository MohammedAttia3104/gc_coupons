String getMessageForSemicolon(String str) {
  if (str.contains(';')) {
    int semicolonIndex = str.indexOf(';');
    String beforeSemicolon = str.substring(0, semicolonIndex);
    String afterSemicolon = str.substring(semicolonIndex + 1).trimLeft(); // Trim leading whitespace
    return '$beforeSemicolon\n$afterSemicolon';
  } else {
    return str; // No semicolon, return original string
  }
}