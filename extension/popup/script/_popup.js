//= require jquery
//= require underscore
//= require backbone
//= require bootstrap
//= require handlebars.runtime
//= require_tree ../templates
//= require_directory .
//= require_directory ./models
//= require_directory ./collections
//= require_directory ./views

// Custom error handling
$(window).on('error', WLC.errorHandler);
// Boot App
WLC($('body'));