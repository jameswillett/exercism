const R = require('ramda');

const isNumber = R.flip(R.includes)(R.map(R.toString, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]));

const flattenToCounts = (a, c) => {
  if (c.length === 1) return a + R.head(c);
  return a + c.length + R.head(c);
};

const expandFromCounts = (a, c) => {
  if (c.length === 1) return a + c;
  return a + R.join('', R.repeat(R.last(c), R.init(c)));
};

const encode = R.pipe(
  R.groupWith(R.equals),
  R.reduce(flattenToCounts, ''),
);

const decode = R.pipe(
  R.groupWith(isNumber),
  R.reduce(expandFromCounts, ''),
);

module.exports = { encode, decode };
