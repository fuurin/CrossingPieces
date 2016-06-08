// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// requiretreeを取っ払ったので、個々のjsファイルを読み込むことができます。そのためには、
// config/initializers/assets.rbにassetpipelineで処理するファイルを追加し、サーバを再起動してください。
// すると、javascript_include_tagで読み込むことができるようになります。
// production modeのときは、config/environments/production.rbにも追加する必要があるかもしれません。
//
//= require jquery
//= require jquery_ujs
//= require underscore
//= require bootstrap
//= require turbolinks