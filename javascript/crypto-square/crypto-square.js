const R = require('ramda');

export default class Crypto {
  constructor(text) {
    this.text = text;
  }

  normalizePlaintext() {
    return this.text.replace(/[^a-zA-Z0-9]/g, '').toLowerCase();
  }

  size() {
    return Math.ceil(Math.sqrt(this.normalizePlaintext().length));
  }

  plaintextSegments() {
    return R.splitEvery(this.size(), this.normalizePlaintext());
  }

  ciphertext() {
    return R.join('', R.flatten(R.transpose(this.plaintextSegments())));
  }
}
