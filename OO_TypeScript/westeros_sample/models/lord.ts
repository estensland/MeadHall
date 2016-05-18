///<reference path='house.ts'/>
///<reference path='character.ts'/>

class Lord extends Character {
  house: House;

  setHouse(house){
    this.house = house;
  }
}

