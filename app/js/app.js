$(document).ready(function() {
    
    var switchTab = function(self, selector) {
        var id = self.data('to');
        
        $(id).fadeIn(500).siblings('div').fadeOut(500);
        self.addClass(selector).siblings().removeClass(selector);
    };

    var selectStat = function(self, selector) {
        self.addClass(selector).siblings().removeClass(selector)
    }

    var selectForm = function(self, selector){
        selectStat(self, selector);
        // todo animation
    }













    $('.products__menu').on('click', 'a', function(e){
        e.preventDefault();
        switchTab($(this), 'active__products');
    });

    $('.stone__color__box').on('click', 'a', function(e){
        e.preventDefault();
        selectStat($(this), 'select__color');
    });

    $('.stone__size__box').on('click', 'a', function(e){
        e.preventDefault();
        selectStat($(this), 'select__size');
    });

    $('.stone__form__box').on('click', '.stone__form__elem', function(e){
        e.preventDefault();
        selectStat($(this), 'select__form');
    })

    $('.stone__view__box').on('click', '.stone__view__elem', function(e){
        e.preventDefault();
        selectStat($(this), 'select__view');
    })



    //modal region

    $('#region').iziModal({
        width: 505,
        padding: 30
    });

    $('.modal__region').click(function(e){
        $('#region').iziModal('open');
    });

    $('#regionAny').click(function(e){
        e.preventDefault();
        $('.region__screen__start').hide(500);
        $('.region__screen__select').show(500);
        $('#region').find('.modal__title').text('Выбрать регион');
    });

    //modal callback

    $('#callback').iziModal({
        width: 505,
        padding: 30
    });
    
    $('.callback__btn').click(function(e){
        $('#callback').iziModal('open');
    });





    //carousel 

    $('.slick__header').slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 1,
        responsive: [
            {
                breakpoint: 1360,
                settings: {
                    slidesToShow: 3,
                    slidesToScroll: 1,
                    infinite: true
                }
            },
            {
                breakpoint: 1040,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2
                }
            },
            {
                breakpoint: 768,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
        ]
    });

    $('.stone__slider').slick({
        infinite: true,
        slidesToShow: 1,
        slidesToScroll: 1
    });

    $('.sertifics__box').slick({
        infinite: true,
        slidesToShow: 3,
        slidesToScroll: 1,
        responsive: [
            {
                breakpoint: 1200,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1,
                    infinite: true
                }
            },
            {
                breakpoint: 768,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    infinite: true
                }
            }
        ]
    });

    $('.offer__slider').slick({
        infinite: true,
        slidesToShow: 3,
        slidesToScroll: 1,
        responsive: [
            {
                breakpoint: 1200,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1,
                    infinite: true
                }
            },
            {
                breakpoint: 768,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    infinite: true
                }
            }
        ]
    });





    //mobile menu 

    var mobile_menu = $('.menu__mob__right');
    var btn         = $('.menu__btn');
    var close_m  = mobile_menu.find('.close');

    var closeMenu   = function(el, selector) {
        el.animate({
            right: '-100%'
        }, 500).addClass(selector)

    }

    btn.click(function(e){
        if(mobile_menu.hasClass('non-active')){
            mobile_menu.show(10);
            mobile_menu.animate({
                right: 0
            }, 500)
            mobile_menu.removeClass('non-active');
        }
    })

    $(document).mouseup(function (e){
        if (!mobile_menu.is(e.target) && mobile_menu.has(e.target).length === 0) { 
            closeMenu(mobile_menu, 'non-active');
        }
    });

    close_m.click(function(){
        closeMenu(mobile_menu, 'non-active');
    });

    //menu anchor

    var nav = $('.nav');

    nav.on('click', 'a', function(e){
        e.preventDefault();
        var anchor = $(this).data('anchor');
        var anchorBlock = $(anchor).offset().top;
        $('html,body').animate({scrollTop: anchorBlock}, 1000);
    })
});