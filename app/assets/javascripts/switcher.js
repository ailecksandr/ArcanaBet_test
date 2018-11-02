class Switcher {
  static get defaultSwitchButton() { return '.js-switch-form'}

  constructor(params = {}) {
    this.switchButton = params.switchButton || Switcher.defaultSwitchButton;
    this.signInForm   = params.signInForm;
    this.signUpForm   = params.signUpForm;
  }

  init() {
    this.switchForm();
  }

  switchForm() {
    $(this.switchButton).click(() => {
      $(this.signUpForm).toggleClass('d-none');
      $(this.signInForm).toggleClass('d-none');
    })
  }
}