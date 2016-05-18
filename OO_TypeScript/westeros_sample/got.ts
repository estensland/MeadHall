///<reference path='models/house.ts'/>
///<reference path='models/lord.ts'/>
///<reference path='models/smallfolk.ts'/>
///<reference path='models/territory.ts'/>

let stark = new House('Stark', 'a direwolf', "'Winter is Coming'");

let theNorth = new Territory('The North', 'Winterfell');

console.log(stark.describe());

let ned = new Lord('Eddard', 'Male', stark, theNorth);

let hotPie = new Smallfolk('Hot Pie', 'Male', 'Baker');



console.log(ned);
console.log(hotPie);
