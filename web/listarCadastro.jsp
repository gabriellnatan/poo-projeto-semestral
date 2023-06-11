<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="model.Veiculo" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bancoDeDados.VeiculoDAO" %>

<%
   VeiculoDAO veiculoDAO = new VeiculoDAO();
   List<Veiculo> veiculos = veiculoDAO.listarVeiculos();
        if (veiculos != null) {
            request.setAttribute("veiculos", veiculos);
}
%>

<%
    HttpSession currentSession = request.getSession(false);
    if (currentSession == null || currentSession.getAttribute("username") == null) {
        // Redireciona para a página de login caso a sessão não esteja ativa
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    } else {
        String username = (String) currentSession.getAttribute("username");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listagem de Veículos</title>
    <style>
        body {
            background-color: #333;
            color: #fff;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ccc;
        }

        th {
            background-color: #444;
            color: #fff;
        }

        form {
            display: inline;
        }

        button {
            padding: 5px 10px;
            background-color: #4CAF50;
            border: none;
            color: #fff;
            cursor: pointer;
            border-radius: 4px;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <!-- menu -->
    <jsp:include page="navbar.jsp" />
    <!-- fim menu -->
    <h1>Histórico de Veículos</h1>
    <table>
        <thead>
            <tr>
                <th>Modelo</th>
                <th>Marca</th>
                <th>Cor</th>
                <th>Placa</th>
                <th>Renavam</th>
                <th>Ano</th>
                <th>Preço</th>
                <th>Excluir</th>
                <th>Editar</th>
            </tr>
        </thead>
        <tbody>
            <% for (Veiculo veiculo : veiculos) { %>
                <tr>
                    <td><%= veiculo.getModelo() %></td>
                    <td><%= veiculo.getMarca() %></td>
                    <td><%= veiculo.getCor() %></td>
                    <td><%= veiculo.getPlaca() %></td>
                    <td><%= veiculo.getRenavam() %></td>
                    <td><%= veiculo.getAno() %></td>
                    <td><%= veiculo.getPreco() %></td>
                    <td>
                        <form action="excluirVeiculo?placa=<%= veiculo.getPlaca() %>" method="post">
                            <button type="submit">Deletar</button>
                        </form>
                    </td>
                    <td>
                        <form action="atualizarCadastro.jsp?placa=<%= veiculo.getPlaca() %>" method="post">
                            <button type="submit">Editar</button>
                        </form>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
        
    <script>
        // Verifica se há uma mensagem na URL
        var urlParams = new URLSearchParams(window.location.search);
        var success = urlParams.get('success');
        if (success === 'true') {
            // Exibe um pop-up com a mensagem de sucesso
            alert("Deletado com sucesso");
        }
        var mesage = urlParams.get('mesage');
        if (mesage === 'true') {
            // Exibe um pop-up com a mensagem de sucesso
            alert("Atualizado com sucesso");
        }
    </script>
</body>
</html>
<% } %>
