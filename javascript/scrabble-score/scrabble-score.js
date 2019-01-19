/* eslint implicit-arrow-linebreak: 0 */
/* eslint no-console: 0 */
/* eslint no-restricted-globals: 0 */

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
    // the base score for the letter
    const letterBase = scores[l];

    // characters not in the hash table are not valid tiles, so we cant score the word
    if (isNaN(letterBase)) {
      throw new Error(`${l} is not a valid scrabble tile`);
    }

    // letter mods is an object where the key is the index at which the multiplier is applied
    // and the value is the value to multiply by. eg { 0: 2, 2: 3 } would double the first letter
    // and triple the third letter
    const letterMod = letterMods[i] || 1;

    // something i didnt know about scrabble before this project: if a blank piece lands on a letter
    // multiplier, that multiplier is applied to the whole word
    const blankBonus = (l === '_' && letterMod) || 1;

    return {
      scores: a.scores + (letterBase * letterMod),
      blankBonus: a.blankBonus * blankBonus,
    };
  }, { scores: 0, blankBonus: 1 });

  const multiplier = wordMods.reduce((a, c) => a * c, 1);

  // we can pass in a flag to let the fn know the player played all 7of their tiles in one turn
  // you get a 50 point bonus when this happens
  return wordBaseWithBonus.scores * wordBaseWithBonus.blankBonus * multiplier + (isBingo && 50);
};

module.exports = { score };
