//= require shared/switcher

$(document).ready(() => {
  new Switcher({ signInForm: '.js-sign-in-form', signUpForm: '.js-register-form' }).init();
});