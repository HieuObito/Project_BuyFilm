/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import entity.Categories;
import entity.Page;
import entity.ProductCart;
import entity.Products;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAOCategory;
import model.DAOProducts;

/**
 *
 * @author admin
 */
@WebServlet(name = "ControllerProducts", urlPatterns = {"/ControllerProducts"})
public class ControllerProducts extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            DAOProducts dao = new DAOProducts();
            DAOCategory daocate = new DAOCategory();
            String service = request.getParameter("do");
            if (service == null) {
                Vector<Products> vector = dao.listAllProduct("SELECT TOP 8 * FROM Products\n"
                        + "order by Quantity DESC");

                Vector<Products> v2 = dao.listAllProduct("SELECT TOP 3 * FROM Products\n"
                        + "order by YEAR DESC");

                Vector<Products> v3 = dao.listAllProduct("SELECT TOP 3 * FROM Products\n"
                        + "where CategoryID=5");

                request.setAttribute("v3", v3);
                request.setAttribute("v2", v2);
                request.setAttribute("vector", vector);
                RequestDispatcher dispath = request.getRequestDispatcher("index.jsp");
                dispath.forward(request, response);
            }
            if (service.equals("ALL")) {
                Vector<Products> vector = dao.listAllProduct("SELECT * FROM Products");

                int n = dao.Page();
                String number = request.getParameter("page");
                Vector<Page> vector1 = dao.getByPage(Integer.parseInt(number));

                request.setAttribute("vector", vector);
                request.setAttribute("n", n);
                request.setAttribute("vec", vector1);
                RequestDispatcher dispath = request.getRequestDispatcher("products.jsp");
                dispath.forward(request, response);
            }
            if (service.equals("blog")) {
                String id = request.getParameter("id");
                int pid = Integer.parseInt(id);
                Vector<Products> vector = dao.SelectbyID(pid);
                request.setAttribute("vector", vector);
                RequestDispatcher dispath = request.getRequestDispatcher("blog-single.jsp");
                dispath.forward(request, response);
            }
            if (service.equals("Category")) {
                String id = request.getParameter("cate");
                int cateid = Integer.parseInt(id);
                Vector<Products> vector = dao.SelectbyCate(cateid);
                ResultSet rs = dao.getData("select * from Categories c\n"
                        + "join Products p on p.CategoryID=c.CategoryID\n"
                        + "where c.CategoryID=" + cateid);

                request.setAttribute("rs", rs);
                request.setAttribute("vector", vector);
                RequestDispatcher dispath = request.getRequestDispatcher("Category.jsp");
                dispath.forward(request, response);
            }
            if (service.equals("Search")) {
                String name = request.getParameter("name");
                Vector<Products> vector = dao.SearchBYName(name);
                request.setAttribute("name", name);
                request.setAttribute("vector", vector);
                RequestDispatcher dispath = request.getRequestDispatcher("search.jsp");
                dispath.forward(request, response);
            }
            if (service.equals("sortName")) {
                int n = dao.Page();
                String number = request.getParameter("page");
                
                Vector<Page> vector1 = dao.getByPageName(Integer.parseInt(number));
//                Vector<Page> vector2 = dao.getByPageYear(Integer.parseInt(number));
//                Vector<Page> vector3 = dao.getByPagePrice(Integer.parseInt(number));
                request.setAttribute("n", n);
                request.setAttribute("vec", vector1);
//                request.setAttribute("vec", vector2);
//                request.setAttribute("vec", vector3);
                RequestDispatcher dispath = request.getRequestDispatcher("sort.jsp");
                dispath.forward(request, response);
            }if (service.equals("sortPrice")) {
                int n = dao.Page();
                String number = request.getParameter("page");
                
                Vector<Page> vector3 = dao.getByPagePrice(Integer.parseInt(number));
                
                request.setAttribute("n", n);
                request.setAttribute("vec", vector3);
                RequestDispatcher dispath = request.getRequestDispatcher("sortPrice.jsp");
                dispath.forward(request, response);
            }if (service.equals("sortYear")) {
                int n = dao.Page();
                String number = request.getParameter("page");
                
                Vector<Page> vector3 = dao.getByPageYear(Integer.parseInt(number));
                
                request.setAttribute("n", n);
                request.setAttribute("vec", vector3);
                RequestDispatcher dispath = request.getRequestDispatcher("sortYear.jsp");
                dispath.forward(request, response);
            }
            if (service.equals("SortBetween")) {
                String price1 = request.getParameter("price1");
                String price2 = request.getParameter("price2");
                int pri1= Integer.parseInt(price1);
                int pri2= Integer.parseInt(price2);
                
                int n = dao.PagePrice(pri1, pri2);
                String number = request.getParameter("page");
                int num=Integer.parseInt(number);
                
                Vector<Page> vector = dao.getByPageBetween(num, pri1, pri2);
                
                request.setAttribute("pri1", pri1);
                request.setAttribute("pri2", pri2);
                request.setAttribute("n", n);
                request.setAttribute("vec", vector);
                RequestDispatcher dispath = request.getRequestDispatcher("sortBetween.jsp");
                dispath.forward(request, response);
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
