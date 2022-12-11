
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- LINK HACIA LA HOJA DE ESTILOS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css"/>

    </head>
    <body>

        <%
            String txtid = request.getParameter("txtid");
            String txtnombre = request.getParameter("txtnombre");
            String txtprecio = request.getParameter("txtprecio");
            String txtcategoria = request.getParameter("txtcategoria");
        %>
        <div class="container">
	<div class="mx-auto col-sm-8 main-section" id="myTab" role="tablist">
		<ul class="nav nav-tabs justify-content-end">
			<li class="nav-item">
			<a href="index.jsp" class="nav-link active" id="list-tab" data-toggle="tab" href="#list" role="tab" aria-controls="list" aria-selected="false">Lista de productos</a>
			</li>
			<li class="nav-item">
			<a href="crear.jsp" class="nav-link" id="form-tab" data-toggle="tab" href="#form" role="tab" aria-controls="form" aria-selected="true">Añadir producto</a>				   	
			</li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="list" role="tabpanel" aria-labelledby="list-tab">
			</div>
			<div class="tab-pane fade" id="form" role="tabpanel" aria-labelledby="form-tab">
			</div>
		</div>
            </div>
        </div>
            <div class="card">
                    <div class="card-header">
                        <h4>ComposStark - Actualizar producto</h4>
                    </div>
                    <div class="card-body">
                            <!-- Formulario de editar-->
                            
                            
                            
                            <form class="form" role="form" autocomplete="off" action="actualizar.jsp" method="post">
                                
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Id: </label>
                                        <div class="col-lg-9">
                                            <input class="form-control" type="text" id="txtid" name="txtid" value="<%= txtid %>" readonly>
                                        </div>
                                </div>

                                
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Nombre: </label>
                                        <div class="col-lg-9">
                                            <input class="form-control" type="text" id="txtnombre" name="txtnombre" value="<%= txtnombre %>" required>
                                        </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Precio: </label>
                                        <div class="col-lg-9">
                                            <input class="form-control" type="text" id="txtprecio" name="txtprecio" value="<%= txtprecio %>" required>
                                        </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Categoria: </label>
                                        <div class="col-lg-9">
                                            <input class="form-control" type="text" id="txtcategoria" name="txtcategoria" value="<%= txtcategoria%>" required>
                                        </div>
                                </div>
                                
                                <div>
                                    Puede insertar uno de estos valores numericos en categoria:
                                    <%
                                                    Connection con1 = null;
                                                    Statement st1 = null;
                                                    ResultSet rs1 = null;

                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/"
                                                        + "BDComposStark3?user=root&password=1010Kaekd");
                                                    st1 = con1.createStatement();
                                                    rs1 = st1.executeQuery("SELECT * FROM T_Categoria WHERE estcat = 1;");
                                                    while(rs1.next()){
                                    %>
                                    <div>
                                        <%= rs1.getString(1)%> - <%= rs1.getString(2)%>
                                    </div>
                                    <%
                                        }
                                    %>
                                </div>
                                
                                <div class="form-group row">
                                        <div class="col-lg-12 text-center">
                                                
                                                <!-- <button type="submit" class="btn btn-secondary"  id="btnenviar" name="btnenviar">Cancelar</button> -->
                                                <button type="submit" class="btn btn-primary" id="btnenviar" name="btnenviar">Actualizar cambios</button>
                                        </div>
                                </div>
                            </form>
                            <a href="index.jsp">Cancelar</a>
                            <%
                                if(request.getParameter("btnenviar") != null){

                                   
                                    
                                    try {
                                        Connection con = null;
                                        Statement st = null;
                                        Class.forName("com.mysql.jdbc.Driver");
                                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"
                                            + "BDComposStark3?user=root&password=1010Kaekd");
                                        st = con.createStatement();                                     
                                        st.executeUpdate("UPDATE T_Producto set nompro = '"+txtnombre+"', prepro = '"+txtprecio+"', idcat = '"+txtcategoria+"' where idpro = '"+txtid+"' ");
                                        request.getRequestDispatcher("index.jsp").forward(request, response);
                                    } catch (Exception e){
                                        out.print(e);
                                    }
                                    
                                }

                            %>
                    </div>
            </div>
    </body>
</html>
