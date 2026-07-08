class PolygonModel {
  int sides;
  int divisions;

  PolygonModel({this.sides = 3, this.divisions = 1});

  void setSides(int value) {
    if (value < 3) value = 3;
    if (value > 100) value = 100;
    sides = value;
  }

  void setDivisions(int value) {
    if (value < 1) value = 1;
    if (value > 50) value = 50;
    divisions = value;
  }
}
