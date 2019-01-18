const compute = (left, right) => {
  if (left.length !== right.length) throw new Error('left and right strands must be of equal length');
  return [...left].reduce((count, l, i) => {
    if (l !== right[i]) return count + 1;
    return count;
  }, 0);
};

module.exports = { compute };
