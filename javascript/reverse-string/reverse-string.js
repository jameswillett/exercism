const last = s => s.slice(-1);
const init = s => s.substring(0, s.length - 1);

const reverseString = (string) => {
  const s = String(string); // always try to cast as string
  if (!last(s)) return '';
  return last(s) + reverseString(init(s));
};

module.exports = { reverseString };
