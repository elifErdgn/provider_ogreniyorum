extension ColorStringExtension on String? {
  int get colorValue {
    var _newColor = this?.replaceFirst('#', '0xff') ?? '';
    //  _newColor = "0xff"+ _newColor;
    return int.parse(_newColor);
  }
}
