class QRCodeController {
  //Returns only videoID
  String handleURL(String value) {
    return value.split('=')[1];
  }
}
