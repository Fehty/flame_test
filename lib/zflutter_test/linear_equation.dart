class LinearPoints {
  final double x1;
  final double y1;
  final double x2;
  final double y2;

  const LinearPoints(this.x1, this.y1, this.x2, this.y2);
}

double linearEquationGetY(LinearPoints points, double x) {
  final double x1 = points.x1;
  final double y1 = points.y1;
  final double x2 = points.x2;
  final double y2 = points.y2;

  final double numerator = -(x1 * y2 - x2 * y1) - (y1 - y2) * x;
  final double denominator = (x2 - x1);
  final y = numerator / denominator;

  return y;
}