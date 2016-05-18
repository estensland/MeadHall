class DomManipulator {
  element: HTMLElement;

  constructor(id: string) {
    this.element = document.getElementById(id);
  }
}

class ButtonAdder extends DomManipulator {
  buttonText: string;

  constructor(id: string, buttonText: string) {
    super(id);
    this.buttonText = buttonText;
  }

  addIt(){
    let newButton = document.createElement('button')
    newButton.innerHTML = this.buttonText
    this.element.appendChild(newButton);
  }
}



let adder = new ButtonAdder('test-div', 'CLICK IT')