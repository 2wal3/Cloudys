package MostraRisorse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProvaServlet
 */
@WebServlet("/mostrarisorse")
public class mostrarisorse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mostrarisorse() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
			PreparedStatement pstmt=conn.prepareStatement("select sum(n_core) as n_core, sum(ris_occup) as ram, sum(cap) as capacita from server, (select idserver, sum(capacita) cap from harddisk group by idserver) as cap_server where server.id_server = cap_server.idserver and ris_occup > 0;");
			
			// QUI POTREMMO IMPOSTARE VARI PARAMETRI ALLA QUERY
			// pstmt.setString(posizioneDelParametro, valoreDelParametro)
			

			
			ResultSet result= pstmt.executeQuery();
			response.setContentType("text/html");
		
			PrintWriter out= response.getWriter(); 
			out.println("<HTML>");
			out.println("<BODY>");
			out.println("<div> <a href='index.html'> <img style='max-height: 50px' 'max-width: 50px' src='https://icon-icons.com/icons2/370/PNG/512/Home3_37171.png'> </a></div>");
			out.println("<H1 style= color:red> LISTA DELLE RISORSE ATTUALMENTE OCCUPATE: </H1>");
			out.println("<table border=\"2\">");
			out.println("<tr>");
			out.println("<th>NUMERO DI CORE</th>");
			out.println("<th>RAM IN BG</th>");
			out.println("<th>CAPACITA' HARD DISK IN GB</th>");
			out.println("</tr>");
			while (result.next()) 
			{
				
				out.println("<tr>");
				out.println("<td>");
				String n_core=result.getString("n_core");
				out.println(n_core);
				out.println("</td>");
				out.println("<td>");
				String ram=result.getString("ram");
				out.println(ram);
				out.println("</td>");
				out.println("<td>"); 
				String capacita=result.getString("capacita");
				out.println(capacita);
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
