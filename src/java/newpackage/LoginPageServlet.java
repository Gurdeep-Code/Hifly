/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lenovo
 */
public class LoginPageServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginPageServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            //fetch data from registration pasge
            String email=request.getParameter("LEmail");
            String password=request.getParameter("LPwd");
        
            
          
            //make Login Users class objects
            LUsers lusers=new LUsers(email,password);
            ConnectionDao cDao=new ConnectionDao();
            LUsers lusers1 =cDao.login(lusers);
           
            //String Currentemail = lusers1.getEmail();
            String name =lusers1.getName();
            String phone=lusers1.getPhone();
            String type=lusers1.getType();
            
            
            HttpSession session = request.getSession();
            if(name!= null)
            {
                session.setAttribute("CurrentUser", name);
                if(type == null)
                {   session.setAttribute("UserType", type);
                    session.setAttribute("UserPhone", phone);
                    RequestDispatcher rd=request.getRequestDispatcher("Home.jsp");
                    rd.forward(request, response);
                }
                else
                {   session.setAttribute("UserType", type);
                    RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
                    rd.forward(request, response);
                }
            
            }
            else
            {
            session.setAttribute("UserType", type);
            System.out.println("User not exist or you enter wrong credentials");
            request.setAttribute("error1","User not exist or you enter wrong credentials");
            RequestDispatcher rd=request.getRequestDispatcher("login_register.jsp");
            rd.include(request, response);
            
            }
            
            
            
            System.out.println("info ");
            //System.out.println("email: " + Currentemail); 
            //System.out.println("name: " + name);
            //System.out.println("ph: " + phone);
            System.out.println("type: " + type);
            
            
            out.println("</body>");
            out.println("</html>");
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
