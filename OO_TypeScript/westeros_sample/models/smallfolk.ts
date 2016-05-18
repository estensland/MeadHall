///<reference path='house.ts'/>
///<reference path='character.ts'/>

class Smallfolk extends Character {
  occupation: string;


  setOccupation(occupation) {
    this.occupation = occupation;
  }
}

