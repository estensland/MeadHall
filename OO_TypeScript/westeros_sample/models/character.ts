///<reference path='weapon.ts'/>

class Character {
  name: string;
  gender: string;
  weapons: Array<any>;

  constructor(name: string, gender: string) {
    this.name = name;
    this.gender = gender;
    this.weapons = [];
  }

  addWeapon(weapon: Weapon){
    this.weapons.push(weapon)
  }
}
