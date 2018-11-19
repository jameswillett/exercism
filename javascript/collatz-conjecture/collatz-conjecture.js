const steps = (n) => {
  if (n <= 0) throw new Error('Only positive numbers are allowed');
  /* imperative way
  let m = n;
  let i = 0;
  while (m > 1) {
    if (m % 2 === 0) {
      m /= 2;
    } else {
      m = 3 * m + 1;
    }
    i += 1;
  }
  return i; */
  const _steps = (m, i = 0) => { // eslint-disable-line
    if (m === 1) return i;
    if (m % 2 === 0) return _steps(m / 2, i + 1);
    return _steps(3 * m + 1, i + 1);
  };
  return _steps(n);
};


module.exports = { steps };
