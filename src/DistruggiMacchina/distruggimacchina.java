package DistruggiMacchina;

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



@WebServlet("/distruggimacchina")
public class distruggimacchina extends HttpServlet {
  private static final long serialVersionUID = 1L;
       

public distruggimacchina() {
super();
}

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
    RequestDispatcher view = request.getRequestDispatcher("html/../distr_vm.html");
    view.forward(request, response);
      
  }


protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// TODO Auto-generated method stub

String user = "root";
String pass = "ciao";
String dbName = "cloudys";
String host = "localhost";
int port = 3306; // porta di default di mysql

String url = "jdbc:mysql://" + host + ":" + port + "/" + dbName;
System.out.println(url);
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection(url, user, pass);

String id_mv=request.getParameter("id_mv");

PreparedStatement pstmt=conn.prepareStatement("update macchinavirtuale set data_distruzione = now() where id_mv = ? ;");

// QUI POTREMMO IMPOSTARE VARI PARAMETRI ALLA QUERY
// pstmt.setString(posizioneDelParametro, valoreDelParametro)

pstmt.setString(1, id_mv);


//PrintWriter writer=response.getWriter();

// ResultSet result= pstmt.executeQuery();
	pstmt.execute();
	PrintWriter writer=response.getWriter();
response.setContentType("text/html");
// PrintWriter writer=response.getWriter();
writer.println("<h1>Informazione inserita correttamente</h1>");
writer.println("<h1>Le tue info sono:</h1>");
writer.println(id_mv);


// result.close();
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