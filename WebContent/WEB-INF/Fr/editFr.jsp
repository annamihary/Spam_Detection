<%@ include file="../Head.jsp" %>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1></h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="">Produit</a></li>
              <li class="breadcrumb-item active">Ajout</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md">
            <!-- general form elements -->
            <div class="card card-primary">
            <c:if test="${option == 'ajout' }">
              <div class="card-header">
                <h3 class="card-title">Ajouter un produit</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form id ="ajout" method="post" action="addlignefr" role="form">
                <div class="card-body">
                  <div class="form-group">
                  <input type="hidden" name="option" value="add">
                  <input type="hidden" id="idFournir" name="idFournir" value="${ idFournir }" required>
                  </div>
               
					
					 <label for="" class="control-label"> Designation: </label>
					<div class="form-group" >
						<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						<select name="codePro" class="form-control ">
							<c:forEach var="pro" items="${produits}">
								<option value="${ pro.getCodePro() }">${ pro.getDesign() }</option>
							</c:forEach>
						</select>
					</div>
                  
                   <div class="form-group">
                    <label for="qteAppro">Quantite </label>
                    <input type="number" min="0" name="qteAppro" value="" class="form-control" id="qteAppro" placeholder="qteAppro" required>
                  </div>
                 
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Ajouter</button>
                  <c:if test="${ retour=='0' }">
                  	<a href="listFournir" class="ml-1 btn btn-default">Annuler</a>
                  </c:if>
                  <c:if test="${ retour=='1' }">
                  	<a href="lignefr?id=${idFournir}" class="ml-1 btn btn-default">Annuler</a>
                  </c:if>
                </div>
              </form>
              </c:if>



<c:if  test="${ option == 'modif' }">
              <div class="card-header">
                <h3 class="card-title">Modifier un produit </h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form method="post" action="updatelignefr" role="form">
                <div class="card-body">
                  <div class="form-group">
                 <input type="hidden" name="option" value="update" />
                 <input type="hidden" name="idLignefr" value="${ idLignefr }" />
                    <input type="hidden" id="idFournir" name="idFournir" value="${ idFournir }" required >
                  </div>
                  <label for="" class="control-label"> Designation: </label>
					<div class="form-group" >
						<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> 
						<select name="codePro" class="form-control ">
							<c:forEach var="pro" items="${produits}">
								<c:if test="${ pro.getCodePro()!=codePro }">
									<option value="${ pro.getCodePro() }">${ pro.getDesign() }</option>
								</c:if>
								<c:if test="${ pro.getCodePro()==codePro }">
									<option value="${ pro.getCodePro() }" selected="selected">${ pro.getDesign() }</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
                 
                  <div class="form-group">
                    <label for="">Quantite</label>
                  <input type="number" min="0" id="qteAppro_edit" name="qteAppro" value="${ qteAppro }" class="form-control " placeholder="Quantité" required/>
				  <input type="hidden" id="qteAppro_init" name="qte_init" value="${ qteAppro }"/> <!-- Pour récupérer la qte avant la modification-->
					
                  </div>
                 
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Modifier</button>
                  <a href="lignefr?id=${ idFournir }" class="ml-1 btn btn-default">Annuler</a>
                </div>
              </form>
              </c:if>
               </div>
           </div>
          </div>
         </div>
        </section>
       </div>
       
       <script type="text/javascript">
	function verifStockAdd(){
		var codePro = document.getElementById("codePro_add").value;
		var qteAppro = document.getElementById("qteAppro_add").value;
		
		if(parseInt(qteAppro)<0) {
			alert("Le stock est invalide!");   
			return false;
		}
		
       	<c:forEach var="produit" items="${produits}">
       		if(codePro=="${produit.getCodePro()}"){
       			if(parseInt(qte)>parseInt("${produit.getStock()}")){
	       			alert("Le stock est insuffisant pour cette action!");     			
	       			return false;
       			}
       		}
       	</c:forEach>
       	return true;
	}
	
	function verifStockEdit(){
		var codePro = document.getElementById("codePro_edit").value;
		var qteAppro = document.getElementById("qteAppro_edit").value;
		var qteAppro_init = document.getElementById("qteAppro_init").value;
		
		if(parseInt(qteAppro)<0) {
			alert("Le stock est invalide!");   
			return false;
		}
		
       	<c:forEach var="produit" items="${produits}">
       		if(codePro=="${produit.getCodePro()}"){
       			if(parseInt(qteAppro)>parseInt(qteAppro_init)){
	       			if((parseInt(qteAppro)-parseInt(qteAppro_init)) > parseInt("${produit.getStock()}")){
		       			alert("Le stock est insuffisant pour cette action!");     			
		       			return false;
	       			}
       			}
       		}
       	</c:forEach>
       	return true;
	}
</script>
<%@ include file="../Foot.jsp" %>

