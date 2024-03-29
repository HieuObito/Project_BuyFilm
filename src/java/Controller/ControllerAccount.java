/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import entity.Customers;
import entity.Employees;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAOCustomers;
import model.DAOEmployees;

/**
 *
 * @author admin
 */
@WebServlet(name = "ControllerAccount", urlPatterns = {"/ControllerAccount"})
public class ControllerAccount extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String service = request.getParameter("do");
            DAOCustomers dao = new DAOCustomers();
            DAOEmployees daoe = new DAOEmployees();
            Customers cus = new Customers();
            Employees emp = new Employees();
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            cus = dao.getAccount(user, pass);
            emp = daoe.loginE(user, pass);
            if (service == null) {
                if (cus != null) {
                    session.setAttribute("account", cus);
                    response.sendRedirect("/Project_PRJ/ControllerProducts");
                }
                if (emp != null) {
                    session.setAttribute("admin", emp);
                    response.sendRedirect("/Project_PRJ/ControllerProducts");
                } else {
                    String name = "Please try again!!!";
                    request.setAttribute("err", name);
                    RequestDispatcher dispath = request.getRequestDispatcher("mylogin.jsp");
                    dispath.forward(request, response);
                }
            }
            if (service.equals("logout")) {
                session.invalidate();
                response.sendRedirect("/Project_PRJ/ControllerProducts");
            }
            if (service.equals("register")) {
                String user1 = request.getParameter("username");
                String email = request.getParameter("email");
                String name =  request.getParameter("name");
                String passcc = request.getParameter("password");
                String passR = request.getParameter("passwordRepeat");
                Customers cur= null;
                cur = dao.getRegister(user1);
                if (!passcc.equals(passR)) {
                    String a = "Retype password not true!!";
                    request.setAttribute("err", a);
                    RequestDispatcher dispath = request.getRequestDispatcher("Register.jsp");
                    dispath.forward(request, response);
                }
                if (cur != null) {
                    String b = "user is invalid";
                    request.setAttribute("ab", b);
                    RequestDispatcher dispath = request.getRequestDispatcher("Register.jsp");
                    dispath.forward(request, response);
                } else {
                    cur = new Customers(name, null, email, user1, passR);
                    int n = dao.addCustomer(cur);
                    RequestDispatcher dispath = request.getRequestDispatcher("mylogin.jsp");
                    dispath.forward(request, response);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
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
