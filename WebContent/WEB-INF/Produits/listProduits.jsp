<%@ include file="../Head.jsp" %>
 <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid"> 
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1> Liste des produits </h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Accueil</a></li>
              <li class="breadcrumb-item active">Produits</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- /.row -->
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <div class="row">
                	<div class="col-2">
                		<h3 class="card-title"><a href= "ajoutProduits" class="btn btn-dark">Ajouter un produit </a></h3>
                	</div>
                	<div class="col"></div>
                	<div class="col-2">
                		<div class="form-check"  style="margin-top:0.5rem">
	                      <input id="by_id" name="option" class="form-check-input" type="radio" value="1">
	                      <label class="form-check-label">Recherche par code</label>
	                    </div>
                	</div>
                	<div class="col-2">
                		<div class="form-check"  style="margin-top:0.5rem">
	                      <input id="by_name" name="option" class="form-check-input" type="radio" value="1">
	                      <label class="form-check-label">Recherche par nom</label>
	                    </div>
                	</div>
                	<div class="input-group input-group-sm col">
                		<input type="text" id="table_search" name="table_search" class="form-control float-right" placeholder="Rechercher">
	                    <div class="input-group-append">
	                      <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
	                    </div>
                	</div>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table id="list" class="table table-hover">
                  <tr>
                    <th>Code produits</th>
                    <th>Designation</th>
                    <th>Prix unitaire(Ar)</th>
                    <th>Stock(kg)</th>
                     <th>Modification</th>
                      <th>Suppression</th>
                  </tr>
                  <c:forEach items="${ produits }" var="pro">
                  <tr>
                     <td class="search_by_id"> ${pro.getCodePro()}</td>
                     <td class="search_by_name"> ${pro.getDesign()}</td>
                     <td>${pro.getPu()}</td>
                     <td>${pro.getStock()}</td>
                     <td>
					<form method="post" action="modifProduits">
					    <input type="hidden" name="option" value="modif"/>
						<input type="hidden" name="codePro" value="${ pro.getCodePro() }"/>
						<input type="submit" value="Modifier" class="btn btn-primary"/>
					</form>
					</td>
					<td>
					<form method="post" action="suppProduits" onsubmit="return confirm('Voulez-vous supprimer vraiment ce produit?')">
						<input type="hidden" name="codePro" value="${ pro.getCodePro() }"/>
						<input type="submit" value="Supprimer" class="btn btn-danger"/>
					</form>
					</td>
                  </tr>
                  
                  </c:forEach>
              	  <tr id="noresults" class="text-center">
                    <td colspan="6">Aucun résultat</td>
                  </tr>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
<%@ include file="../Foot.jsp" %>
