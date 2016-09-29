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
public class PatientBill extends HttpServlet {
    Connection con;
    String username;
    String password;
    String url;
    PreparedStatement pst;
    String suser,spass;
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
            out.println("<title>Servlet PatientBill</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PatientBill at " + request.getContextPath() + "</h1>");
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
        PrintWriter out=response.getWriter();
        try
        {
            url="jdbc:oracle:thin:@localhost:1521:XE";
            username="AMOL";
            password="12345";
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection(url,username,password);

            String pname=request.getParameter("PatientName");
            String AppDate=request.getParameter("AppoDate");
            String AppTime=request.getParameter("AppoTime");
            String Reason=request.getParameter("Reason");
            String DrName=request.getParameter("DrName");
            String des1=request.getParameter("des1");            
            int qty1=Integer.parseInt(request.getParameter("qty1"));            
            String des2=request.getParameter("des2");
            int qty2=Integer.parseInt(request.getParameter("qty2"));
            String des3=request.getParameter("des3");
            int qty3=Integer.parseInt(request.getParameter("qty3"));
            String des4=request.getParameter("des4");
            int qty4=Integer.parseInt(request.getParameter("qty4"));
            String des5=request.getParameter("des5");
            int qty5=Integer.parseInt(request.getParameter("qty5"));
            String des6=request.getParameter("des6");
            int qty6=Integer.parseInt(request.getParameter("qty6"));
            String des7=request.getParameter("des7");
            int qty7=Integer.parseInt(request.getParameter("qty7"));
            int drf=Integer.parseInt(request.getParameter("drfees"));
            
            pst=con.prepareStatement("insert into DoctBill values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pst.setString(1,pname);
            pst.setString(2,AppDate);
            pst.setString(3,AppTime);
            pst.setString(4,Reason);
            pst.setString(5,DrName);
            pst.setString(6,des1);            
            pst.setInt(7,qty1);
            pst.setString(8,des2);            
            pst.setInt(9,qty2);            
            pst.setString(10,des3);            
            pst.setInt(11,qty3);            
            pst.setString(12,des4);            
            pst.setInt(13,qty4);            
            pst.setString(14,des5);            
            pst.setInt(15,qty5);           
            pst.setString(16,des6);           
            pst.setInt(17,qty6);            
            pst.setString(18,des7);           
            pst.setInt(19,qty7);
            pst.setInt(20,drf);
           
            int i=pst.executeUpdate();
            if(i>0)
            {
                out.print("<script>alert('Bill Submited, Thank you.')</script>");
            }
            res = request.getRequestDispatcher("DoctorAccount.jsp");
            res.include(request,response);
        }
        catch(Exception e)
        {
            out.printf("Hello Exception here : "+e);
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
