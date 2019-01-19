/* eslint implicit-arrow-linebreak: 0 */
/* eslint no-console: 0 */

const score = (word, letterMods = {}, wordMods = [], isBingo = false) => {
  const s = (letters, value) =>
    [...letters].reduce((a, c) => ({
      ...a,
      [c]: value,
    }), {});

  const scores = {
    ...s('aeioulnrst', 1),
    ...s('dg', 2),
    ...s('bcmp', 3),
    ...s('fhvwy', 4),
    ...s('k', 5),
    ...s('jx', 8),
    ...s('qz', 10),
    ...s('_', 0),
  };

  const wordBaseWithBonus = [...word.toLowerCase()].reduce((a, l, i) => {
    const letterBase = scores[l];
    const letterMod = letterMods[i] || 1;
    const blankBonus = (l === '_' && letterMod) || 1;
    return {
      scores: a.scores + (letterBase * letterMod),
      blankBonus: a.blankBonus * blankBonus,
    };
  }, { scores: 0, blankBonus: 1 });

  const multiplier = wordMods.reduce((a, c) => a * c, 1);
  return wordBaseWithBonus.scores * wordBaseWithBonus.blankBonus * multiplier + (isBingo && 50);
};

module.exports = { score };
