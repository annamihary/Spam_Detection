<%@ include file="WEB-INF/Head.jsp" %>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header"  id="01">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1> Chiffre d'affaires par fournisseur </h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Acceuil</a></li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
           <div class="col-12">
            <div class="card">
              <div class="card-header">
               <form method="post" action="#01">
               <div class="row">
               	<div class="col-2">
               		<div class="form-group">
						<label for="annee_cf"> Année </label>
	               		<select id="annee_cf" name="annee_cf" class="form-control form-control-sm">
	               		<option value=""> Tous </option>
							<c:forEach var="annee" items="${annees}">
								<option value="${ annee }">${ annee }</option>
							</c:forEach>
						</select>
					</div>
               	</div>
               	<div class="col">
					<button type="submit" class="btn btn-dark btn-sm float-right" style="margin-top:35px">Rechercher</button> 
                </div>               
                </div>
				</form>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover">
                  <c:set var="total_ca" value="${0}" />
                  <tr>
                    <th>Code fournisseur</th>
                    <th>Nom fournisseur </th>
                    <th>Chiffre d'affaires(Ar)</th>
                  </tr>
                  <c:forEach items="${ chiffres }" var="c">
                  <tr>
                  	 <td>${ c.getCodeFrs() }</td>
                     <td>${ c.getNom() }</td>
                     <td>${ c.getChiffre() }</td>
                     <c:set var="total_ca" value="${total_ca + c.getChiffre() }" />
                  </tr>
                  </c:forEach>
                  <tr>
                  	<td></td>
                  	<td><b> TOTAL </b></td>
                  	<td> ${total_ca} </td>
                  </tr>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
    
    <hr />
    
    <section class="content-header"  id="02">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1> Liste de produits fournis </h1>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
           <div class="col-12">
            <div class="card">
              <div class="card-header">
               <form method="post" action="#02">
               <div class="row">
               	<div class="col-2 mr-4">
               		<div class="form-group">
	                    <label for="codeFrs"> Fournisseur </label>
	               		<select id="codeFrs" name="codeFrs" class="form-control form-control-sm">
	               		<option value=""> Tous </option>
						<c:forEach var="frs" items="${fournisseurs}">
							<option value="${ frs.getCodeFrs() }">${ frs.getNom() }</option>
						</c:forEach>
						</select>
					</div>
               	</div>   
               	<div class="col-2">
               		<div class="form-group">
	               		<div class="form-check" style="margin-bottom:0.5rem">
	                      <input name="option" class="form-check-input" type="radio" value="1" ${selected_annee != null ? 'checked' : '' }>
	                      <label class="form-check-label">Année</label>
	                    </div>
	               		<select id="annee" name="annee" class="form-control form-control-sm">
							<c:forEach var="annee" items="${annees}">
								<option value="${ annee }">${ annee }</option>
							</c:forEach>
						</select>
					</div>
               	</div>
                <div class="col-2">
               		<div class="form-group">
               			<div class="form-check" style="margin-bottom:0.5rem">
	                      <input name="option" class="form-check-input" type="radio" value="2" ${selected_mois != null ? 'checked' : '' }>
	                      <label class="form-check-label">Mois</label>
	                    </div>
	               		<select id="mois" name="mois" class="form-control form-control-sm">
							<option value="01">Janvier</option>
							<option value="02">Février</option>
							<option value="03">Mars</option>
							<option value="04">Avril</option>
							<option value="05">Mai</option>
							<option value="06">Juin</option>
							<option value="07">Juillet</option>
							<option value="08">Août</option>
							<option value="09">Septembre</option>
							<option value="10">Octobre</option>
							<option value="11">Novembre</option>
							<option value="12">Décembre</option>
						</select>
					</div>
               	</div>
               	<div class="col-4">
               		<div class="form-group">
               			<div class="form-check" style="margin-bottom:0.5rem">
	                      <input name="option" class="form-check-input" type="radio" value="3" ${ (selected_db != null && selected_df != null ) ? 'checked' : '' }>
	                      <label class="form-check-label"> Entre 2 dates </label>
	                    </div>
	               		<div class="input-group input-group-sm">
	               			<input type="date" name="date_debut" class="form-control" id="date_debut" placeholder=" Date début ">&nbsp - &nbsp 
	               			<input type="date" name="date_fin" class="form-control" id="date_fin" placeholder=" Date fin ">
	               		</div>
	               	</div>
               	</div>
               	<div class="col">
					<button type="submit" class="btn btn-dark btn-sm float-right" style="margin-top:35px">Rechercher</button> 
                </div>               
                </div>
				</form>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover">
                  <c:set var="total" value="${0}" />
                  <tr>
                    <th>Produit</th>
                    <th>Prix unitaire(Ar)</th>
                    <th>Quantité</th>
                    <th>Montant(Ar)</th>
                  </tr>
                  <c:forEach items="${ lignfrs }" var="fr">
                  <c:set var="montant" value="${fr.getQteAppro() * fr.getPu()}" />
                  <tr>
                  	 <td> ${fr.getDesign()}</td>
                     <td> ${fr.getPu()}</td>
                     <td> ${fr.getQteAppro()} </td>
                     <td> ${montant}</td>
                     <c:set var="total" value="${total + montant}" />
                  </tr>
                  </c:forEach>
                  <tr>
                  	<td></td>
                  	<td></td>
                  	<td><b> TOTAL </b></td>
                  	<td> ${total} </td>
                  </tr>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
    
</div>
  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Add Content Here -->
  </aside>
</div>
  <!-- jQuery -->
  <script src="<c:url value="style/plugins/jquery/jquery.min.js" />" type="text/javascript"></script>
 <script src="<c:url value="style/plugins/bootstrap/js/bootstrap.bundle.min.js" />" type="text/javascript"></script>
  <script src="<c:url value="style/plugins/chartjs-old/Chart.min.js" />" type="text/javascript"></script>
   <script src="<c:url value="style/plugins/fastclick/fastclick.js" />" type="text/javascript"></script>
   <script src="<c:url value="style/dist/js/adminlte.min.js" />" type="text/javascript"></script>
   <script src="<c:url value="style/dist/js/demo.js" />" type="text/javascript"></script>
   
   <script type="text/javascript"> //date aujourd'hui
   
   		var selected_annee_cf = "${ selected_annee_cf }", selected_cf = "${ selected_cf }", selected_annee = "${ selected_annee }", selected_mois = "${ selected_mois }",
   		selected_db = "${ selected_db }", selected_df = "${ selected_df }";
   		
   		if(selected_annee_cf != "") $('#annee_cf option[value='+selected_annee_cf+']').attr('selected','selected');
   		if(selected_cf != "") $('#codeFrs option[value='+selected_cf+']').attr('selected','selected');
   		if(selected_annee != "") $('#annee option[value='+selected_annee+']').attr('selected','selected');
   		if(selected_mois != "") $('#mois option[value='+selected_mois+']').attr('selected','selected');
   		
   		if(selected_db != "" && selected_df != "" ) {
   			$('#date_debut').val(selected_db);
   			$('#date_fin').val(selected_df);
   		} else {
   			var today= new Date();
   			$('#date_debut').val(today.toISOString().substr(0,10));
   			$('#date_fin').val(today.toISOString().substr(0,10));
   		}
   		
	</script>
<!-- page script -->

<%@ include file="WEB-INF/Foot.jsp" %>