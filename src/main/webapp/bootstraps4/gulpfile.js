var gulp = require('gulp');
var uncss = require('gulp-uncss');
var unusedImages = require('gulp-unused-images');
var plumber = require('gulp-plumber');
var imagemin = require('gulp-imagemin');
var elixir = require("laravel-elixir");


//over-ride laravel-elixir configuration
elixir.config.assetsPath = 'src';
elixir.config.publicPath = '';
elixir.config.viewPath = './';
elixir.config.sourcemaps = false;



//source path configuration
var vendors = 'src/vendors/';
var resourcesAssets = 'src/';
var srcCss = resourcesAssets + 'css/';
var srcJs = resourcesAssets + 'js/';

//destination path configuration
var dest = '';
var destFonts = dest + 'fonts/';
var destCss = dest + 'css/';
var destJs = dest + 'js/';
var destImg = dest + 'img/';
var destVendors = dest + 'vendors/';


/*
 |--------------------------------------------------------------------------
 | Elixir Asset Management
 |--------------------------------------------------------------------------
 |
 | Elixir provides a clean, fluent API for defining some basic Gulp tasks
 | for your Laravel application. By default, we are compiling the Less
 | file for our application, as well as publishing vendor resources.
 |
 */

var paths = {
    'jquery': vendors + 'jquery/dist/',
    'bootstrap': vendors + 'bootstrap/dist/',
    'fontawesome': vendors + 'font-awesome/',
    'tether': vendors + 'tether/dist/',
    'animate': vendors + 'animate.css/',
    'autosize': vendors + 'jquery-autosize/',
    'bootstrap_datepicker': vendors + 'bootstrap-datepicker/dist/',
    'bootstrap_daterangepicker': vendors + 'bootstrap-daterangepicker/',
    'bootstrap_switch': vendors + 'bootstrap-switch/dist/',
    'jquery_tagsinput': vendors + 'jquery.tagsinput/src/',
    'bootstrap_timepicker': vendors + 'bootstrap-timepicker/',
    'boostrap3_wysihtml5': vendors + 'bootstrap3-wysihtml5-bower/dist/',
    'bootstrap_calendar': vendors + 'bootstrap_calendar/bootstrap_calendar/',
    'buttons': vendors + 'Buttons/',
    'c3': vendors + 'c3/',
    'chosen': vendors + 'chosen/',
    'countup': vendors + 'countUp.js/dist/',
    'datatables': vendors + 'datatables.net/',
    'fullcalendar': vendors + 'fullcalendar/dist/',
    'gmaps': vendors + 'gmaps/',
    'handlebars': vendors + 'handlebars/',
    'holder': vendors + 'holderjs/',
    'inputlimiter': vendors + 'jquery-inputlimiter/',
    'jasny_bootstrap': vendors + 'jasny-bootstrap/',
    'jquery_uniform': vendors + 'jquery.uniform/',
    'justgage' : vendors + 'justgage-toorshia/',
    'bootstrap_colorpicker': vendors + 'mjolnic-bootstrap-colorpicker/dist/',
    'modal': vendors + 'ModalWindowEffects/',
    'moment': vendors + 'moment/',
    'noty': vendors + 'noty/',
    'rangy': vendors + 'rangy-1.3/',
    'bootstrap_slider': vendors + 'seiyria-bootstrap-slider/dist/',
    'select2': vendors + 'select2/dist/',
    'slimscroll': vendors +'jquery-slimscroll/',
    'tinymce': vendors + 'tinymce-dist/',
    'toastr': vendors + 'toastr/',
    'twitter_bootstrap_wizard': vendors + 'twitter-bootstrap-wizard/',
    'wysihtml5x': vendors + 'wysihtml5x/dist/',
    'themify': vendors + 'themify-icons/',
    'validation_engine': vendors +'jQuery-Validation-Engine/',
    'jquery_validation': vendors +'jquery-validation/dist/',
    'ion_rangeslider': vendors + 'ion.rangeslider/',
    'knob': vendors + 'jquery-knob/',
    'flotchart': vendors + 'flotchart/',
    'flotspline': vendors + 'flot-spline/js/',
    'flottooltip': vendors + 'flot.tooltip/js/',
    'datatablesbs' : vendors + 'datatables.net-bs/',
    'datatablesbutton' : vendors + 'datatables.net-buttons/',
    'datatablesbsbuttons' : vendors + 'datatables.net-buttons-bs/',
    'datatablescolreorder' : vendors + 'datatables.net-colreorder/',
    'datatablescolreorderbs' : vendors + 'datatables.net-colreorder-bs/',
    'datatablesresponsive' : vendors + 'datatables.net-responsive/',
    'datatablesrowreorder' : vendors + 'datatables.net-rowreorder/',
    'datatablesrowreorderbs' : vendors + 'datatables.net-rowreorder-bs/',
    'datatablesscroll' : vendors + 'datatables.net-scroller/',
    'datatablesscrollbs' : vendors + 'datatables.net-scroller-bs/',
    'raphael' : vendors + 'raphael/',
    'bootstrapValidator' : vendors + 'bootstrapValidator/dist/',
    'validval': vendors + 'jQuery.validVal/',
    'ionicons': vendors + 'ionicons/',
    'fancybox': vendors + 'fancybox/',
    'summernote': vendors + 'summernote/dist/',
    'sortable': vendors + 'Sortable/',
    'chartist': vendors + 'chartist/dist/',
    'inputmask': vendors + 'jquery.inputmask/dist/',
    'snabbt' : vendors + 'snabbt.js/',
    'hover': vendors + 'hover/',
    'switchery': vendors + 'switchery/dist/',
    'wow': vendors + 'wow/',
    'radio_css': vendors + 'radiobox.css/dist/',
    'checkbox_css': vendors + 'checkbox.css/dist/',
    'datetimepicker': vendors + 'datetimepicker/dist/',
    'pnotify': vendors + 'pnotify/dist/',
    'imagehover': vendors + 'imagehover/css/',
    'j_timepicker' : vendors + 'jt.timepicker/',
    'starability': vendors + 'starability/',
    'starrating': vendors + 'bootstrap-star-rating/',
    'jqvmap': vendors + 'jqvmap/dist/',
    'nvd3': vendors + 'nvd3/build/',
    'sweetalert': vendors + 'sweetalert2/dist/',
    'rickshaw': vendors + 'rickshaw/',
    'd3': vendors + 'd3/',
    'bootstrap_tagsinput': vendors + 'bootstrap-tagsinput/dist/',
    'jquery_newsTicker' : vendors + 'jquery.newsTicker/js/',
    'clockpicker': vendors + 'clockpicker/dist/',
    'intel_tel':vendors + 'intl-tel-input/build/',
    'rateYo': vendors + 'rateYo/',
    'swiper':  vendors + 'swiper/dist/',
    'circliful':  vendors + 'circliful/',
    'jqplot':  vendors + 'jqplot/src/',
    'ihover': vendors + 'ihover/',
    'flip': vendors + 'flip/',
    /*'izitoast': vendors + 'izitoast/',
    'cropper':  vendors + 'cropper/dist/',
    "fileinput": vendors + 'bootstrap-fileinput/',
    "backstretch":vendors + 'jquery.backstretch/',
    "LCswitch":vendors + 'LC-switch/',
    "jScrollPane":vendors + 'jScrollPane/',
    "chartjs":vendors + 'chart.js/',
    "jstree":vendors + 'jstree/',
    "tooltipster":vendors + 'tooltipster/dist/',
    "tipso":vendors + 'tipso/src/',
    "multiselect":vendors + 'multiselect/'*/
};

