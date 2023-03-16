<footer class="main-footer">
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->

<script src="<c:url value="style/plugins/jquery/jquery.min.js" />"></script>
<script src="<c:url value="style/plugins/bootstrap/js/bootstrap.bundle.min.js" />"></script>
<script src="<c:url value="style/plugins/slimScroll/jquery.slimscroll.min.js" />"></script>
<script src="<c:url value="style/plugins/fastclick/fastclick.js" />"></script>
<script src="<c:url value="style/dist/js/adminlte.min.js" />"></script>
<script src="<c:url value="style/dist/js/demo.js" />"></script>
<script src="<c:url value="style/jquery.quicksearch.js" />"></script>
<script>

	quicksearch('');
	
	function quicksearch (selector) {
		if(selector == '') {
			$('input#table_search').quicksearch('table#list tr:not(:first)', {
				'loader': 'span.loading',
				'noResults': 'tr#noresults'
			});
		} else {
			$('input#table_search').quicksearch('table#list tr:not(:first)', {
				'selector' : selector,
				'loader': 'span.loading',
				'noResults': 'tr#noresults'
			});
		}
		
	}
	
	
	$(document).on("click", "input[type='radio']", function(e) {
        var checked = $(this).attr("checked");
        if(!checked){
            $(this).attr("checked", true);
            if($('#by_id')){
            	if($('#by_id').is(':checked')){
            		quicksearch('td.search_by_id');
            	} else if($('#by_name').is(':checked')){
            		quicksearch('td.search_by_name');
            	}
            }
        } else {
        	$(this).removeAttr("checked");
            $(this).prop("checked", false);
            quicksearch('');
        }
    });

</script>
<!-- Bootstrap 4 -->

<!-- Slimscroll -->

<!-- FastClick -->

<!-- AdminLTE App -->

<!-- AdminLTE for demo purposes -->

</body>
</html>
