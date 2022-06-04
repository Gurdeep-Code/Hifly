package AdminPanel;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import newpackage.ConnectionDao;

/**
 *
 * @author Lenovo
 */
@MultipartConfig
public class AddProductsServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            //fetch data from admin pasge
            String pname = request.getParameter("pname");
            String pdesc = request.getParameter("pdesc");
            int pquan = Integer.parseInt(request.getParameter("pquan"));
            int pprice = Integer.parseInt(request.getParameter("pprice"));
            Part part = request.getPart("pimage");
            //String pimage;

            //make AddProducts class objects
            AddProducts addproducts = new AddProducts(pname, pdesc, pquan, pprice);
            addproducts.setPimage(part.getSubmittedFileName());

            //pimage=addproducts.getPimage();
            //System.out.println("Img:" + pimage );
            //make ConnectionDao class objects
            ConnectionDao cDao = new ConnectionDao();
            String result = cDao.AddProducts(addproducts);

           
            //giving feedback that data is store or not
            HttpSession session = request.getSession();
            if (result.equals("T")) {
                
            //..................Upload Image..................
            
            //Upload Path Where image store
            String path = "C:" + File.separator + "Users" + File.separator + "Lenovo" + File.separator + "Documents" + File.separator + "NetBeansProjects" + File.separator + "Hi_Fly" + File.separator + "web" + File.separator +"image" + File.separator + "Products" + File.separator + part.getSubmittedFileName();
            System.out.println(path);
            
            FileOutputStream fos = new FileOutputStream(path);
            
            InputStream fis = part.getInputStream();
            
            byte[] image = new byte[fis.available()];
            
            fis.read(image);
            
            fos.write(image);
            
            fos.close();
            
            //..................Upload Image..................
    
            session.setAttribute("message","T");
            response.sendRedirect("Admin.jsp");
            } else {
            session.setAttribute("message","F");
            response.sendRedirect("Admin.jsp");
            }
        }
    }
    
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
