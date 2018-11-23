const R = require('ramda');

const blankTriangle = rows => Array(rows)
  .fill(0).map((x, i) => Array(i + 1).fill(1));

export default class Triangle {
  constructor(rows) {
    this.rows = blankTriangle(rows)
      .reduce((a, c, i) => {
        if (i === 0) return [[1]];
        return a.concat([
          c.map((_, j) => (R.last(a)[j - 1] || 0) + (R.last(a)[j] || 0)),
        ]);
      }, []);

    this.lastRow = R.last(this.rows);
  }
}
