var Character = (function () {
    function Character(name, gender) {
        this.name = name;
        this.gender = gender;
    }
    return Character;
}());
var ned = new Character('Eddard', 'Male');
