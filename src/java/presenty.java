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
public class presenty extends HttpServlet {
    Connection con;
    String username;
    String password;
    String url;
    PreparedStatement pst,pst1;
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
            out.println("<title>Servlet presenty</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet presenty at " + request.getContextPath() + "</h1>");
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
            String job=request.getParameter("jobtype");
            String spe=request.getParameter("speciality");
            String dt=request.getParameter("date");
            String it=request.getParameter("intime");
            String ot=request.getParameter("outtime");
            
            //sql query
            pst=con.prepareStatement("insert into presenty(empname,jobtype,speciallist,pdate,intime,outime) values(?,?,?,?,?,?)");
            pst.setString(1,nm);
            pst.setString(2,job);
            pst.setString(3,spe);
            pst.setString(4,dt);
            pst.setString(5,it);
            pst.setString(6,ot);

            int i=pst.executeUpdate();
            if(i>0)
            {
                out.print("<script>alert('You have successfully give your PRESENTY, Thank you.')</script>");
            }
            pst1=con.prepareStatement("select jobtype from presenty where EMPNAME='"+nm+"'"); 
            rs=pst1.executeQuery();
            rs.next();
            String name=rs.getString(1);
            if(name.equals("Receptionist"))
            {
                res = request.getRequestDispatcher("resptupdate.jsp");
                res.include(request,response);
            }
            else
            {              
                res = request.getRequestDispatcher("DoctorProfile.jsp");
                res.include(request,response);
            }
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
