const divisibleBy = x => mod => x % mod === 0;

const isLeap = (year) => {
  const yearDivisibleBy = divisibleBy(year);
  return yearDivisibleBy(4) && (!yearDivisibleBy(100) || yearDivisibleBy(400));
};

module.exports = { isLeap };
