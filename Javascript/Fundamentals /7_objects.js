
// writing explicit object literal using brackets 
const nisarg = {
    firstName: 'nisarg',
    lastName: 'patel',
    job: 'Software developer',
    friends: ['Payal','nikhil','nishant'],
    calAge: function(birthyear){
        this.age =  2023 - birthyear; // using this keyword to add properties
        return this.age;
    },
    calmybirthyear: function(){
        return 2023 - this.age;
    }
}

console.log(typeof nisarg);
console.log(nisarg);

// retrieving elements
console.log(nisarg['firstName'],nisarg.lastName);

console.log(nisarg.calAge(2000));
console.log(nisarg.calmybirthyear(23));


// adding new properties to a object
nisarg.location = 'Mahesana';
nisarg['codeforces'] = 'Indicate';
console.log(nisarg);

