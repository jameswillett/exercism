const translate = (nucleotide) => {
  switch (nucleotide) {
    case 'G': return 'C';
    case 'C': return 'G';
    case 'T': return 'A';
    case 'A': return 'U';
    default: throw new Error('Invalid input DNA.');
  }
};

const toRna = sequence => sequence
  .split('')
  .reduce((a, c) => a + translate(c), '');

module.exports = { toRna };
