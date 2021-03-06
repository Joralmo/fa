// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
document.onreadystatechange = () => {
    if (document.readyState === 'complete') {
        var botonFlotante = document.querySelectorAll('.fixed-action-btn');
        var initBotonFlotante = M.FloatingActionButton.init(botonFlotante, {});
        var fecha = document.querySelectorAll('.datepicker');
        var initFecha = M.Datepicker.init(fecha, {});
        var sidenav = document.querySelectorAll('.sidenav');
        var iniSidenav = M.Sidenav.init(sidenav, {});
        var modal = document.querySelectorAll('.modal');
        var iniModal = M.Modal.init(modal, {});
        window.localStorage.setItem("pagina", location.href);
    }
};