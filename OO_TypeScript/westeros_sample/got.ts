///<reference path='models/house.ts'/>
///<reference path='models/character.ts'/>

let starks = new House('Stark', 'a direwolf', "'Winter is Coming'");

console.log(starks.describe());

let ned = new Character('Eddard', 'Male');

starks.addMember(ned);

console.log(ned);
