const validate = n => n.toString(10)
  .split('')
  .map((v, i, { length: power }) => Number(v) ** power)
  .reduce((a, c) => a + c) === n;

module.exports = { validate };
