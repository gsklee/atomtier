'use babel';

module.exports = class JsonAsTomlView {
  constructor() {
    this.element = document.createElement('div');
    this.element.classList.add('json-as-toml');

    const message = document.createElement('div');
    message.textContent = "1234! The JsonAsToml package is Alive! It's ALIVE!";
    message.classList.add('message');
    this.element.appendChild(message);
  }

  destroy() {
    this.element.remove();
  }

  getElement() {
    return this.element;
  }
}
