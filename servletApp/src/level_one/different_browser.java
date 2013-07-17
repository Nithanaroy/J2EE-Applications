package level_one;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/different_browser")
public class different_browser extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    
	public different_browser() 
    {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String data = request.getParameter("data");
		String browser = request.getParameter("browser");
		yonlendir(data, browser, response);
	}
	
	public void yonlendir(String veri , String browser , HttpServletResponse response) throws IOException
	{
		response.sendRedirect(browser);
	}
}
