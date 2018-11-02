import 'bootstrap/dist/js/bootstrap'
import '@fortawesome/fontawesome-free/js/all'

let App = App || {};

import Rails from 'rails-ujs'
import Flash from './flash'

window.App  = App;

Rails.start();

App.flash = Flash;
Flash.start();