elixir(function(mix) {

    // Copy fonts straight to public
    mix.copy(paths.bootstrap + 'fonts', destFonts);

    mix.copy(paths.bootstrap + 'fonts', destFonts);
    mix.copy(paths.fontawesome + 'fonts', destFonts);

    //COPY CSS,JS AND IMAGES TO PUBLIC
    mix.copy(srcCss ,destCss);
    mix.copy(resourcesAssets + 'img',destImg);
    mix.copy(srcJs ,destJs);

    //bootstrap
    mix.copy(paths.bootstrap + 'js/bootstrap.min.js', destJs);

    //fontawesome
    mix.copy(paths.fontawesome + 'css/font-awesome.min.css', destCss);
    mix.copy(paths.fontawesome + 'fonts', destFonts);

    //jquery
    mix.copy(paths.jquery + 'jquery.min.js', destJs);

    //tether
    mix.copy(paths.tether + 'js/tether.min.js',destJs);
    //jquery.newsTicker
    mix.copy(paths.jquery_newsTicker + 'newsTicker.js',destVendors + 'jquery_newsTicker/js');

    // animate
    mix.copy(paths.animate + 'animate.min.css',  destVendors + 'animate/css');

    // animate
    mix.copy(paths.autosize + 'jquery.autosize.min.js',  destVendors + 'autosize/js');

    // bootstrap-datepicker
    mix.copy(paths.bootstrap_datepicker + 'js/bootstrap-datepicker.min.js', destVendors + 'datepicker/js');
    mix.copy(paths.bootstrap_datepicker + 'css/bootstrap-datepicker.min.css', destVendors + 'datepicker/css');
    mix.copy(paths.bootstrap_datepicker + 'css/bootstrap-datepicker3.css', destVendors + 'datepicker/css');

    //rickshaw
    mix.copy(paths.rickshaw + 'rickshaw.min.css',destVendors + 'rickshaw/css');
    mix.copy(paths.rickshaw + 'rickshaw.min.js',destVendors + 'rickshaw/js');

    // daterange picker
    mix.copy(paths.bootstrap_daterangepicker + 'daterangepicker.js', destVendors + 'daterangepicker/js');
    mix.copy(paths.bootstrap_daterangepicker + 'daterangepicker.css',  destVendors + 'daterangepicker/css');

    // bootstrap switch
    mix.copy(paths.bootstrap_switch + 'css/bootstrap3/bootstrap-switch.min.css',  destVendors + 'bootstrap-switch/css');
    mix.copy(paths.bootstrap_switch + 'js/bootstrap-switch.min.js',  destVendors + 'bootstrap-switch/js');

    // bootstrap tagsinput
    mix.copy(paths.jquery_tagsinput + 'jquery.tagsinput.css',  destVendors + 'jquery-tagsinput/css');
    mix.copy(paths.jquery_tagsinput + 'jquery.tagsinput.js',  destVendors + 'jquery-tagsinput/js');

    // bootstrap-timepicker
    mix.copy(paths.bootstrap_timepicker + 'css/bootstrap-timepicker.min.css',  destVendors + 'bootstrap-timepicker/css');
    mix.copy(paths.bootstrap_timepicker + 'js/bootstrap-timepicker.min.js',  destVendors + 'bootstrap-timepicker/js');

    //sweetalert
    mix.copy(paths.sweetalert + 'sweetalert2.min.css', destVendors + 'sweetalert/css');
    mix.copy(paths.sweetalert + 'sweetalert2.min.js', destVendors + 'sweetalert/js');

    // Buttons
    mix.copy(paths.buttons + 'css/buttons.min.css',  destVendors + 'Buttons/css');
    mix.copy(paths.buttons + 'showcase/js/scrollto.js',  destVendors + 'Buttons/js');
    mix.copy(paths.buttons + 'js/buttons.js',  destVendors + 'Buttons/js');

    //c3 charts
    mix.copy(paths.c3 + 'c3.min.css', destVendors + 'c3/css');
    mix.copy(paths.c3 + 'c3.min.js', destVendors + 'c3/js');

    // pnotify
    mix.copy(paths.pnotify + 'pnotify.css', destVendors + 'pnotify/css');
    mix.copy(paths.pnotify + 'pnotify.brighttheme.css', destVendors + 'pnotify/css');
    mix.copy(paths.pnotify + 'pnotify.buttons.css', destVendors + 'pnotify/css');
    mix.copy(paths.pnotify + 'pnotify.mobile.css', destVendors + 'pnotify/css');
    mix.copy(paths.pnotify + 'pnotify.history.css', destVendors + 'pnotify/css');

    // pnotify js
    mix.copy(paths.pnotify + 'pnotify.js', destVendors + 'pnotify/js');
    mix.copy(paths.pnotify + 'pnotify.animate.js', destVendors + 'pnotify/js');
    mix.copy(paths.pnotify + 'pnotify.buttons.js', destVendors + 'pnotify/js');
    mix.copy(paths.pnotify + 'pnotify.confirm.js', destVendors + 'pnotify/js');
    mix.copy(paths.pnotify + 'pnotify.nonblock.js', destVendors + 'pnotify/js');
    mix.copy(paths.pnotify + 'pnotify.mobile.js', destVendors + 'pnotify/js');
    mix.copy(paths.pnotify + 'pnotify.desktop.js', destVendors + 'pnotify/js');
    mix.copy(paths.pnotify + 'pnotify.history.js', destVendors + 'pnotify/js');
    mix.copy(paths.pnotify + 'pnotify.callbacks.js', destVendors + 'pnotify/js');

    //imagehover
    mix.copy(paths.imagehover + 'imagehover.min.css', destVendors + 'imagehover/css');

    //chosen
    mix.copy(paths.chosen + 'chosen.jquery.js', destVendors + 'chosen/js');
    mix.copy(paths.chosen + 'chosen.css', destVendors + 'chosen/css');
    mix.copy(paths.chosen + 'chosen-sprite.png', destVendors + 'chosen/css');
    mix.copy(paths.chosen + 'chosen-sprite@2x.png', destVendors + 'chosen/css');

    // countUp js
    mix.copy(paths.countup + 'countUp.min.js',  destVendors + 'countUp.js/js');


    // datatables
    mix.copy(paths.datatables + 'js/jquery.dataTables.min.js', destVendors + 'datatables/js');
    mix.copy(paths.datatablesbs + 'js/dataTables.bootstrap.min.js', destVendors + 'datatables/js');
    mix.copy(paths.datatablesbs + 'css/dataTables.bootstrap.min.css', destVendors + 'datatables/css');
    mix.copy(paths.datatablesbutton + 'js/buttons.print.min.js', destVendors + 'datatables/js');
    mix.copy(paths.datatablesbutton + 'js/dataTables.buttons.min.js', destVendors + 'datatables/js');
    mix.copy(paths.datatablesbsbuttons + 'css/buttons.bootstrap.css', destVendors + 'datatables/css');
    mix.copy(paths.datatablesbsbuttons + 'js/buttons.bootstrap.min.js', destVendors + 'datatables/js');
    mix.copy(paths.datatablescolreorder + 'js/dataTables.colReorder.min.js', destVendors + 'datatables/js');
    mix.copy(paths.datatablescolreorderbs + 'css/colReorder.bootstrap.min.css', destVendors + 'datatables/css');
    mix.copy(paths.datatablesresponsive + 'js/dataTables.responsive.min.js', destVendors + 'datatables/js');
    mix.copy(paths.datatablesrowreorder + 'js/dataTables.rowReorder.min.js', destVendors + 'datatables/js');
    mix.copy(paths.datatablesbutton + 'js/buttons.html5.min.js', destVendors + 'datatables/js');
    mix.copy(paths.datatablesbutton + 'js/buttons.colVis.min.js', destVendors + 'datatables/js');
    mix.copy(paths.datatablesbutton + 'js/buttons.print.min.js', destVendors + 'datatables/js');
    mix.copy(paths.datatablesrowreorderbs + 'css/rowReorder.bootstrap.css', destVendors + 'datatables/css');
    mix.copy(paths.datatablesscroll + 'js/dataTables.scroller.min.js', destVendors + 'datatables/js');
    mix.copy(paths.datatablesscrollbs + 'css/scroller.bootstrap.min.css', destVendors + 'datatables/css');

    // fullcalendar
    mix.copy(paths.fullcalendar + 'fullcalendar.min.css', destVendors + 'fullcalendar/css');
    mix.copy(paths.fullcalendar + 'fullcalendar.print.css', destVendors + 'fullcalendar/css');
    mix.copy(paths.fullcalendar + 'fullcalendar.min.js', destVendors + 'fullcalendar/js');

    // gmaps
    mix.copy(paths.gmaps + 'examples/examples.css', destVendors + 'gmaps/css');
    mix.copy(paths.gmaps + 'gmaps.min.js', destVendors + 'gmaps/js');

    // handlebars
    mix.copy(paths.handlebars + 'handlebars.js', destVendors + 'handlebars/js');

    // holderjs
    mix.copy(paths.holder + 'holder.js', destVendors + 'holderjs/js');


    //jasny-bootstrap
    mix.copy(paths.jasny_bootstrap + 'dist/css/jasny-bootstrap.min.css',  destVendors + 'jasny-bootstrap/css');
    mix.copy(paths.jasny_bootstrap + 'dist/js/jasny-bootstrap.min.js',  destVendors + 'jasny-bootstrap/js');
    mix.copy(paths.jasny_bootstrap + 'js/inputmask.js',  destVendors + 'jasny-bootstrap/js');

    // bootstrap color picker
    mix.copy(paths.bootstrap_colorpicker + 'css/bootstrap-colorpicker.min.css',  destVendors + 'bootstrap-colorpicker/css');
    mix.copy(paths.bootstrap_colorpicker + 'js/bootstrap-colorpicker.min.js',  destVendors + 'bootstrap-colorpicker/js');
    mix.copy(paths.bootstrap_colorpicker + 'img/bootstrap-colorpicker',  destCss + 'lib/colorpicker/img');

    // advanced modals
    mix.copy(paths.modal + 'css',  destVendors + 'modal/css');
    // mix.copy(srcCss + 'pages/advmodals.css',  destCss + 'pages');
    mix.copy(paths.modal + 'js/',  destVendors + 'modal/js');

    // moment
    mix.copy(paths.moment + 'min/moment.min.js',  destVendors + 'moment/js');


    // noty
    mix.copy(paths.noty + 'js/noty/packaged/jquery.noty.packaged.min.js',  destVendors + 'noty/js');

    // seiyria-bootstrap-slider
    mix.copy(paths.bootstrap_slider + 'css/bootstrap-slider.min.css',  destVendors + 'bootstrap-slider/css');
    mix.copy(paths.bootstrap_slider + 'bootstrap-slider.js',  destVendors + 'bootstrap-slider/js');

    //select2
    mix.copy(paths.select2 + 'css/select2.min.css',  destVendors + 'select2/css');
    mix.copy(paths.select2 + 'js/select2.js',  destVendors + 'select2/js');

    // tinymce
    mix.copy(paths.tinymce + 'tinymce.min.js',  destVendors + 'tinymce/js');
    mix.copy(paths.tinymce + 'jquery.tinymce.min.js',  destVendors + 'tinymce/js');
    mix.copy(paths.tinymce + 'plugins',  destVendors + 'tinymce/js/plugins');
    mix.copy(paths.tinymce + 'themes',  destVendors + 'tinymce/js/themes');
    mix.copy(paths.tinymce + 'skins',  destVendors + 'tinymce/js/skins');

    // toastr
    mix.copy(paths.toastr + 'toastr.min.css',  destVendors + 'toastr/css');
    mix.copy(paths.toastr + 'toastr.min.js',  destVendors + 'toastr/js');

    //twitter bootstrapWizard
    mix.copy(paths.twitter_bootstrap_wizard + 'jquery.bootstrap.wizard.min.js',  destVendors + 'twitter-bootstrap-wizard/js');


    // bootstrap3-wysihtml5-bower
    mix.copy(paths.boostrap3_wysihtml5 + 'bootstrap3-wysihtml5.min.css',  destVendors + 'bootstrap3-wysihtml5-bower/css');
    mix.copy(paths.boostrap3_wysihtml5 + 'bootstrap3-wysihtml5.all.min.js',  destVendors + 'bootstrap3-wysihtml5-bower/js');
    mix.copy(paths.boostrap3_wysihtml5 + 'bootstrap3-wysihtml5.min.js',  destVendors + 'bootstrap3-wysihtml5-bower/js');


    // bootstrap_calendar
    mix.copy(paths.bootstrap_calendar + 'css/bootstrap_calendar.css',  destVendors + 'bootstrap_calendar/css');
    mix.copy(paths.bootstrap_calendar + 'js/bootstrap_calendar.min.js',  destVendors + 'bootstrap_calendar/js');

    //inputlimiter
    mix.copy(paths.inputlimiter + 'jquery.inputlimiter.css',  destVendors + 'inputlimiter/css');
    mix.copy(paths.inputlimiter + 'jquery.inputlimiter.js',  destVendors + 'inputlimiter/js');

    //jquery.uniform
    mix.copy(paths.jquery_uniform + 'jquery.uniform.js',  destVendors + 'jquery.uniform/js');

    //justgage
    mix.copy(paths.justgage + 'justgage.js',  destVendors + 'justgage/js');

    //slimscroll
    mix.copy(paths.slimscroll+ 'jquery.slimscroll.min.js',  destVendors + 'slimscroll/js');

    //themify icons
    mix.copy(paths.themify+ 'css/themify-icons.css',  destVendors + 'themify/css');

    mix.copy(paths.themify + 'fonts/themify.woff', destVendors + 'themify/fonts');
    mix.copy(paths.themify + 'fonts/themify.ttf', destVendors + 'themify/fonts');
    mix.copy(paths.themify+ 'ie7/ie7.css',  destVendors + 'themify/css');
    mix.copy(paths.themify+ 'ie7/ie7.js',  destVendors + 'themify/js');

    //validation engine
    mix.copy(paths.validation_engine+ 'css/validationEngine.jquery.css',  destVendors + 'jquery-validation-engine/css');
    mix.copy(paths.validation_engine+ 'js/jquery.validationEngine.js',  destVendors + 'jquery-validation-engine/js');
    mix.copy(paths.validation_engine+ 'js/languages/jquery.validationEngine-en.js',  destVendors + 'jquery-validation-engine/js');

    //jquery validation
    mix.copy(paths.jquery_validation+ 'jquery.validate.js',  destVendors + 'jquery-validation/js');

    //ion rangeslider
    mix.copy(paths.ion_rangeslider+ 'css/ion.rangeSlider.css',  destVendors + 'ion-rangeslider/css');
    mix.copy(paths.ion_rangeslider+ 'css/ion.rangeSlider.skinFlat.css',  destVendors + 'ion-rangeslider/css');
    mix.copy(paths.ion_rangeslider+ 'js/ion.rangeSlider.min.js',  destVendors + 'ion-rangeslider/js');
    mix.copy(paths.ion_rangeslider+ 'img/sprite-skin-flat.png',  destVendors + 'ion-rangeslider/img');

    // knob jquery
    mix.copy(paths.knob+ 'js/jquery.knob.js',  destVendors + 'Knob/js');

    // flotchart
    mix.copy(paths.flotchart + 'examples/examples.css', destVendors + 'flotchart/css');
    mix.copy(paths.flotchart + 'jquery.flot.js', destVendors + 'flotchart/js');
    mix.copy(paths.flotchart + 'jquery.flot.threshold.js', destVendors + 'flotchart/js');
    mix.copy(paths.flotchart + 'jquery.flot.stack.js', destVendors + 'flotchart/js');
    mix.copy(paths.flotchart + 'jquery.flot.time.js', destVendors + 'flotchart/js');
    mix.copy(paths.flotchart + 'jquery.flot.resize.js', destVendors + 'flotchart/js');
    mix.copy(paths.flotchart + 'jquery.flot.categories.js', destVendors + 'flotchart/js');
    mix.copy(paths.flotchart + 'jquery.flot.pie.js', destVendors + 'flotchart/js');
    mix.copy(paths.flottooltip + 'jquery.flot.tooltip.min.js', destVendors + 'flot.tooltip/js');
    mix.copy(paths.flotspline + 'jquery.flot.spline.min.js', destVendors + 'flotspline/js');

    // raphael
    mix.copy(paths.raphael + 'raphael-min.js', destVendors + 'raphael/js');

    // bootstrapvalidator
    mix.copy(paths.bootstrapValidator + 'css/bootstrapValidator.min.css',  destVendors + 'bootstrapvalidator/css');
    mix.copy(paths.bootstrapValidator + 'js/bootstrapValidator.min.js',  destVendors + 'bootstrapvalidator/js');

    // validval
    mix.copy(paths.validval + 'js/jquery.validVal.min.js',  destVendors + 'validval/js');

    // ionicons
    mix.copy(paths.ionicons + 'css/ionicons.min.css',  destVendors + 'ionicons/css');
    mix.copy(paths.ionicons + 'fonts', destVendors + 'ionicons/fonts');

    // fancybox
    mix.copy(paths.fancybox + 'lib/jquery.mousewheel-3.0.6.pack.js', destVendors + 'fancybox/js');
    mix.copy(paths.fancybox + 'source/jquery.fancybox.js', destVendors + 'fancybox/js');
    mix.copy(paths.fancybox + 'source/jquery.fancybox.pack.js', destVendors + 'fancybox/js');
    mix.copy(paths.fancybox + 'source/helpers/jquery.fancybox-buttons.js', destVendors + 'fancybox/js');
    mix.copy(paths.fancybox + 'source/helpers/jquery.fancybox-thumbs.js', destVendors + 'fancybox/js');
    mix.copy(paths.fancybox + 'source/helpers/jquery.fancybox-media.js', destVendors + 'fancybox/js');
    mix.copy(paths.fancybox + 'source/helpers/jquery.fancybox-thumbs.css', destVendors + 'fancybox/css');
    mix.copy(paths.fancybox + 'source/helpers/jquery.fancybox-buttons.css', destVendors + 'fancybox/css');
    mix.copy(paths.fancybox + 'source/jquery.fancybox.css', destVendors + 'fancybox/css');
    mix.copy(paths.fancybox + 'source/fancybox_overlay.png', destVendors + 'fancybox/css');
    mix.copy(paths.fancybox + 'source/fancybox_loading.gif', destVendors + 'fancybox/css');
    mix.copy(paths.fancybox + 'source/fancybox_sprite.png', destVendors + 'fancybox/css');
    mix.copy(paths.fancybox + 'source/fancybox_sprite@2x.png', destVendors + 'fancybox/css');
    mix.copy(paths.fancybox + 'source/fancybox_loading@2x.gif', destVendors + 'fancybox/css');
    mix.copy(paths.fancybox + 'source/blank.gif', destVendors + 'fancybox/css');


    // bootstrapvalidator
    mix.copy(paths.summernote + 'summernote.css',  destVendors + 'summernote/css');
    mix.copy(paths.summernote + 'summernote.min.js',  destVendors + 'summernote/js');

    //Sortable
    mix.copy(paths.sortable + 'Sortable.min.js',  destVendors + 'sortable/js');

    //chartist
    mix.copy(paths.chartist + 'chartist.min.css',  destVendors + 'chartist/css');

    //Sortable
    mix.copy(paths.chartist + 'chartist.min.js',  destVendors + 'chartist/js');

    //inputmask
    mix.copy(paths.inputmask + 'inputmask/inputmask.js',  destVendors + 'inputmask/js');
    mix.copy(paths.inputmask + 'inputmask/jquery.inputmask.js',  destVendors + 'inputmask/js');
    mix.copy(paths.inputmask + 'inputmask/inputmask.extensions.js',  destVendors + 'inputmask/js');
    mix.copy(paths.inputmask + 'inputmask/inputmask.phone.extensions.js',  destVendors + 'inputmask/js');
    mix.copy(paths.inputmask + 'inputmask/inputmask.date.extensions.js',  destVendors + 'inputmask/js');
    mix.copy(paths.inputmask + 'jquery.inputmask.bundle.js', destVendors + 'inputmask/js');


    //snabbt
    mix.copy(paths.snabbt + 'snabbt.min.js',  destVendors + 'snabbt/js');
    //hover
    mix.copy(paths.hover + 'css/hover-min.css',  destVendors + 'hover/css');

    //switchery
    mix.copy(paths.switchery + 'switchery.min.css',  destVendors + 'switchery/css');
    mix.copy(paths.switchery + 'switchery.min.js',  destVendors + 'switchery/js');

    //wow
    mix.copy(paths.wow + 'dist/wow.min.js',  destVendors + 'wow/js');
    mix.copy(paths.wow + 'css/libs/animate.css', destVendors + 'wow/css');

    //wow
    mix.copy(paths.radio_css + 'css/radiobox.min.css',  destVendors + 'radio_css/css');

    //wow
    mix.copy(paths.checkbox_css + 'css/checkbox.min.css',  destVendors + 'checkbox_css/css');

    //datetimepicker
    mix.copy(paths.datetimepicker + 'DateTimePicker.min.js',  destVendors + 'datetimepicker/js');
    mix.copy(paths.datetimepicker + 'DateTimePicker.min.css', destVendors + 'datetimepicker/css');

    //jt timepicker
    mix.copy(paths.j_timepicker + 'jquery.timepicker.min.js',  destVendors + 'j_timepicker/js');
    mix.copy(paths.j_timepicker + 'jquery.timepicker.css', destVendors + 'j_timepicker/css');

    //starability
    mix.copy(paths.starability + 'starability-css/starability-all.css', destVendors + 'starability/css');
    mix.copy(paths.starability + 'starability-images/icons.png', destVendors + 'starability/starability-images');
    mix.copy(paths.starability + 'starability-images/icons@2x.png', destVendors + 'starability/starability-images');
    mix.copy(paths.starability + 'starability-images/icons-checkmark.png', destVendors + 'starability/starability-images');
    mix.copy(paths.starability + 'starability-images/icons-checkmark@2x.png', destVendors + 'starability/starability-images');

    //bootstrap star rating
    mix.copy(paths.starrating + 'css/star-rating.min.css', destVendors + 'bootstraprating/css');
    mix.copy(paths.starrating + 'js/star-rating.min.js', destVendors + 'bootstraprating/js');
    mix.copy(paths.starrating + 'img/loading.gif', destVendors + 'bootstraprating/img');


    //nvd3
    mix.copy(paths.nvd3 + 'nv.d3.js', destVendors + 'nvd3/js');
    mix.copy(paths.nvd3 + 'nv.d3.css', destVendors + 'nvd3/css');

    //d3
    mix.copy(paths.d3 + 'd3.min.js', destVendors + 'd3/js');

    //jqvmaps
    mix.copy(paths.jqvmap + 'jqvmap.min.css', destVendors + 'jqvmap/css');
    mix.copy(paths.jqvmap + 'jquery.vmap.min.js', destVendors + 'jqvmap/js');
    mix.copy(paths.jqvmap + 'maps/jquery.vmap.world.js', destVendors + 'jqvmap/js');
    mix.copy(paths.jqvmap + 'maps/jquery.vmap.canada.js', destVendors + 'jqvmap/js');
    mix.copy(paths.jqvmap + 'maps/jquery.vmap.usa.js', destVendors + 'jqvmap/js');
    mix.copy(paths.jqvmap + 'maps/jquery.vmap.europe.js', destVendors + 'jqvmap/js');
    mix.copy(paths.jqvmap + 'maps/continents/jquery.vmap.australia.js', destVendors + 'jqvmap/js');
    mix.copy(paths.jqvmap + 'maps/jquery.vmap.russia.js', destVendors + 'jqvmap/js');


    //bootstrap_tagsinput
    mix.copy(paths.bootstrap_tagsinput + 'bootstrap-tagsinput.css', destVendors + 'bootstrap-tagsinput/css');
    mix.copy(paths.bootstrap_tagsinput + 'bootstrap-tagsinput.js', destVendors + 'bootstrap-tagsinput/js');

    //clockpicker
    mix.copy(paths.clockpicker + 'jquery-clockpicker.css', destVendors + 'clockpicker/css');
    mix.copy(paths.clockpicker + 'jquery-clockpicker.min.js', destVendors + 'clockpicker/js');

    //intl tel input
    mix.copy(paths.intel_tel + 'css/intlTelInput.css', destVendors + 'intl-tel-input/css');
    mix.copy(paths.intel_tel + 'js/intlTelInput.js', destVendors + 'intl-tel-input/js');
    mix.copy(paths.intel_tel + 'js/utils.js', destVendors + 'intl-tel-input/js');

    mix.copy(paths.intel_tel + 'img/flags.png', destVendors + 'intl-tel-input/img');
    mix.copy(paths.intel_tel + 'img/flags@2x.png', destVendors + 'intl-tel-input/img');


    // rateyo
    mix.copy(paths.rateYo + 'src/jquery.rateyo.css', destVendors + 'rateyo/css');
    mix.copy(paths.rateYo + 'src/jquery.rateyo.js', destVendors + 'rateyo/js');

    // swiper
    mix.copy(paths.swiper + 'css/swiper.min.css', destVendors + 'swiper/css');
    mix.copy(paths.swiper + 'js/swiper.min.js', destVendors + 'swiper/js');

    // circliful
    mix.copy(paths.circliful + 'css/jquery.circliful.css', destVendors + 'circliful/css');
    mix.copy(paths.circliful + 'js/jquery.circliful.min.js', destVendors + 'circliful/js');

    //jqplot

    mix.copy(paths.jqplot + 'jquery.jqplot.css',  destVendors + 'jqplot/css');
    mix.copy(paths.jqplot + 'jquery.jqplot.js',  destVendors + 'jqplot/js');
    mix.copy(paths.jqplot + 'plugins/jqplot.dateAxisRenderer.js',  destVendors + 'jqplot/js');
    mix.copy(paths.jqplot + 'plugins/jqplot.logAxisRenderer.js',  destVendors + 'jqplot/js');
    mix.copy(paths.jqplot + 'plugins/jqplot.canvasTextRenderer.js',  destVendors + 'jqplot/js');
    mix.copy(paths.jqplot + 'plugins/jqplot.canvasAxisTickRenderer.js',  destVendors + 'jqplot/js');
    mix.copy(paths.jqplot + 'plugins/jqplot.highlighter.js',  destVendors + 'jqplot/js');

    //ihover
    mix.copy(paths.ihover + 'src/ihover.min.css', destVendors + 'ihover/css');

    //flip
    mix.copy(paths.flip + 'dist/jquery.flip.min.js', destVendors + 'flip/js');

    // izitoast
    mix.copy(paths.izitoast + 'dist/css/iziToast.min.css', destVendors + 'izitoast/css');
    mix.copy(paths.izitoast + 'dist/js/iziToast.min.js', destVendors + 'izitoast/js');

    //cropper
    mix.copy(paths.cropper + 'cropper.min.js', destVendors + 'cropper/js');
    mix.copy(paths.cropper + 'cropper.min.css', destVendors + 'cropper/css');

    //fileinput
    mix.copy(paths.fileinput + 'css/fileinput.min.css', destVendors + 'fileinput/css');
    mix.copy(paths.fileinput + 'js/fileinput.min.js', destVendors + 'fileinput/js');
    mix.copy(paths.fileinput + 'themes/fa/theme.js', destVendors + 'fileinput/js');
    mix.copy(paths.fileinput + 'img/loading.gif', destVendors + 'fileinput/img');

    // jquery.backstretch
    mix.copy(paths.backstretch + 'src/jquery.backstretch.js', destVendors + 'jquery.backstretch/js');

    // LC-switch
    mix.copy(paths.LCswitch + 'lc_switch.css', destVendors + 'LC-switch/css');
    mix.copy(paths.LCswitch + 'lc_switch.min.js', destVendors + 'LC-switch/js');


    // jScrollPane
    mix.copy(paths.jScrollPane + 'style/jquery.jscrollpane.css', destVendors + 'jScrollPane/css');
    mix.copy(paths.jScrollPane + 'script/mwheelIntent.js', destVendors + 'jScrollPane/js');
    mix.copy(paths.jScrollPane + 'script/jquery.mousewheel.js', destVendors + 'jScrollPane/js');
    mix.copy(paths.jScrollPane + 'script/jquery.jscrollpane.min.js', destVendors + 'jScrollPane/js');

    // chart.js
    mix.copy(paths.chartjs + 'dist/Chart.min.js', destVendors + 'chartJs/js');



    // jstree
    mix.copy(paths.jstree + 'dist/themes/default/throbber.gif', destVendors + 'jstree/css');
    mix.copy(paths.jstree + 'dist/themes/default/32px.png', destVendors + 'jstree/css');
    mix.copy(paths.jstree + 'dist/themes/default/style.min.css', destVendors + 'jstree/css');
    mix.copy(paths.jstree + 'dist/jstree.min.js', destVendors + 'jstree/js');

    // tooltipster
    mix.copy(paths.tooltipster + 'css/plugins/tooltipster/sideTip/themes', destVendors + 'tooltipster/css');
    mix.copy(paths.tooltipster + 'css/tooltipster.bundle.min.css', destVendors + 'tooltipster/css');
    mix.copy(paths.tooltipster + 'js/tooltipster.bundle.min.js', destVendors + 'tooltipster/js');

    // tipso
    mix.copy(paths.tipso + 'tipso.min.css', destVendors + 'tipso/css');
    mix.copy(paths.tipso + 'tipso.min.js', destVendors + 'tipso/js');

    // multiselect
    mix.copy(paths.multiselect + 'css/multi-select.css', destVendors + 'multiselect/css');
    mix.copy(paths.multiselect + 'img/switch.png', destVendors + 'multiselect/img');
    mix.copy(paths.multiselect + 'js/jquery.multi-select.js', destVendors + 'multiselect/js');


    /*
     browserSync for auto-reloading browser on changes
     */
    mix.browserSync({
        files: ['**/*.html', '**/*.css', '**/*.js'],
        proxy: undefined,
        server: {
            baseDir: "./"
        }
    });

    mix.sass('admire.scss','css/custom.css');

    mix.sass('bootstrap/app.scss','css/bootstrap.min.css');

    mix.sass('sweetalert/sweetalert2.scss','css/pages/sweet_alert.css');

    mix.styles('pages/sweet_alert.css','css/pages/sweet_alert.css');


    mix.styles(
        [
            '../../css/bootstrap.min.css',
            '../../css/font-awesome.min.css',
            '../../vendors/jScrollPane/css/jquery.jscrollpane.css',
            '../../vendors/LC-switch/css/lc_switch.css',
            '../../vendors/checkbox_css/css/checkbox.min.css'

        ], destCss + 'components.css');
    mix.scripts(
        [
            '../../js/jquery.min.js',
            '../../js/tether.min.js',
            '../../js/bootstrap.min.js',
            '../../vendors/LC-switch/js/lc_switch.min.js',
            '../../vendors/jScrollPane/js/jquery.mousewheel.js',
            '../../vendors/jScrollPane/js/mwheelIntent.js',
            '../../vendors/jScrollPane/js/jquery.jscrollpane.min.js'

        ], destJs + 'components.js');
    mix.scripts(
        [
            '../../js/admire.js'

        ], destJs + 'custom.js');
    mix.scripts(
        [
            '../../js/components.js',
            '../../js/admire.js',
            '../../vendors/raphael/js/raphael-min.js',
            '../../vendors/d3/js/d3.min.js',
            '../../vendors/c3/js/c3.min.js',
            '../../vendors/toastr/js/toastr.min.js',
            '../../vendors/switchery/js/switchery.min.js',
            '../../vendors/flotchart/js/jquery.flot.js',
            '../../vendors/flotchart/js/jquery.flot.resize.js',
            '../../vendors/flotchart/js/jquery.flot.stack.js',
            '../../vendors/flotchart/js/jquery.flot.time.js',
            '../../vendors/flotspline/js/jquery.flot.spline.min.js',
            '../../vendors/flotchart/js/jquery.flot.categories.js',
            '../../vendors/flotchart/js/jquery.flot.pie.js',
            '../../vendors/flot.tooltip/js/jquery.flot.tooltip.min.js',
            '../../vendors/jquery_newsTicker/js/newsTicker.js',
            '../../vendors/countUp.js/js/countUp.min.js',
            '../../js/pages/new_dashboard.js'

        ], destJs + 'dashboard_components.js');

});


/*
 | Finds un-used css and outputs css files into out folder
 | NOTE: sometimes even for used classes, it shows false positibe, be careful
 */
//directory
gulp.task('uncss', function () {
    //medical
    return gulp.src([
        // include custom css files here
    ])
        .pipe(uncss({
            html: ['**/*.html']
        }))
        .pipe(gulp.dest('./out'));

});

/*
 | Find for un-used images and show log
 */
gulp.task('images:filter', function () {
    return gulp.src(['images/**/*'])
        .pipe(plumber())
        .pipe(unusedImages({log:true, delete:false}))
        .pipe(plumber.stop());
});


/*
 | image minimisation
 */
gulp.task('images:min', function(){
    return gulp.src('images/**/*.+(png|jpg|gif|svg)')
        .pipe(imagemin())
        .pipe(gulp.dest('images/'))
});