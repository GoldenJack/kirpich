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
        if (!$(this).hasClass('--disabled'))
            selectStat($(this), 'select__form');
    })

    $('.stone__view__box').on('click', '.stone__view__elem', function(e){
        e.preventDefault();
        if (!$(this).hasClass('--disabled'))
            selectStat($(this), 'select__view');
    })


    //success 
    $('#success').iziModal({
        width: 505,
        padding: 30
    });

    //modal region

    $('#region').iziModal({
        width: 505,
        padding: 30
    });

    $('.modal__region').click(function(e){
        e.preventDefault();
        $('#region').iziModal('open');
    });

    $('#regionAny').click(function(e){
        e.preventDefault();
        $('.region__screen__start').hide(500);
        $('.region__screen__select').show(500);
        $('#region').find('.modal__title').text('Выбрать регион');
    });
    //production

    $('#production').iziModal({
        width: 505,
        padding: 30
    });

    $('#error').iziModal({
        width: 505,
        padding: 30
    });

    $('.work__btn').click(function(e){
        e.preventDefault();
        $('#production').iziModal('open');
    });

    //modal callback

    $('#callback').iziModal({
        width: 505,
        padding: 30
    });
    
    $('.callback__btn').click(function(e){
        e.preventDefault();
        $('#callback').iziModal('open');
    });

    //modal buy

    $('#buy').iziModal({
        width: 505,
        padding: 30
    });

    var stoneInfo = function(){
        var stone = $('#stone');
        var stoneSize = stone.find('.stone__size__elem.select__size').text();
        var stoneColor = stone.find('.stone__color__elem.select__color > img').attr('title');
        var stoneView = stone.find('.stone__view__elem.select__view > p').text();
        var stoneForm = stone.find('.stone__form__elem.select__form > p').text();

        if(!stoneSize) {
            stoneSize = "<br>Выберите размер<br>"
        }
        if(!stoneColor) {
            stoneColor = "<br>Выберите цвет<br>"
        }
        if(!stoneView) {
            stoneSize = "<br>Выберите вид<br>"
        }
        if(!stoneForm) {
            stoneForm = "<br>Выберите размер<br>"
        }


        return 'Кирпич ' + stoneSize + ' ' + stoneView + ' ' + stoneForm + ' ' + stoneColor;
    }

    var stonePrice = function(modal){
        var count = modal.find('.counter');
        var inputResult = modal.find('.result__input');
        var valueNow = Number(count.find('input').val());
        var stoneCount = Number($('.stoneCount').find('.stone__value').text());
        var stonePriceOne = Number($('.stonePriceOne').text());

        return modal.find('.result__sum__value').text(stoneCount * stonePriceOne * valueNow), 
               inputResult.val(stoneCount * stonePriceOne * valueNow); 
    }

    var plitPrice = function(){

    }

    var counter = function(){
        var modal = $('#buy');
        var modalProduct = modal.data('group');
        var count = modal.find('.counter');
        var addCount = count.find('.addCount');
        var delCount = count.find('.delCount');
        var valueNow = Number(count.find('input').val());

        addCount.click(function(){
            count.find('input').val(valueNow+1);
            if(modalProduct === '#stone') {
                stonePrice(modal);
            }else if (modalProduct === '#plit') {
                plitPrice();
            }else if (modalProduct === '#elem') {
                elemPrice();
            }
        })

        delCount.click(function(){
            if(valueNow > 1){
                count.find('input').val(valueNow-1);
                if(modalProduct === '#stone') {
                    stonePrice(modal);
                }else if (modalProduct === '#plit') {
                    plitPrice();
                }else if (modalProduct === '#elem') {
                    elemPrice();
                } 
            }
        })
    };

    $('.counter').click(function(){
        counter();
    });
    counter();

    $('.btn__buy').click(function(e){
        e.preventDefault();
        var self = $(this);
        var product = $(this).data('product');
        var title = null;
        var productInfo = null;
        var modal = $('#buy');
        var price = null;

        if(product === '#stone') {
            title = 'Заказать кирпич';
            productInfo = stoneInfo();
            stonePrice(modal);
        }else if (product === '#plit') {
            var mainProduct = self.parent('.plit__elem');
            title = 'Заказать плитку';
            productInfo = mainProduct.find('.plit__elem__stat').html();

        }else if (product === '#elem') {
            title = 'Заказать элемент'
        }


        modal.find('.modal__title').text(title);
        modal.find('.product__info').html(productInfo);
        modal.find('.product__info__input').val(productInfo);
        modal.data('group', product);

        $('#buy').iziModal('open');
        return false;
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

    $('#plit__slider').slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 1
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

    $('.up').click(function(){
        $('html,body').animate({scrollTop: 0}, 1500);
    })


    //ajax 

    var ajaxForm = function(self){
        var action = self[0].action;
        var data = self.serializeArray();

        console.log(action, data)
        $.ajax({
            url: action,
            type: 'POST',
            data: data,
            success: function(){
                $('#success').iziModal('open');
            },
            error: function(){
                $('#error').iziModal('open');
            }
        })        
    }

    $('form').submit(function(e){
        e.preventDefault();
        ajaxForm($(this));
    })



    //colors 
    $(".stone__color__elem > img").each(function(b) {//работа с элементом (ссылка)
        console.log(this.title)
        if (this.title) {
            var c = this.title;
            var x = 0;//расположение по горизонтали(left)
            var y = 35;//расположение по вертикали (top)
            $(this).mouseover(function(d) {
                this.title = "";
                $("body").append('<div id="tooltip">' + c + "</div>");
                $("#tooltip").css({
                    left: (d.pageX + x) + "px",
                    top: (d.pageY + y) + "px",
                    opacity: "0.8"//полупрозрачность
                }).show(300)//скорость появления подсказки
            }).mouseout(function() {
                this.title = c;
                $("#tooltip").remove()
            }).mousemove(function(d) {
                $("#tooltip").css({
                    left: (d.pageX + x) + "px",
                    top: (d.pageY + y) + "px"
                })
            })
        }
    })

    $('.offer__desc').readmore({
        speed: 300,
        moreLink: '<a href="#" class="btn offer__btn">Показать весь текст</a>',
        lessLink: '<a href="#" class="btn offer__btn">Скрыть текст</a>',
        collapsedHeight: 140,
        embedCSS: true
    })
});