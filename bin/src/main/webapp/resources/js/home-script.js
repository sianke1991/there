$(function(){

    // mobile menu
    $('.m-menu-btn').on('click', function(){
        if($(this).hasClass('on')) {
            $(this).removeClass('on').next('#mGnb').stop().fadeOut(300);
            $('body').css('overflow', 'auto');
        } else {
            $(this).addClass('on').next('#mGnb').stop().fadeIn(300);
            $('body').css('overflow', 'hidden');
        }

        
    });


    // slider
    var magazineSlider = new Swiper(".magazine-slider", {
        slidesPerView: 1.2,
        spaceBetween: 20,
        centeredSlides: true,
        loop: true,
        navigation: {
            nextEl: ".slide-next",
            prevEl: ".slide-prev",
        },
        breakpoints: {
            // when window width is >= 480px
            480: {
                slidesPerView: 1.4,
                spaceBetween: 20,
                centeredSlides: true
            },
            // when window width is >= 640px
            640: {
                slidesPerView: 1.8,
                spaceBetween: 20,
                centeredSlides: true
            },
            // when window width is >= 992px
            992: {
                slidesPerView: 1.8,
                spaceBetween: 20,
                centeredSlides: true
            },
            // when window width is >= 1320px
            1200: {
                slidesPerView: 2.8,
                spaceBetween: 20,
                centeredSlides: false
            },
        }

    });

    var placeSlider = new Swiper(".place-slider", {
        slidesPerView: 2.4,
        spaceBetween: 20,
        loop: true,
        navigation: {
            nextEl: ".slide-next",
            prevEl: ".slide-prev",
        },
        breakpoints: {
            // when window width is >= 480px
            480: {
                slidesPerView: 1.4,
                spaceBetween: 20,
                centeredSlides: true
            },
            // when window width is >= 640px
            640: {
                slidesPerView: 1.8,
                spaceBetween: 20,
                centeredSlides: true
            },
            // when window width is >= 992px
            992: {
                slidesPerView: 1.8,
                spaceBetween: 20,
                centeredSlides: true
            },
            // when window width is >= 1320px
            1200: {
                slidesPerView: 2.8,
                spaceBetween: 20,
                centeredSlides: false
            },
        }

    });



    // place category filter
    filterSelection("all");    

    $('.cate-filter-btns li button').on('click', function(){
        var filterName = $(this).data('filter');
        console.log(filterName);
        filterSelection(filterName);
    });

    function filterSelection(cate) {
        var item = document.getElementsByClassName("list-item");
              
        for (var i = 0; i < item.length; i++) {
            if (cate == "all") {
                item[i].style.display = "block";
            } else if (item[i].dataset.cate == cate) {
                item[i].style.display = "block";
            } else {
                item[i].style.display = "none";
            }
        }
    }





});