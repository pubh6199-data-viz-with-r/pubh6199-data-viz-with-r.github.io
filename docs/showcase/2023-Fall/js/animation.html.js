(function($) {
    $(document).ready(function() {
	
	$('#animation_html').scianimator({
	    'images': ['images/animation.html1.png', 'images/animation.html2.png', 'images/animation.html3.png', 'images/animation.html4.png', 'images/animation.html5.png', 'images/animation.html6.png', 'images/animation.html7.png', 'images/animation.html8.png', 'images/animation.html9.png', 'images/animation.html10.png', 'images/animation.html11.png', 'images/animation.html12.png'],
	    'width': 800,
	    'delay': 500,
	    'loopMode': 'loop'
	});
	$('#animation_html').scianimator('play');
    });
})(jQuery);
