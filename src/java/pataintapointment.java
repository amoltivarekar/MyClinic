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
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author microsoft
 */
public class pataintapointment extends HttpServlet {
    Connection con;
    String username;
    String password;
    String url;
    PreparedStatement pst;
    ResultSet rs;
    RequestDispatcher res;
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
            out.println("<title>Servlet pataintapointment</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet pataintapointment at " + request.getContextPath() + "</h1>");
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
        try
        {
            //Connection
            url="jdbc:oracle:thin:@localhost:1521:XE";
            username="AMOL";
            password="12345";
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection(url,username,password);  

            //get string
            String nm=request.getParameter("username");
            String email=request.getParameter("useremail");
            String add=request.getParameter("address");
            String mob=request.getParameter("mobno");
            String date=request.getParameter("date");
            String time=request.getParameter("time");
            String reason=request.getParameter("reason");
            String doct=request.getParameter("doctor");
            //sql query
            pst=con.prepareStatement("insert into pataintapointment(pname,pemail,paddress,pmob,pappdate,papptime,pappreason,selecteddoctor) values(?,?,?,?,?,?,?,?)");
            pst.setString(1,nm);
            pst.setString(2,email);
            pst.setString(3,add);
            pst.setString(4,mob);
            pst.setString(5,date);
            pst.setString(6,time);
            pst.setString(7,reason);
            if(doct.equals("Select Your Regular Doctor"))
            {
                pst.setString(8,"no selected doctor");
            }
            else
            {
                pst.setString(8,doct);
            }
            int i=pst.executeUpdate();
            if(i>0)
            {
                out.print("<script>alert('Record are inserted Please wait for conformation feedback, Thank you.')</script>");
            }
            res = request.getRequestDispatcher("PataintProfile.jsp");
            res.include(request,response);
        }
        catch(Exception e)
        {
            out.printf("Hello Exception here : "+e);
        }        
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}