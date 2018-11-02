import Toastr from 'toastr/toastr'

const TYPES = { alert: 'error', notice: 'success', info: 'info', warning: 'warning' };

export default class Flash {
  constructor(container_selector = '#flash-container') {
    this.$container = $(container_selector);
    this.messages  = this.$container.data('flash');

    this.clearData();
    this.setDefaultOptions();
  }

  static start() {
    $(document).ready(() => new Flash().show());
  }

  static TYPES() {
    return TYPES;
  }

  static show(key, message) {
    Toastr[Flash.TYPES()[key]](message);
  }

  static clear() {
    Toastr.remove();
  }

  clearData() {
    this.$container.attr('data-flash', null)
  }

  setDefaultOptions() {
    Toastr.options = {
      closeButton:       true,
      debug:             false,
      newestOnTop:       true,
      progressBar:       false,
      positionClass:     'toast-top-right',
      preventDuplicates: false,
      onclick:           null,
      showDuration:      '300',
      hideDuration:      '1000',
      timeOut:           '5000',
      extendedTimeOut:   '1000',
      showEasing:        'swing',
      hideEasing:        'linear',
      showMethod:        'fadeIn',
      hideMethod:        'fadeOut'
    };
  }

  show() {
    if (!Object.keys(this.messages).length) {
      return;
    }

    Object.entries(this.messages).forEach(([key, value]) => {
      if (Flash.TYPES().hasOwnProperty(key)) {
        if (Array.isArray(value)) {
          value.forEach(message => Flash.show(key, message));
        } else {
          Flash.show(key, value);
        }
      }
    });
  }
}
