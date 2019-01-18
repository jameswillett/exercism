const compute = (left, right) => {
  if (left.length !== right.length) throw new Error('left and right strands must be of equal length');
  return [...left].reduce((c, l, i) => c + (l !== right[i]), 0);
};

module.exports = { compute };
