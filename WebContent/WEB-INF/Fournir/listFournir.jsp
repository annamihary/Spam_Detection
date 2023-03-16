<%@ include file="../Head.jsp" %>
 <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid"> 
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1> Liste des approvisionnements </h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Accueil</a></li>
              <li class="breadcrumb-item active">Fournir</li>
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
                		<h3 class="card-title"><a href= "ajoutFournir" class="btn btn-dark">Ajouter un approvisionnement </a></h3>
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
                <table id="list" class="table table-hover table-bordered">
                  <tr>
                    <th>ID</th>
                    <th>Code Fournisseur</th>
                    <th>Nom Fournisseur</th>
                    <th>Date</th>
                    <th colspan="2" class="text-center">Produits</th>
                   <th>Modification</th>
                    <th>Suppression</th>
                  </tr>
                  <c:forEach items="${ fournir }" var="fr">
                  <tr>
                  	 <td> ${fr.getIdFournir()}</td>
                     <td class="search_by_id"> ${fr.getCodeFrs()}</td>
                     <td class="search_by_name"> ${fr.getNom()} </td>
                     <td> ${fr.getDateAppro()}</td>
                     <td> 
		                <form method="post" action="ajoutlignefr">
				    		<input type="hidden" name="idFournir" value="${fr.getIdFournir()}"/>
				    		<input type="hidden" name="retour" value="0"/>
				    		<input type="submit" value=" Ajouter " class="btn btn-success"/>
				    	</form>
					 </td>
                     <td> <a href="lignefr?id=${ fr.getIdFournir() }" class="btn btn-warning">Liste</a> </td>
                     <td>
					<form method="post" action="modifFournir">
					    <input type="hidden" name="option" value="modif"/>
						<input type="hidden" name="idFournir" value="${ fr.getIdFournir() }"/>
						<input type="submit" value="Modifier" class="btn btn-primary"/>
					</form>
					</td>
					<td>
					<form method="post" action="suppFournir" onsubmit="return confirm('Voulez-vous supprimer vraiment ce produit?')">
					    <input type="hidden" name="idFournir" value="${ fr.getIdFournir() }"/>
						<input type="submit" value="Supprimer" class="btn btn-danger"/>
					</form>
					</td>
                  </tr>
                  
                  </c:forEach>
              
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
