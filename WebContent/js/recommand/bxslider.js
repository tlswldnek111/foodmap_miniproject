 $(function(){
            var div = $('#target>div').bxSlider({
                minSlides:1,
                maxSlides:1,
                moveSlides:1,
                slideWidth:600,
                pager:false,
                controls:false,
                auto:false
                
                // auto:true
            });
            $('#target>ul img').height(130);
            $('#target>ul').bxSlider({
                minSlides:2,
                maxSlides:3,
                moveSlides:1,
                slideWidth:200,
                auto:true,
                pager:false,
                nextText: '>',
                prevText: '<',
                onSliderLoad:function(a){
                    div.goToSlide(a)
                },
                onSlideNext:function(a,b,c){
                    div.goToSlide(c);
                },
                onSlidePrev:function(a,b,c){
                    div.goToSlide(c);
                }
            });
        });