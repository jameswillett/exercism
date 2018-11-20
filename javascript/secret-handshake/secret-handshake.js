/* eslint no-restricted-globals: 0 */

const R = require('ramda');

const call = (method, args) => obj => obj[method](...args);

const secretHandshake = R.ifElse(
  isNaN,
  () => { throw new Error('Handshake must be a number'); },
  R.converge(
    (f, l) => R.unless(R.always(f), R.reverse, l),
    [
      R.flip(R.lt)(16),
      R.compose(
        R.map(R.head),
        R.filter(R.last),
        R.zip(['wink', 'double blink', 'close your eyes', 'jump']),
        R.map(Number),
        R.reverse,
        call('toString', [2]),
      ),
    ],
  ),
);

module.exports = { secretHandshake };
