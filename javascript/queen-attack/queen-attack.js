export default class Queens {
  constructor(positioning = { white: [0, 3], black: [7, 3] }) {
    if (positioning.white[0] === positioning.black[0]
        && positioning.white[1] === positioning.black[1]) {
      throw new Error('Queens cannot share the same space');
    }

    this.white = positioning.white;
    this.black = positioning.black;
  }

  toString() {
    const renderSpace = (x, y) => {
      let space = '_';
      if (this.white[0] === x && this.white[1] === y) space = 'W';
      if (this.black[0] === x && this.black[1] === y) space = 'B';
      if (x === 7 && y === 7) space += '\n';
      return space;
    };

    return new Array(8).fill('')
      .map((_, x) => new Array(8).fill('')
        .map((__, y) => renderSpace(x, y)).join(' ')).join('\n');
  }

  canAttack() {
    const { abs } = Math;
    const [whiteX, whiteY] = this.white;
    const [blackX, blackY] = this.black;
    return whiteX === blackX
        || whiteY === blackY
        || abs(whiteX - blackX) === abs(whiteY - blackY);
  }
}
