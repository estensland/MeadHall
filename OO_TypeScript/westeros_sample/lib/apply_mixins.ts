function applyMixins(givenClass: any, givenMixins: any[]){
  givenMixins.forEach(mixin => {
    Object.getOwnPropertyNames(mixin.prototype).forEach(name => {
      givenClass.prototype[name] = mixin.prototype[name];
    });
  });
}
