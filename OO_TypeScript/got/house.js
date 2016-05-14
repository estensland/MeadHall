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
}());
var starks = new House('Stark', 'a direwolf', "'Winter is Coming'");
console.log(starks.describe());
starks.addMember('Ned');
