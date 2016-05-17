var House = (function () {
    function House(name, sigil, motto) {
        this.name = name;
        this.sigil = sigil;
        this.motto = motto;
        this.members = [];
    }
    House.prototype.describe = function () {
        return "The sigil of House " + this.name + " is " + this.sigil + ", and its words are " + this.motto;
    };
    House.prototype.addMember = function (member) {
        this.members.push(member);
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
///<reference path='models/house.ts'/>
///<reference path='models/character.ts'/>
var starks = new House('Stark', 'a direwolf', "'Winter is Coming'");
console.log(starks.describe());
var ned = new Character('Eddard', 'Male');
starks.addMember(ned);
console.log(ned);
