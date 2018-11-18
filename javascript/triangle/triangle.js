const R = require('ramda');

export default class Triangle {
  constructor(...sides) {
    this.sides = sides;
  }

  kind() {
    const types = ['equilateral', 'isosceles', 'scalene'];
    const byDecending = R.flip(R.subtract);

    // if any legs less than or equal to 0 throw error
    if (R.any(R.flip(R.lte)(0), this.sides)) {
      throw Error('zero and negative values not allowed');
    }

    // sort sides in decending order then destructure head and tail
    // [4, 5, 5] -> [5, 5, 4] -> max == 5, legs = [5,4]
    const [max, ...legs] = R.sort(byDecending, this.sides);

    // pretty self explanitory
    if (R.sum(legs) < max) {
      throw Error('those values cant make a triangle');
    }

    const getType = R.pipe(

      // sort sides [3,5,3] -> [5,3,3]
      R.sort(byDecending),

      // group adjacent equal values ... -> [[5], [3,3]]
      R.groupWith(R.equals),

      // get the length ... -> 2
      R.length,

      // decrement ... -> 1
      R.dec,

      // grab triangle type at that index ... -> "isosceles"
      R.flip(R.prop)(types),
    );

    return getType(this.sides);
  }
}
