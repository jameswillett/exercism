const R = require('ramda');

const actions = ['wink', 'double blink', 'close your eyes', 'jump'];

const secretHandshake = (n) => {
  if (isNaN(n)) throw new Error('Handshake must be a number'); // eslint-disable-line
  
  const moves = R.compose(
    R.map(([_, x]) => x), // eslint-disable-line
    R.filter(([x]) => x),
    R.zip(R.map(Number, R.reverse(n.toString(2)))),
  )(actions);

  return n >= 16 ? moves.reverse() : moves;
};

module.exports = { secretHandshake };
