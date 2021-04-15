package VediReferenti;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
@WebServlet("/vedireferenti")
public class vedireferenti extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public vedireferenti() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher view = request.getRequestDispatcher("html/../view_ref.html");
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
		
			PreparedStatement pstmt=conn.prepareStatement("SELECT cod_fisc, nome, cognome, bonus from cliente order by bonus desc");
			
			// QUI POTREMMO IMPOSTARE VARI PARAMETRI ALLA QUERY
			// pstmt.setString(posizioneDelParametro, valoreDelParametro)
			
			// ResultSet result= pstmt.executeQuery();
			ResultSet result=pstmt.executeQuery();
			
			
			
			
			response.setContentType("text/html");	
			PrintWriter out= response.getWriter();
			out.println("<HTML>");
			out.println("<BODY>");
			out.println("<div> <a href='index.html'> <img style='max-height: 50px' 'max-width: 50px' src='https://icon-icons.com/icons2/370/PNG/512/Home3_37171.png'> </a></div>");
			out.println("<H1 style= color:red> LISTA DEI CLIENTI ORDINATI PER BONUS RICEVUTI: </H1>");
			out.println("<table border=\"2\">");
			out.println("<tr>");
			out.println("<th>CODICE FISCALE</th>");
			out.println("<th>NOME</th>");
			out.println("<th>COGNOME</th>");
			out.println("<th>BONUS</th>");
			out.println("</tr>");
			while (result.next()) 
			{
				out.println("<tr>");
				out.println("<td>");
				String cod_fisc=result.getString("cod_fisc");
				out.println(cod_fisc);
				out.println("</td>");
				out.println("<td>"); 
				String nome=result.getString("nome");
				out.println(nome);
				out.println("</td>"); 
				
				out.println("<td>"); 
				String cognome=result.getString("cognome");
				out.println(cognome);
				out.println("</td>"); 
				
				out.println("<td>"); 
				String bonus=result.getString("bonus");
				out.println(bonus);
				out.println("</td>"); 
				
				
				out.println("</tr>");
				// QUI POSSIAMO LEGGERE I RISULTATI DA result E STAMPARLI NELLA PAGINA HTML
			}
			out.println("</table>");
			out.println("</BODY>");
			out.println("</HTML>");
			
			
			result.close();
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
