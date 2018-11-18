const validate = n => [...n.toString(10)]
  .reduce((a, c, i, r) => a + (c ** r.length), 0) === n;

module.exports = { validate };
