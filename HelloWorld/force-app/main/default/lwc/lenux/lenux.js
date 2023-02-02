import { LightningElement } from 'lwc';

export default class Lenux extends LightningElement {
   
firstName="Silver"
lastName="Microsystems"

firstNameHandler(event){
    this.firstName=event.target.value
}

lastNameHeader(event){
    this.lastName=event.target.value
}

}