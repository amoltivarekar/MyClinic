/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author microsoft
 */
public class adminupdateinfo extends HttpServlet {
String sur;
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
            out.println("<title>Servlet pataintupdateinfo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet pataintupdateinfo at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        try{
            String sn=request.getParameter("username");
            String se=request.getParameter("useremail");
            String sa=request.getParameter("address");
            String sp=request.getParameter("mobno");
            String su=request.getParameter("user");
            String spass=request.getParameter("password");            
            HttpSession ses=request.getSession(false);    
            sur = ses.getAttribute("adminname").toString();
            
            
    
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String username = "AMOL";
            String password = "12345";
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection(url,username,password);
              
            PreparedStatement pst = con.prepareStatement("update adminselfinfo set aname=?,aemail=?,aaddress=?,amob=?,auser=?,apass=? where aname='"+sur+"'");
            pst.setString(1,sn);
            pst.setString(2,se);
            pst.setString(3,sa);
            pst.setString(4,sp);
            pst.setString(5,su);
            pst.setString(6,spass);
            
            int i=pst.executeUpdate();
            
            if(i>0)
            {
                out.print("<script>alert('"+sur+" YOU HAVE SUCCESSFULLY UPDATE YOUR PERSONAL INFO ! THANK YOU')</script>");
            }
            RequestDispatcher rs = request.getRequestDispatcher("Admin.html");
            rs.include(request,response);
            ses=request.getSession();  
            ses.invalidate();
        }
        catch(Exception e)
        {
            out.print("hello : "+e);
        }
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