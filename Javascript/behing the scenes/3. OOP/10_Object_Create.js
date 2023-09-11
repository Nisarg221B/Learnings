
const PersonProto = {
    calcAge(){
        console.log(2023 - this.birthYear);
    },

    init(firstName,birthYear){
        this.firstName = firstName;
        this.birthYear = birthYear;
    },
};

const steven = Object.create(PersonProto);

steven.name = 'Steven';
steven.birthYear = 2002;
steven.calcAge();

console.log(steven,steven.__proto__);

const sarah = Object.create(PersonProto);
sarah.init('Sarah',1989);
sarah.calcAge();
console.log(steven,steven.__proto__);
