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
              <li class="breadcrumb-item"><a href="">Approvisionnement</a></li>
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
                <h3 class="card-title">Ajouter un approvisionnement</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form id ="ajout" method="post" action="addFournir" role="form">
                <div class="card-body">
                  <div class="form-group">
                  <input type="hidden" name="option" value="add">
                    <label for="codeFrs">Nom Fournisseur :</label>
                   	<select name="codeFrs" class="form-control ">
						<c:forEach var="frs" items="${fournisseurs}">
							<option value="${ frs.getCodeFrs() }">${ frs.getNom() }</option>
						</c:forEach>
					</select>
                  </div>
                  <div class="form-group">
                    <label for="dateAppro">Date </label>
                    <input type="date" name="dateAppro" class="form-control" id="dateAppro" placeholder=" Date " required>
                  </div>
                 
                 
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Ajouter</button>
                  <a href="listFournir" class="btn btn-default">Annuler</a>
                </div>
              </form>
              
   <script type="text/javascript"> //date aujourd'hui
		setCurrentDate();
	
		function setCurrentDate(){
			var today= new Date();
			document.getElementById("dateAppro").value = today.toISOString().substr(0,10);
		}
	</script>
              </c:if>



<c:if  test="${ option == 'modif' }">
              <div class="card-header">
                <h3 class="card-title">Modifier un Fournir</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form method="post" action="updateFournir" role="form">
                <div class="card-body">
                  <div class="form-group">
                 <input type="hidden" name="option" value="update" />
				 <input type="hidden" name="idFournir" value="${ idFournir }" />
                    <label for="codeFrs">Code Fournisseur :</label>
                    <input type="text" id="codeFrs" name="codeFrs" value="${ codeFrs }" class="form-control" placeholder=" Code Fournisseur " required readonly>
                  </div>
                  <div class="form-group">
                    <label for="dateAppro">Date : </label>
                    <input type="date" name="dateAppro" value="${ dateAppro }" class="form-control" id="dateAppro" placeholder=" Date " required>
                  </div>
               
                 
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Modifier</button>
                  <a href="listFournir" class="btn btn-default">Annuler</a>
                </div>
              </form>
              </c:if>
               </div>
           </div>
          </div>
         </div>
        </section>
       </div>
<%@ include file="../Foot.jsp" %>

