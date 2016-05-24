///<reference path='weapon.ts'/>
///<reference path='../mixins/books_in.ts'/>

class Character implements BooksIn {
  name: string;
  gender: string;
  weapons: Array<any>;

  constructor(name: string, gender: string) {
    this.name = name;
    this.gender = gender;
    this.weapons = [];
    this.books = []
  }

  addWeapon(weapon: Weapon){
    this.weapons.push(weapon)
  }

  books: Array<Book>;
  addBooks: (newBooks: Array<Book>) => void;
}

applyMixins(Character, [BooksIn])
