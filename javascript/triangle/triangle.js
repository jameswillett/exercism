const R = require('ramda');

const sortDecending = R.sort(R.flip(R.subtract));

export default class Triangle {
  constructor(...sides) {
    this.sides = sortDecending(sides);
  }

  kind() {
    const [max, ...legs] = this.sides;
    const min = R.last(legs);
    const types = ['equilateral', 'isosceles', 'scalene'];

    if (min <= 0) {
      throw Error('zero and negative values not allowed');
    }

    if (R.sum(legs) < max) {
      throw Error('those values cant make a triangle');
    }

    const getType = R.pipe(
      R.groupWith(R.equals),
      R.length,
      R.dec,
      R.flip(R.prop)(types),
    );

    return getType(this.sides);
  }
}
