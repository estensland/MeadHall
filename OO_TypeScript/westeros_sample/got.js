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
    function Lord(name, gender, house) {
        _super.call(this, name, gender);
        this.house = house;
    }
    return Lord;
})(Character);
///<reference path='house.ts'/>
///<reference path='character.ts'/>
var Smallfolk = (function (_super) {
    __extends(Smallfolk, _super);
    function Smallfolk(name, gender, occupation) {
        _super.call(this, name, gender);
        this.occupation = occupation;
    }
    return Smallfolk;
})(Character);
///<reference path='models/house.ts'/>
///<reference path='models/lord.ts'/>
///<reference path='models/smallfolk.ts'/>
var stark = new House('Stark', 'a direwolf', "'Winter is Coming'");
console.log(stark.describe());
var ned = new Lord('Eddard', 'Male', stark);
var hotPie = new Smallfolk('Hot Pie', 'Male', 'Baker');
console.log(ned);
console.log(hotPie);
