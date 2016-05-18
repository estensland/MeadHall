///<reference path='models/house.ts'/>
///<reference path='models/character.ts'/>
///<reference path='models/lord.ts'/>

let stark = new House('Stark', 'a direwolf', "'Winter is Coming'");

console.log(starks.describe());

let ned = new Lord('Eddard', 'Male');

ned.setHouse(stark)


console.log(ned);
