class Homepage {
  static get switchButton() { return '.js-switch-form' }

  constructor(params = {}) {
    this.registrationForm = params.registrationForm || '#registration';
    this.signInForm       = params.signInForm       || '#signin-form';
  }

  init() {
    this.switchForm();
  }

  switchForm() {
    debugger;
    $(Homepage.switchButton).click(()=>{
      $(this.registrationForm).toggle();
      $(this.signInForm).toggle();
    });
  }
}