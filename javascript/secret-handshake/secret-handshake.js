const R = require('ramda');

const actions = ['wink', 'double blink', 'close your eyes', 'jump'];

const secretHandshake = (n) => {
  if (isNaN(n)) throw new Error('Handshake must be a number'); // eslint-disable-line

  return R.compose(
    R.unless(_ => n < 16, R.reverse), // eslint-disable-line
    R.map(R.head),
    R.filter(R.last),
    R.zip(actions),
    R.map(Number),
    R.reverse,
  )(n.toString(2));

  // return n >= 16 ? moves.reverse() : moves;
};

module.exports = { secretHandshake };
