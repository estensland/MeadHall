var __extends = (this && this.__extends) || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
};
var DomManipulator = (function () {
    function DomManipulator(id) {
        this.element = document.getElementById(id);
    }
    return DomManipulator;
})();
var ButtonAdder = (function (_super) {
    __extends(ButtonAdder, _super);
    function ButtonAdder(id, buttonText) {
        _super.call(this, id);
        this.buttonText = buttonText;
    }
    ButtonAdder.prototype.addIt = function () {
        var newButton = document.createElement('button');
        newButton.innerHTML = this.buttonText;
        this.element.appendChild(newButton);
    };
    return ButtonAdder;
})(DomManipulator);
var adder = new ButtonAdder('test-div', 'CLICK IT');
