bool validateUsername(String username) {
  if (username == null) {
    return false;
  } else if (username.length > 15) {
    return false;
  } else if (username.length < 3) {
    return false;
  } else if (username.contains('%')) {
    return false;
  } else {
    return true;
  }
}
