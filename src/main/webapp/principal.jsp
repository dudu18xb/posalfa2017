<%@page import="br.com.munif.ooweb.Lugar"%>
<jsp:useBean class="br.com.munif.ooweb.Jogador" id="jogador" scope="session"/>
<jsp:useBean class="br.com.munif.ooweb.Mapa" id="mapa" scope="application"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nome = request.getParameter("nome");
    String movimento = request.getParameter("movimento");
    String mensagem = request.getParameter("mensagem");
    if (nome != null) {
        jogador.setNome(nome);
        jogador.setLugar(mapa.getLugarInicialJogador());
    }
    Lugar lc = jogador.getLugar();
    if (mensagem != null && mensagem.trim().length() > 0) {
        lc.getMensagens().add(jogador.getNome() + ":" + mensagem);
    }

    if (movimento != null && movimento.trim().length() > 0) {
        int opcao = Integer.parseInt(movimento);
        if (opcao == 1 && lc.getLeste() != null) {
            jogador.setLugar(lc.getLeste());
        } else if (opcao == 2 && lc.getOeste() != null) {
            jogador.setLugar(lc.getOeste());
        } else if (opcao == 3 && lc.getNorte() != null) {
            jogador.setLugar(lc.getNorte());
        } else if (opcao == 4 && lc.getSul() != null) {
            jogador.setLugar(lc.getSul());
        }
    }


%>

<!DOCTYPE html>
<html>
    <head>
        <title>Jogo 2017</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"> 
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> 
        <link rel="stylesheet" type="text/css" href="css/estilo.css"> 
        <script src="js/jquery-3.2.1.min.js.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="index.html">Home</a></li>
                        <li><a href="#">Quem Somos</a></li>
                        <li><a href="#">Contato</a></li>
                    </ul>
                    <ul class="nav navbar-nav" style="float: right">
                        <li><a href="#"><i class="glyphicon glyphicon-user"></i> <%=jogador.getNome()%></a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <h1>Olá <%=jogador.getNome()%></h1>
        <%
            lc = jogador.getLugar();
        %>


        <h2>Você está no(a):
            <%=jogador.getLugar().getDescricao()%></h2>
        <h2>Com:
            <%=jogador.getLugar().getPersonagens()%></h2>

        <h4>Mensagens
            <%=jogador.getLugar().getMensagens()%></h2>


        <pre><%

            if (lc.getLeste() != null) {
                out.println("1) Para leste " + lc.getLeste().getDescricao());
            }
            if (lc.getOeste() != null) {
                out.println("2) Para Oeste " + lc.getOeste().getDescricao());
            }
            if (lc.getNorte() != null) {
                out.println("3) Para Norte " + lc.getNorte().getDescricao());
            }
            if (lc.getSul() != null) {
                out.println("4) Para Sul " + lc.getSul().getDescricao());
            }

            %>
        </pre>
        <form method="POST" action="principal.jsp">
            Movimento:<input type="text" name="movimento" value="" /><br/>
            Mensagem:<input type="text" name="mensagem" value="" /><br/>
            <input type="submit" value="Enviar" />
        </form>
</body>
</html>
