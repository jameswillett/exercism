const compute = (left, right) => {
  if (left.length !== right.length) throw new Error('left and right strands must be of equal length');
  let count = 0;
  for (var n in left) {
    if (left[n] !== right[n]) count += 1;
  }
  return count;
}

module.exports = { compute };
