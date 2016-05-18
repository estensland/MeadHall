///<reference path='house.ts'/>
///<reference path='character.ts'/>

class Smallfolk extends Character {
  occupation: string;


  constructor(name: string, gender: string, occupation: string) {
    super(name, gender);

    this.occupation = occupation;
  }

}

