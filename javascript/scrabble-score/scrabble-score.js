/* eslint implicit-arrow-linebreak: 0 */
/* eslint no-console: 0 */
/* eslint no-restricted-globals: 0 */

const R = require('ramda');

const score = (word, letterMods = {}, wordMods = [], isBingo = false) => {
  // takes a string and a value, and returns an object where each character is a key
  // and all keys have the same value
  const s = (letters, value) =>
    R.compose(
      R.fromPairs,
      R.map(
        l => R.pair(l, value),
      ),
    )(letters);

  const scores = R.mergeAll([
    s('aeioulnrst', 1),
    s('dg', 2),
    s('bcmp', 3),
    s('fhvwy', 4),
    s('k', 5),
    s('jx', 8),
    s('qz', 10),
    s('_', 0),
  ]);

  const wordBaseWithMult = [...word.toLowerCase()].reduce((a, l, i) => {
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
    const multiplier = (l === '_' && letterMod) || 1;

    return {
      scores: a.scores + (letterBase * letterMod),
      multiplier: a.multiplier * multiplier,
    };
  }, { scores: 0, multiplier: wordMods.reduce((a, c) => a * c, 1) });

  // we can pass in a flag to let the fn know the player played all 7 of their tiles in one turn
  // you get a 50 point bonus when this happens
  return wordBaseWithMult.scores * wordBaseWithMult.multiplier + (isBingo && 50);
};

module.exports = { score };
