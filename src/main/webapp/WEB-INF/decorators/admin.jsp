<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><sitemesh:write property="title"/></title>
	<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css">
<link href="/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
<link href="/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
<link href="/global/plugins/jqvmap/jqvmap/jqvmap.css" rel="stylesheet" type="text/css">
<link href="/global/plugins/morris/morris.css" rel="stylesheet" type="text/css">
<!-- END PAGE LEVEL PLUGIN STYLES -->
<!-- BEGIN PAGE STYLES -->
<link href="/global/plugins/bootstrap-toastr/toastr.min.css" rel="stylesheet" type="text/css"/>
<link href="/admin1/pages/css/tasks.css" rel="stylesheet" type="text/css"/>
<!-- END PAGE STYLES -->
<!-- BEGIN THEME STYLES -->
<!-- DOC: To use 'rounded corners' style just load 'components-rounded.css' stylesheet instead of 'components.css' in the below style tag -->
<link href="/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css">
<link href="/global/css/plugins.css" rel="stylesheet" type="text/css">
<link href="/admin1/layout3/css/layout.css" rel="stylesheet" type="text/css">
<link href="/admin1/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="/admin1/layout3/css/custom.css" rel="stylesheet" type="text/css">
<link href="/admin1/style.css" rel="stylesheet" type="text/css">
<!-- END THEME STYLES -->
<!-- FullCalendar CSS -->
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.5/main.min.css" rel="stylesheet">
    <!-- Plugin CSS -->
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.5/timegrid.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.5/daygrid.min.css" rel="stylesheet">

</head>
<body>
    <%@include file="/common/admin/header.jsp"%>
    
	<div class="page-container">
		<sitemesh:write property="body" />
	</div>
	
	<%@include file="/common/admin/footer.jsp"%>
	
	<!-- BEGIN JAVASCRIPTS (Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="/global/plugins/respond.min.js"></script>
<script src="/global/plugins/excanvas.min.js"></script> 
<![endif]-->
<script src="/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="/global/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
<script src="/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="/global/plugins/jqvmap/jqvmap/jquery.vmap.js" type="text/javascript"></script>
<script src="/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.russia.js" type="text/javascript"></script>
<script src="/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.world.js" type="text/javascript"></script>
<script src="/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.europe.js" type="text/javascript"></script>
<script src="/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.germany.js" type="text/javascript"></script>
<script src="/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.usa.js" type="text/javascript"></script>
<script src="/global/plugins/jqvmap/jqvmap/data/jquery.vmap.sampledata.js" type="text/javascript"></script>
<!-- IMPORTANT! fullcalendar depends on jquery-ui-1.10.3.custom.min.js for drag & drop support -->
<script src="/global/plugins/morris/morris.min.js" type="text/javascript"></script>
<script src="/global/plugins/morris/raphael-min.js" type="text/javascript"></script>
<script src="/global/plugins/jquery.sparkline.min.js" type="text/javascript"></script>
<script src="/global/plugins/bootstrap-toastr/toastr.min.js"></script>
<script src="/admin/pages/scripts/ui-toastr.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="/global/scripts/metronic.js" type="text/javascript"></script>
<script src="/admin1/layout3/scripts/layout.js" type="text/javascript"></script>
<script src="/admin1/layout3/scripts/demo.js" type="text/javascript"></script>
<script src="/admin1/pages/scripts/index3.js" type="text/javascript"></script>
<script src="/admin1/pages/scripts/tasks.js" type="text/javascript"></script>

<!-- END PAGE LEVEL SCRIPTS -->
<!-- FullCalendar JS -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.5/main.min.js"></script>
    <!-- Plugin JS -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.5/timegrid.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.5/daygrid.min.js"></script>

<script src="/admin1/layout/scripts/quick-sidebar.js" type="text/javascript"></script>
<script src="/admin1/pages/scripts/table-managed.js"></script>
<script>
jQuery(document).ready(function() {    
   Metronic.init(); // init metronic core componets
   Layout.init(); // init layout
   Demo.init(); // init demo(theme settings page)
   UIToastr.init();
   Index.init(); // init index page
   Tasks.initDashboardWidget(); // init tash dashboard widget
   TableManaged.init();
});
</script>
<!-- END JAVASCRIPTS -->
</body>
</html>