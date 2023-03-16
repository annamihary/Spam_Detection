<%@ include file="../Head.jsp" %>
 <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid"> 
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1> Liste des produits fournis par ${ nom } </h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="">Accueil</a></li>
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
                		<form method="post" action="ajoutlignefr">
			                <h3 class="card-title">
					    		<input type="hidden" name="idFournir" value="${ idFournir }"/>
					    		<input type="hidden" name="retour" value="1"/>
					    		<input type="submit" value=" Ajouter un produit " class="btn btn-success"/>
			                </h3>
                		</form>
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
                    <th>ID Appro</th>
                    <th class="search_by_id">Code Produit</th>
                    <th class="search_by_name">Désignation</th>
                    <th>Quantité</th>
					<th><div class="glyphicon glyphicon-cog fa-spin"></div> Modification</th>
					<th><div class="glyphicon glyphicon-cog fa-spin"></div> Suppression</th>
                  </tr>
                  <c:forEach items="${ lignefrs }" var="frir">
                  <tr>
                     <td> ${frir.getIdFournir()}</td>
                     <td> ${frir.getCodePro()}</td>
                     <td> ${frir.getDesign()}</td>
                     <td> ${frir.getQteAppro()}</td>
					<td>
					<form method="post" action="modiflignefr">
					    <input type="hidden" name="option" value="modif"/>
						<input type="hidden" name="idLignefr" value="${ frir.getIdLignefr() }"/>
						<input type="submit" value="Modifier" class="btn btn-primary"/>
					</form>
					</td>
					<td>
					<form method="post" action="supplignefr" onsubmit="return confirm('Voulez-vous supprimer vraiment ce produit?')">
					    <input type="hidden" name="idLignefr" value="${ frir.getIdLignefr() }"/>
					    <input  type="hidden" name="idFournir" value="${ frir.getIdFournir() }"/>
					    <input  type="hidden" name="codePro" value="${ frir.getCodePro() }"/>
					    <input  type="hidden" name="qteAppro" value="${ frir.getQteAppro() }"/>
						<input type="submit" value="Supprimer" class="btn btn-danger"/>
					</form>
					</td>
                  </tr>
                  
                  </c:forEach>
              
                </table>
                <a href="listFournir" class="m-3 btn btn-warning"> Retour </a>
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
