 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html>
<html>
<!-- HEAD START -->
<head>
	<meta charset="UTF-8">
	<title><sitemesh:write property="title"/></title>
	<link rel="shortcut icon" href="favicon.ico">
	<!-- Fonts START -->
  <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css">
  <!-- Fonts END -->

  <!-- Global styles START -->          
  <link href="/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Global styles END --> 
   
  <!-- Page level plugin styles START -->
  <link href="/global/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
  <link href="/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.css" rel="stylesheet">
  <link href="/global/plugins/slider-revolution-slider/rs-plugin/css/settings.css" rel="stylesheet">
  <link href="/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
  <link href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css">
  <link href="/global/plugins/rateit/src/rateit.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin styles END -->

	<!-- Page level plugin styles -->
  <link href="/frontend/pages/css/style-shop.css" rel="stylesheet" type="text/css">

  <!-- Theme styles START -->
  <link href="/global/css/components.css" rel="stylesheet">
  <link href="/frontend/layout/css/style.css" rel="stylesheet">
  <link href="/frontend/pages/css/style-shop.css" rel="stylesheet" type="text/css">
  <link href="/frontend/pages/css/style-revolution-slider.css" rel="stylesheet"><!-- metronic revo slider styles -->
  <link href="/frontend/layout/css/style-responsive.css" rel="stylesheet">
  <link href="/frontend/layout/css/themes/red.css" rel="stylesheet" id="style-color">
  <link href="/frontend/layout/css/custom.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
  <!-- Theme styles END -->
  

<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="/global/plugins/clockface/css/clockface.css"/>
<link rel="stylesheet" type="text/css" href="/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
<link rel="stylesheet" type="text/css" href="/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css"/>
<link rel="stylesheet" type="text/css" href="/global/plugins/bootstrap-colorpicker/css/colorpicker.css"/>
<link rel="stylesheet" type="text/css" href="/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css"/>
<link rel="stylesheet" type="text/css" href="/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css">
<link href="/global/css/plugins.css" rel="stylesheet" type="text/css">
<link href="/admin/layout3/css/layout.css" rel="stylesheet" type="text/css">
<link href="/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="/admin/layout3/css/custom.css" rel="stylesheet" type="text/css">
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico"/>

</head>
<!-- Head END -->
<body class="ecommerce">
	
    <%@include file="/common/header.jsp"%>
    
	<sitemesh:write property="body" />
	
	<div>
		<%@include file="/common/footer.jsp"%>
	</div>

<script src="/frontend/pages/scripts/checkout.js" type="text/javascript"></script>	
<script src="/frontend/layout/scripts/back-to-top.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script><!-- for slider-range -->
<script src="/frontend/layout/scripts/layout.js" type="text/javascript"></script>
	
<script src="/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<script src="/global/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
<script src="/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>

<!-- Load các plugin cần thiết -->
<script src="/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
<script src="/global/plugins/clockface/js/clockface.js"></script>
<script src="/global/plugins/bootstrap-daterangepicker/moment.min.js"></script>
<script src="/global/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="/global/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
<script src="/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>

<!-- Metronic và các script liên quan -->
<script src="/global/scripts/metronic.js" type="text/javascript"></script>
<script src="/admin/layout3/scripts/layout.js" type="text/javascript"></script>
<script src="/admin/layout3/scripts/demo.js" type="text/javascript"></script>
<script src="/admin/pages/scripts/components-pickers.js"></script>

<!-- Các script khác -->
<script src="/global/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script>
<script src="/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
<script src="/global/plugins/zoom/jquery.zoom.min.js" type="text/javascript"></script>
<script src="/global/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script>
<script src="/global/plugins/rateit/src/jquery.rateit.js" type="text/javascript"></script>





<!-- Khởi tạo -->
<script>
    jQuery(document).ready(function () {
        Metronic.init(); 
        Layout.init(); 
        Demo.init(); 
        ComponentsPickers.init(); 
        Layout.initOWL(); 
        Layout.initTwitter();
        Layout.initImageZoom(); 
        Layout.initTouchspin(); 
        Layout.initUniform(); 
        Layout.initSliderRange(); 
    });
    // Khi người dùng thay đổi giá trị, kiểm tra và loại bỏ ".0" nếu có
    document.addEventListener('input', function(e) {
        if (e.target.id === 'minPrice' || e.target.id === 'maxPrice') {
            var value = e.target.value;
            
            // Chuyển đổi thành số nguyên nếu có phần thập phân là 0
            if (value.indexOf('.') !== -1 && value.split('.')[1] === '0') {
                e.target.value = value.split('.')[0];
            }
        }
    });

    // Đảm bảo hiển thị giá trị mà không có phần ".0"
    function formatValue(value) {
        // Nếu giá trị là một số nguyên, chỉ hiển thị số nguyên
        if (value.indexOf('.') !== -1 && value.split('.')[1] === '0') {
            return value.split('.')[0];
        }
        return value;
    }

    // Chỉnh sửa các giá trị khi tải trang hoặc khi giá trị thay đổi
    window.onload = function() {
        var minPriceInput = document.getElementById('minPrice');
        var maxPriceInput = document.getElementById('maxPrice');
        
        // Làm tròn và loại bỏ phần ".0" trong giá trị nhập ban đầu
        minPriceInput.value = formatValue(minPriceInput.value);
        maxPriceInput.value = formatValue(maxPriceInput.value);
    };

function updateQuantity(cartItemId, newQuantity) {
    fetch('cart/updateQuantity', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            cartItemId: cartItemId,
            quantity: newQuantity
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
           //alert('Quantity updated successfully!');
            // Optionally, update the total price dynamically
            location.reload(); // Reload to reflect new total
        } else {
            alert('Failed to update quantity: ' + data.message);
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Something went wrong! Please try again.');
    });
}

document.addEventListener('DOMContentLoaded', function () {
    console.log("DOM fully loaded and parsed");
});

</script>


</body>
</html>