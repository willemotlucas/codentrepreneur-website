document.addEventListener("turbolinks:load", function() {
    $('.dropdown-toggle').dropdown();

    $('body.free_project.show').ready(function(){
        showRatingsTab();
    });

    $('body.paid_project.show').ready(function(){
        showRatingsTab();
    });

    function showRatingsTab(){
        var target = window.location.href.split('#');
        if(target[1]){
            $('.tab-pane').removeClass('active');
            $('a.nav-link.active').removeClass('active');
            $('#'+target[1]).addClass('active');
            $('a[href="#'+target[1]+'"').addClass('active');
            $('.nav-link a').filter('[href="#'+target[1]+'"]').tab('show');
        }
    }

    /*var $navbar = $("#navbar"),
        y_pos = $navbar.offset().top,
        height = $navbar.height();

    $(document).scroll(function() {
        var scrollTop = $(this).scrollTop();

        if (scrollTop > y_pos) {
            $navbar.addClass("sticky");
        } else if (scrollTop <= y_pos) {
            $navbar.removeClass("sticky");
        }
    });*/
})