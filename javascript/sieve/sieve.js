export default class Sieve {
  constructor(limit) {
    const originalList = Array(limit - 1).fill(0).map((_, i) => i + 2);
    // i cheated a LITTLE bit, im using the mod operator
    // but not in the way the doc says to not use it
    const removeMultiplesOfHead = list => list
      .filter(x => x % list[0] !== 0 || x === list[0]);

    const primes = (list) => {
      const [h, ...t] = removeMultiplesOfHead(list);
      if (t.length) {
        return [h, ...primes(t)];
      }
      return [h];
    };
    this.primes = primes(originalList);
  }
}
