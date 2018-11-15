const translations = {
  G: 'C',
  C: 'G',
  T: 'A',
  A: 'U',
};

const toRna = (sequence) => {
  const h = sequence[0];
  const t = sequence.slice(1);
  if (!h) return '';
  if (!translations[h]) throw new Error('Invalid input DNA.');
  return translations[h] + toRna(t);
};

module.exports = { toRna };
