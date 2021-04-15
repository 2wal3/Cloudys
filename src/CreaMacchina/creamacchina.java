package CreaMacchina;

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


@WebServlet("/creamacchina")
public class creamacchina extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public creamacchina() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("html/../new_vm.html");
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
		
			String n_core=request.getParameter("n_core");		
			String ram=request.getParameter("ram");
			String processore=request.getParameter("processore");
			String sistema_operativo=request.getParameter("sistema_operativo");
			String cliente=request.getParameter("cliente");
			
			
			PreparedStatement pstmt=conn.prepareStatement("INSERT INTO macchinavirtuale (n_core, ram, processore, sistema_operativo, cliente) VALUES (?, ?, ?, ?, ?)");
			
			// QUI POTREMMO IMPOSTARE VARI PARAMETRI ALLA QUERY
			// pstmt.setString(posizioneDelParametro, valoreDelParametro)
			
			pstmt.setString(1, n_core);
			pstmt.setString(2, ram);
			pstmt.setString(3, processore);
			pstmt.setString(4, sistema_operativo);
			pstmt.setString(5, cliente);
			
			PrintWriter writer=response.getWriter();
			// ResultSet result= pstmt.executeQuery();
			pstmt.execute();
			
			
			response.setContentType("text/html");	
		//	PrintWriter writer=response.getWriter();
			writer.println("<div> <a href='index.html'> <img style='max-height: 50px' 'max-width: 50px' src='https://icon-icons.com/icons2/370/PNG/512/Home3_37171.png'> </a></div>");
			writer.println("<h1>Informazione inserita correttamente</h1>");
			writer.println("<h1>Le tue info sono:</h1>");
			writer.println("Numero dei core scelti:");
			writer.println(n_core);
			writer.println("<br>Numero di ram scelta:");
			writer.println(ram);
			writer.println("<br>Processore scelto:");
			writer.println(processore);
			writer.println("<br>Sistema Operativo scelto:");
			writer.println(sistema_operativo);
			writer.println("<br>Codice fiscale del cliente scelto:");
			writer.println(cliente);
			
			
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
