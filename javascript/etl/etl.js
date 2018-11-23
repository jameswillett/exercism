const R = require('ramda');

const transform = old => Object.keys(old)
  .reduce((a, c) => R.merge(
    a,
    R.mergeAll(
      old[c].map(x => ({ [x.toLowerCase()]: Number(c) })),
    ),
  ), {});

export default transform;
