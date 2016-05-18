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
var Material;
(function (Material) {
    Material[Material["Bronze"] = 0] = "Bronze";
    Material[Material["Iron"] = 1] = "Iron";
    Material[Material["Steel"] = 2] = "Steel";
    Material[Material["Obsidian"] = 3] = "Obsidian";
    Material[Material["Valyrian_Steel"] = 4] = "Valyrian_Steel";
})(Material || (Material = {}));
///<reference path='material.ts'/>
var Weapon = (function () {
    function Weapon(name, material) {
        this.name = name;
        this.material = material;
    }
    return Weapon;
})();
///<reference path='weapon.ts'/>
var Character = (function () {
    function Character(name, gender) {
        this.name = name;
        this.gender = gender;
        this.weapons = [];
    }
    Character.prototype.addWeapon = function (weapon) {
        this.weapons.push(weapon);
    };
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
    function Lord(name, gender, house, territory) {
        _super.call(this, name, gender);
        this.house = house;
        this.territory = territory;
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
var Territory = (function () {
    function Territory(name, seat) {
        this.name = name;
        this.seat = seat;
    }
    return Territory;
})();
///<reference path='weapon.ts'/>
var Sword = (function (_super) {
    __extends(Sword, _super);
    function Sword(name, material) {
        _super.call(this, name, material);
    }
    return Sword;
})(Weapon);
///<reference path='models/house.ts'/>
///<reference path='models/lord.ts'/>
///<reference path='models/smallfolk.ts'/>
///<reference path='models/territory.ts'/>
///<reference path='models/weapon.ts'/>
///<reference path='models/sword.ts'/>
///<reference path='models/material.ts'/>
var stark = new House('Stark', 'a direwolf', "'Winter is Coming'");
var theNorth = new Territory('The North', 'Winterfell');
var ice = new Sword('Ice', Material[Material.Valyrian_Steel]);
console.log(stark.describe());
var ned = new Lord('Eddard', 'Male', stark, theNorth);
ned.addWeapon(ice);
var hotPie = new Smallfolk('Hot Pie', 'Male', 'Baker');
console.log(ned);
console.log(hotPie);
var icey = new Sword('Ice', 'Valyrian_Steel');
