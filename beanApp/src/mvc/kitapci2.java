package mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/kitapci2")
public class kitapci2 extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		kitapci kitap1 = new kitapci("Ana", "Mesut", 80);
		kitapci kitap2 = new kitapci("Baba", "Dogan", 90);
		
		HttpSession session = request.getSession();
		session.setAttribute("kitap1", kitap1);
		session.setAttribute("kitap2", kitap2);
		request.setAttribute("kitap1", kitap1);
		request.setAttribute("kitap2", kitap2);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("kitapci_mvc.jsp");
		dispatcher.forward(request, response);
		
	}
}
