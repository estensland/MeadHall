///<reference path='models/house.ts'/>
///<reference path='models/lord.ts'/>
///<reference path='models/smallfolk.ts'/>

let stark = new House('Stark', 'a direwolf', "'Winter is Coming'");

console.log(stark.describe());

let ned = new Lord('Eddard', 'Male', stark);

let hotPie = new Smallfolk('Hot Pie', 'Male', 'Baker');



console.log(ned);
console.log(hotPie);
