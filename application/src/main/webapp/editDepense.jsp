<%@page import="com.bugget.service.impl.Service"%>
<%@page import="com.bugget.entities.Depense"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Edition de la depense - Bugget</title>
</head>
<body>
	<% 
	  if (request.getParameter("id") != null){
		  int id = Integer.parseInt(request.getParameter("id"));
		  Depense depense = Service.getCurrentInstance().retrouverDemande(id);
		  if (depense != null){

	%>
	<jsp:include page="nav.jsp"></jsp:include>
	<div class="container mt-5 mb-5">
		<div class="card mr-auto">
			<form action="saveDepense.jsp" method="post">
				<div class="card-header bg-primary">
					<h2 class="card-title text-center text-white">Modification de la 
						depense</h2>
				</div>
				<div class="card-body">
					<div class="form-group">
							<label>Montant (FCFA)</label> 
							<input type="number"
								class="form-control form-control-lg" name="montant" required
								placeholder="Entrer le montant en FCFA" min="0"
								value="<%= depense.getMontant()  %>" 
								>
						</div>
					
					<div class="form-group">
						<label>Description</label> 
						<input type="text"
							class="form-control form-control-lg" name="description" required
							placeholder="Entrer la description">
					</div>

					<div class="form-group">
						<label>Categorie</label> <select class="form-control"
							name="categorie">
							<option value="nourriture">Nourriture</option>
							<option value="loyer">Loyer</option>
							<option value="frais de scolarit�">Frais de scolarit�</option>
							<option value="frais m�dical">Frais m�dical</option>
							<option value="facture">Facture</option>
							<option value="autre">Autres</option>
						</select>
					</div>

				</div>

				<div class="card-footer d-flex justify-content-around">
					<input type="submit" class=" w-25 mr-2 btn btn-lg btn-primary"
						value="Creer" name="valider"> 
				</div>
			</form>
		</div>
	</div>

	<% 
  } else {
			// redirect
	  		response.sendRedirect("listDepense.jsp");
		  }
	  }
	%>
	
</body>
</html>