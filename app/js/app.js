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

});