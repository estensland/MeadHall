// PRIMES

var primeCheck = function(number) {
  var i = 2;
  while (i < (Math.sqrt(number) + 1)) {
    if (number % i === 0 && number !== 2) {return false;}
    i ++;
  }
  return true;
};


// FIBONACCI

evenFibs = function(limit) {
  var current = 2;
  var prev = 1;

  var evenFibs = [current];

  while(current < limit) {
   next = current + prev;

   if (next % 2 === 0){evenFibs.push(next);}
     prev = current;
     current = next;
   }

  return evenFibs.reduce(function(a,b){return a+b;});
}



// PALLINDROME

var pallindromeCheck = function(num){
  var string = num.toString();
  return string === string.split('').reverse().join('');
}

var largestPallindromeFinder = function(low, high){
  var largest = 0;
  pallindromes = [];
  for(var i = low; i < high; i ++){
    for(var y = i; y < high; y ++){
      var prod = i * y;
      if ((prod > largest) && (pallindromeCheck(prod))){
        largest = prod;
      }
    }
  }
  return largest;
}


// DIVISIBLE BY UP TO:

var isDivTo = function(number, breakPoint){
  divisor = breakPoint
  while(divisor > breakPoint/2){
    if (number % divisor !== 0) {
      return false;
    }
    divisor --;
  }
  return true;
};

var firstDivByAll = function(number) {
  found = false;
  i = 20;
  while (found === false) {
    if (isDivTo(i, number)) {
      found = true;
      return i;
    }
    i = i + 20;
  }
};


//  SUM SQUARED DIFFERENCE

sumSquareDifferenceUpTo = function(limit) {
  var regular_sum = 0;
  var squared_sum = 0;
  x = 1;
  while (x <= limit) {
    regular_sum = regular_sum + x;
    squared_sum = squared_sum + Math.pow(x,2);
    x ++;
  }
  return Math.pow(regular_sum,2) - squared_sum;
};
