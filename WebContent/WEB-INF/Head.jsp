<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <c:set var="src" value="${pageContext.request.contextPath}" />
  <c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
  <title>Gestion d'approvisionnement</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link href="<c:url value="style/dist/css/adminlte.min.css"/>" rel="stylesheet">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand bg-white navbar-light border-bottom">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fa fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="${ src }" class="nav-link ${ path=='/dashboard' ? 'active':''}">Accueil</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="listFournisseur" class="nav-link ${ path=='/listFournisseur' ? 'active':''}">Fournisseur</a>
      </li>
       <li class="nav-item d-none d-sm-inline-block">
        <a href="listProduits" class="nav-link ${ path=='/listProduits' ? 'active':''}">Produit</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="listFournir" class="nav-link ${ path=='/listFournir' ? 'active':''}">Appro</a>
      </li>
    </ul>

    <!-- SEARCH FORM -->
    <form class="form-inline ml-3">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" placeholder="Rechercher" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-navbar" type="submit">
            <i class="fa fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Right navbar links -->
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="" class="brand-link">
      <img src="<c:url value="style/dist/img/AdminLTELogo.png"/>"
           alt="AdminLTE Logo"
           class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">Approvisionnement</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="<c:url value="style/dist/img/user2-160x160.jpg"/>" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Anna Mihary</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
            <li class="nav-item">
            <a id="accueil" href="${ src }" class="nav-link ${ path=='/dashboard' ? 'active':''}">
              <i class="nav-icon fa fa-dashboard"></i>
              <p>
                Accueil
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a id="listFournisseur" href="listFournisseur" class="nav-link ${ path=='/listFournisseur' ? 'active':''}">
              <i class="nav-icon fa fa-user"></i>
              <p>
                Fournisseur
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a id="listProduits" href="listProduits" class="nav-link ${ path=='/listProduits' ? 'active':''}">
              <i class="nav-icon fa fa-pie-chart"></i>
              <p>
               Produit
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a id="listFournir" href="listFournir" class="nav-link ${ (path=='/listFournir' || path=='/lignefr') ? 'active':''}">
              <i class="nav-icon fa fa-th"></i>
              <p>
               Approvisionnement
              </p>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>