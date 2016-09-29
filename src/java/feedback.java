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

/**
 *
 * @author microsoft
 */
public class feedback extends HttpServlet {

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
            out.println("<title>Servlet feedback</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet feedback at " + request.getContextPath() + "</h1>");
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
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
    try
    {
        //Connection
        String url="jdbc:oracle:thin:@localhost:1521:XE";
        String username="AMOL";
        String password="12345";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection(url,username,password);
        
        //Get Parameters
        String fdkName=request.getParameter("username");
        String fdkEmail=request.getParameter("useremail");        
        String fdk=request.getParameter("msg");
        
        //Sql Command
        PreparedStatement pst =con.prepareStatement("insert into clinicfeedback(UserName,UserEmail,UserMessage) values(?,?,?)");
        pst.setString(1,fdkName);
        pst.setString(2,fdkEmail);
        pst.setString(3,fdk);        
        
        //Excute Update
        int i=pst.executeUpdate();
        if(i>0)
        {
            out.print("<script>alert('YOU SUCCEFULLY SUBMITED YOUR FEEDBACK ! THANK YOU')</script>");
            RequestDispatcher res = request.getRequestDispatcher("index.html");
            res.include(request,response);
        }   
    }
    catch(Exception e)
    {
        out.print("Hello Exception here : "+e);   
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
