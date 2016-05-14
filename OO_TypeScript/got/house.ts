class House {
  name: string;
  sigil: string;
  motto: string;
  members: Array<any>;

  constructor(name: string, sigil: string, motto: string) {
    this.name = name;
    this.sigil = sigil;
    this.motto = motto;
    this.members = [];
  }

  describe() {
    return "The sigil of House " + this.name + " is " + this.sigil + ", and its words are " + this.motto;
  }

  addMember(member){
    this.members.push(member);
  }
}

let starks = new House('Stark', 'a direwolf', "'Winter is Coming'")

console.log(starks.describe());

starks.addMember('Ned')