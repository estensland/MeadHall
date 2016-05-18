var House = (function () {
    function House(name, sigil, motto) {
        this.name = name;
        this.sigil = sigil;
        this.motto = motto;
    }
    House.prototype.describe = function () {
        return "The sigil of House " + this.name + " is " + this.sigil + ", and its words are " + this.motto;
    };
    return House;
})();
var Character = (function () {
    function Character(name, gender) {
        this.name = name;
        this.gender = gender;
    }
    return Character;
})();
///<reference path='house.ts'/>
///<reference path='character.ts'/>
var __extends = (this && this.__extends) || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
};
var Lord = (function (_super) {
    __extends(Lord, _super);
    function Lord() {
        _super.apply(this, arguments);
    }
    Lord.prototype.setHouse = function (house) {
        house = house;
    };
    return Lord;
})(Character);
///<reference path='models/house.ts'/>
///<reference path='models/character.ts'/>
///<reference path='models/lord.ts'/>
var starks = new House('Stark', 'a direwolf', "'Winter is Coming'");
console.log(starks.describe());
var ned = new Lord('Eddard', 'Male');
console.log(ned);
