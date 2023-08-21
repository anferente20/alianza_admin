class TextValidators {
  validatePhone(String? value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  validateEmail(String? value) {
    final exp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    if (!exp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  validateName(String? value) {
    final exp = RegExp(r'^[a-z A-Z]+$');
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    if (!exp.hasMatch(value)) {
      return 'Please enter a valid name';
    }
    return null;
  }
}
