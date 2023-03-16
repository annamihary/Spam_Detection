
 <%@ include file="../Head.jsp" %>


  <!-- Content Wrapper. Contains page content -->
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
              <li class="breadcrumb-item"><a href="">Fournisseur</a></li>
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
                <h3 class="card-title">Ajouter un fournisseur</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form id ="ajout" method="post" action="addFournisseur" role="form" onsubmit="return verifFrs()">
                <div class="card-body">
                  <div class="form-group">
                  <input type="hidden" id="option" name="option" value="add">
                    <label for="codeFrs">Code Fournisseur :</label>
                    <input type="text" id="codeFrs" name="codeFrs" value="${ nextFour }" class="form-control" placeholder="Code Fournisseur" required>
                  	<small id="v-codeFrs" class="ml-2 form-text text-danger"></small>
                  </div>
                  <div class="form-group">
                    <label for="nom">Nom Fournisseur : </label>
                    <input type="text" name="nom" value="" class="form-control" id="nom" placeholder="Nom Fournisseur " required>
                  </div>
                  <div class="form-group">
                    <label for="adr">Adresse </label>
                    <input type="text" name="adr" value="" class="form-control" id="adr" placeholder="Adresse Fournisseur " required>
                  </div>
                 
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Ajouter</button>
                  <a href="listFournisseur" class="btn btn-default">Annuler</a>
                </div>
              </form>
              </c:if>
              
              <c:if test="${ option == 'modif' }">
              <div class="card-header">
                <h3 class="card-title">Ajouter un FRS</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form method="post" action="updateFournisseur" role="form">
                <div class="card-body">
                  <div class="form-group">
                 <input type="hidden" id="option" name="option" value="update" />
                    <label for="codeFrs">Code Fournisseur :</label>
                    <input type="text" id="codeFrs" name="codeFrs" value="${ codeFrs }" class="form-control" placeholder="Code Fournisseur" required >
                  </div>
                  <div class="form-group">
                    <label for="nom">Nom Fournisseur : </label>
                    <input type="text" name="nom" value="${ nom }" class="form-control" id="nom" placeholder="Nom Fournisseur " required>
                  </div>
                  <div class="form-group">
                    <label for="adr">Adresse </label>
                    <input type="text" name="adr" value="${ adr }" class="form-control" id="adr" placeholder="Adresse Fournisseur " required>
                  </div>
                 
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Modifier</button>
                  <a href="listFournisseur" class="btn btn-default">Annuler</a>
                </div>
              </form>
              </c:if>
              
            </div>
           </div>
          </div>
         </div>
        </section>
       </div>
            <!-- /.card -->

 	<script>
		  function verifFrs(){
				var codeFrs = document.getElementById("codeFrs").value;
				if(codeFrs==""){
					document.getElementById("v-codeFrs").innerText="Veuillez renseigner ce champ!";
					return false;
				} else {
					var option = document.getElementById("option").value;
					if(option=="add"){
						<c:forEach var="frs" items="${fournisseur}">
				       	if(codeFrs == "${frs.getCodeFrs()}"){
  								document.getElementById("v-codeFrs").innerText="Ce code existe déjà";     			
				       		return false;
				       	}
				    	</c:forEach>
					}
				}
		     	
		     	return true;
			}
	  </script> 
<%@ include file="../Foot.jsp" %>

