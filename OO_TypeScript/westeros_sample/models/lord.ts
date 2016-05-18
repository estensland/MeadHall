///<reference path='house.ts'/>
///<reference path='character.ts'/>

class Lord extends Character {
  house: House;

  constructor(name: string, gender: string, house: House) {
    super(name, gender)

    this.house = house;
  }

}

