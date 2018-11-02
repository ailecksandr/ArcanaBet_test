import 'bootstrap/dist/js/bootstrap'
import '@fortawesome/fontawesome-free/js/all'

let App = App || {};

import Rails     from 'rails-ujs'
import Flash     from './flash'
import Chartkick from "chartkick";
import Chart     from "chart.js";

window.App       = App;
window.Chartkick = Chartkick;

Rails.start();

Chartkick.addAdapter(Chart);

App.flash = Flash;

Flash.start();