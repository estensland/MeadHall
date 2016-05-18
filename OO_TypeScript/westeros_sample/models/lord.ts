///<reference path='house.ts'/>
///<reference path='character.ts'/>

class Lord extends Character {
  house: House;
  territory: Territory;

  constructor(name: string, gender: string, house: House, territory: Territory) {
    super(name, gender);

    this.house = house;
    this.territory = territory;
  }

}

