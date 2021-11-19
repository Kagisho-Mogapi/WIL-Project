String myRegexe(String type) {
  String _expression = '';

  if (type == 'Phone Number') {
    _expression = r'^(\+27|0)[6-8][0-9]{8}$';
  } else if (type == 'Name') {
    _expression = r'^[a-z A-Z]+$';
  } else if (type == 'Email') {
    _expression = r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$';
  } else if (type == 'Password') {
    _expression =
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$';
  }

  return _expression;
}
