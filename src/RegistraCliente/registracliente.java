package RegistraCliente;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ProvaServlet
 */
@WebServlet("/registracliente")
public class registracliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registracliente() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher view = request.getRequestDispatcher("html/../new_cli.html");
		view.forward(request, response);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String user = "root";
		String pass = "ciao";
		String dbName = "cloudys";
		String host = "localhost";
		int port = 3306;	// porta di default di mysql
		
		String url = "jdbc:mysql://" + host + ":" + port + "/" + dbName;
		System.out.println(url);
		try 
		{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection conn = DriverManager.getConnection(url, user, pass);
		
			String cod_fisc=request.getParameter("cod_fisc");		
			String email=request.getParameter("email");
			String nome=request.getParameter("nome");		
			String cognome=request.getParameter("cognome");
			String referente=request.getParameter("referente");		
			
			PreparedStatement pstmt=conn.prepareStatement("INSERT INTO cliente (cod_fisc, email, nome, cognome, referente) VALUES (?, ?, ?, ?, ?)");
			
			// QUI POTREMMO IMPOSTARE VARI PARAMETRI ALLA QUERY
			// pstmt.setString(posizioneDelParametro, valoreDelParametro)
			
			pstmt.setString(1, cod_fisc);
			pstmt.setString(2, email);
			pstmt.setString(3, nome);
			pstmt.setString(4, cognome);
			pstmt.setString(5, referente);
			
			
		
			// ResultSet result= pstmt.executeQuery();
			pstmt.execute();
			PrintWriter writer=response.getWriter();
			response.setContentType("text/html");	
		//	PrintWriter writer=response.getWriter();
			writer.println("<div> <a href='index.html'> <img style='max-height: 50px' 'max-width: 50px' src='https://icon-icons.com/icons2/370/PNG/512/Home3_37171.png'> </a></div>");
			writer.println("<h1>Informazione inserita correttamente</h1>");
			writer.println("<h1>Le tue info sono:</h1>");
			
			writer.println("Codice fiscale inserito:");
			writer.println(cod_fisc);
			writer.println("<br>E-mail inserita:");
			writer.println(email);
			writer.println("<br>Nome inserito:");
			writer.println(nome);
			writer.println("<br>Cognome inserito:");
			writer.println(cognome);
			writer.println("<br>Referente aggiunto al cliente:");
			writer.println(referente);
			
			
		//	result.close();
			pstmt.close();
			conn.close();
	    }
	    catch(SQLException e){
            System.out.println("Errore nell'esecuzione della query");
            System.out.println(e.getMessage());
	     } catch (ClassNotFoundException e) {
			System.out.println("Impossibile caricare il driver");
			System.out.println(e.getMessage());
		}
		//doGet(request, response);
	}

}
