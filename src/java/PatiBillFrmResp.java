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
public class PatiBillFrmResp extends HttpServlet {
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
            out.println("<title>Servlet PatiBillFrmResp</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PatiBillFrmResp at " + request.getContextPath() + "</h1>");
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
            int untp1=Integer.parseInt(request.getParameter("untp1"));
            int qty1=Integer.parseInt(request.getParameter("qty1"));
            int total1=Integer.parseInt(request.getParameter("total1"));
            String des2=request.getParameter("des2");
            int untp2=Integer.parseInt(request.getParameter("untp2"));
            int qty2=Integer.parseInt(request.getParameter("qty2"));
            int total2=Integer.parseInt(request.getParameter("total2"));
            String des3=request.getParameter("des3");
            int untp3=Integer.parseInt(request.getParameter("untp3"));
            int qty3=Integer.parseInt(request.getParameter("qty3"));
            int total3=Integer.parseInt(request.getParameter("total3"));
            String des4=request.getParameter("des4");
            int untp4=Integer.parseInt(request.getParameter("untp4"));
            int qty4=Integer.parseInt(request.getParameter("qty4"));
            int total4=Integer.parseInt(request.getParameter("total4"));
            String des5=request.getParameter("des5");
            int untp5=Integer.parseInt(request.getParameter("untp5"));
            int qty5=Integer.parseInt(request.getParameter("qty5"));
            int total5=Integer.parseInt(request.getParameter("total5"));
            String des6=request.getParameter("des6");
            int untp6=Integer.parseInt(request.getParameter("untp6"));
            int qty6=Integer.parseInt(request.getParameter("qty6"));
            int total6=Integer.parseInt(request.getParameter("total6"));
            String des7=request.getParameter("des7");
            int untp7=Integer.parseInt(request.getParameter("untp7"));
            int qty7=Integer.parseInt(request.getParameter("qty7"));
            int total7=Integer.parseInt(request.getParameter("total7"));
            int prtotal=Integer.parseInt(request.getParameter("prtotal"));
            int drf=Integer.parseInt(request.getParameter("drfees"));
            int fnlamount=Integer.parseInt(request.getParameter("fnlamount"));
            
            pst=con.prepareStatement("insert into Bill values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pst.setString(1,pname);
            pst.setString(2,AppDate);
            pst.setString(3,AppTime);
            pst.setString(4,Reason);
            pst.setString(5,DrName);
            pst.setString(6,des1);
            pst.setInt(7,untp1);
            pst.setInt(8,qty1);
            pst.setInt(9,total1);
            pst.setString(10,des2);
            pst.setInt(11,untp2);
            pst.setInt(12,qty2);
            pst.setInt(13,total2);
            pst.setString(14,des3);
            pst.setInt(15,untp3);
            pst.setInt(16,qty3);
            pst.setInt(17,total3);
            pst.setString(18,des4);
            pst.setInt(19,untp4);
            pst.setInt(20,qty4);
            pst.setInt(21,total4);
            pst.setString(22,des5);
            pst.setInt(23,untp5);
            pst.setInt(24,qty5);
            pst.setInt(25,total5);
            pst.setString(26,des6);
            pst.setInt(27,untp6);
            pst.setInt(28,qty6);
            pst.setInt(29,total6);
            pst.setString(30,des7);
            pst.setInt(31,untp7);
            pst.setInt(32,qty7);
            pst.setInt(33,total7);
            pst.setInt(34,prtotal);
            pst.setInt(35,drf);
            pst.setInt(36,fnlamount);
           
            int i=pst.executeUpdate();
            if(i>0)
            {
                out.print("<script>alert('Bill Submited, Thank you.')</script>");
            }
            res = request.getRequestDispatcher("RespBill.jsp");
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
