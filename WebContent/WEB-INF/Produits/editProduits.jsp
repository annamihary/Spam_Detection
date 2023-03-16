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
            <c:if test="${option == 'ajout'}">
              <div class="card-header">
                <h3 class="card-title">Ajouter un Produit</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form id ="ajout" method="post" action="addProduits" role="form" onsubmit="return verifPro()">
                <div class="card-body">
                  <div class="form-group">
                  	<input type="hidden" id="option" name="option" value="add">
                    <label for="codePro">Code Produit :</label>
                    <input type="text" id="codePro" name="codePro" value="${ nextPro }" class="form-control" placeholder="Code Produit" required >
                    <small id="v-codePro" class="ml-2 form-text text-danger"></small>
                  </div>
                  <div class="form-group">
                    <label for="design">Désignation: </label>
                    <input type="text" name="design" value="" class="form-control" id="design" placeholder=" Designation " required>
                  </div>
                  <div class="form-group">
                    <label for="pu">Prix unitaire(Ar)</label>
                    <input type="number" min="0" name="pu" value="" class="form-control" id="pu" placeholder="Prix unitaire " required>
                  </div>
                   <div class="form-group">
                    <label for="stock">Stock(kg) </label>
                    <input type="number" min="0" name="stock" value="" class="form-control" id="stock" placeholder="Stock " required>
                  </div>
                 
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Ajouter</button>
                  <a href="listProduits" class="btn btn-default">Annuler</a>
                </div>
              </form>
              </c:if>



	<c:if  test="${ option == 'modif' }">
              <div class="card-header">
                <h3 class="card-title">Modifier un Produit</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form method="post" action="updateProduits" role="form">
                <div class="card-body">
                  <div class="form-group">
                 <input type="hidden" id="option" name="option" value="update" />
                    <label for="codePro">Code Produit :</label>
                    <input type="text" id="codePro" name="codePro" value="${ codePro }" class="form-control" placeholder="Code Produit" required readonly>
                  </div>
                  <div class="form-group">
                    <label for="design">Désignation : </label>
                    <input type="text" name="design" value="${ design }" class="form-control" id="design" placeholder="Designation " required>
                  </div>
                  <div class="form-group">
                    <label for="pu">Prix unitaire  </label>
                    <input type="number" min="0" name="pu" value="${ pu }" class="form-control" id="pu" placeholder="Prix unitaire  " required>
                  </div>
                  <div class="form-group">
                    <label for="stock">Stock </label>
                    <input  type="number" min="0" name="stock" value="${ stock }" class="form-control" id="stock" placeholder="stock " required>
                  </div>
                 
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Modifier</button>
                  <a href="listProduits" class="btn btn-default">Annuler</a>
                </div>
              </form>
              </c:if>
               </div>
           </div>
          </div>
         </div>
        </section>
       </div>
	  <script>
		  function verifPro(){
				var codePro = document.getElementById("codePro").value;
				if(codePro==""){
					document.getElementById("v-codePro").innerText="Veuillez renseigner ce champ!";
					return false;
				} else {
					var option = document.getElementById("option").value;
					if(option=="add"){
						<c:forEach var="pro" items="${produits}">
				       	if(codePro == "${pro.getCodePro()}"){
  								document.getElementById("v-codePro").innerText="Ce code existe déjà";     			
				       		return false;
				       	}
				    	</c:forEach>
					}
				}
		     	
		     	return true;
			}
	  </script>       
<%@ include file="../Foot.jsp" %>

