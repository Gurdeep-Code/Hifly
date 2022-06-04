/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Cart;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import newpackage.ConnectionDao;

/**
 *
 * @author Lenovo
 */
public class AddToCart extends HttpServlet {

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
          
            //fetch data from shop pasge
            int pid=Integer.parseInt(request.getParameter("pid"));
            String CartID=request.getParameter("CartID");
            
            System.out.println(pid);
            System.out.println(CartID);
            
            //make ConnectionDao class objects
            ConnectionDao cDao = new ConnectionDao();
            String result = cDao.CartCheckNull(pid,CartID);
            //System.out.println("add2 " + result);
            Cart cart1 = cDao.Total(CartID);
            int TotalPrice=0,TotalQuan=0;
            TotalPrice = cart1.getTotalPrice();
            TotalQuan = cart1.getTotalQuan();
            System.out.println(TotalQuan);
            
            //giving feedback that data is store or not
            HttpSession session = request.getSession();
            if ("1".equals(result)) {
            session.setAttribute("message","T");
            session.setAttribute("TotalPrice",TotalPrice);
            session.setAttribute("TotalQuan",TotalQuan);
            response.sendRedirect("Shop.jsp");
            } else {
            session.setAttribute("message","F");
            response.sendRedirect("Shop.jsp");
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
