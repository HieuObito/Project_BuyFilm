/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import entity.Customers;
import entity.OrderDetails;
import entity.Orders;
import entity.Products;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.Vector;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAOCustomers;
import model.DAOOrderDetails;
import model.DAOOrders;
import model.DAOProducts;

/**
 *
 * @author admin
 */
@WebServlet(name = "ControllerAdmin", urlPatterns = {"/ControllerAdmin"})
public class ControllerAdmin extends HttpServlet {

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
            String service = request.getParameter("do");
            DAOProducts dao = new DAOProducts();
            DAOCustomers daoe = new DAOCustomers();
            DAOOrders daoo = new DAOOrders();
            DAOOrderDetails daoord = new DAOOrderDetails();
            HttpSession session = request.getSession();
            if (session.getAttribute("admin") == null) {
                RequestDispatcher dispath = request.getRequestDispatcher("mylogin.jsp");
                dispath.forward(request, response);
            }
            if (service == null) {
                service.equals("update");
            }
            if (service.equals("update")) {
                String id = request.getParameter("id");
                int pid = Integer.parseInt(id);
//               Vector<Products> pro=dao.SelectbyID(pid);
                ResultSet rs = dao.getData("select * from Products where ProductID=" + pid);
                request.setAttribute("rs", rs);
                RequestDispatcher dispath = request.getRequestDispatcher("updateadmin.jsp");
                dispath.forward(request, response);
            }
            if (service.equals("updateP")) {
                String id = request.getParameter("id");
                String spid = request.getParameter("spid");
                String cid = request.getParameter("cid");
                String name = request.getParameter("name");
                String year = request.getParameter("year");
                String price = request.getParameter("price");
                String imagine = request.getParameter("imagine");
                String description = request.getParameter("description");
                String quantity = request.getParameter("quantity");
                String discontinued = request.getParameter("discontinued");

                int pid = Integer.parseInt(id);
                int supid = Integer.parseInt(spid);
                int ccid = Integer.parseInt(cid);
                int yyear = Integer.parseInt(year);
                float uprice = Float.parseFloat(price);
                int quan = Integer.parseInt(quantity);
                int dis = Integer.parseInt(discontinued);
                Products pro = new Products(pid, supid, ccid, name, yyear, uprice, imagine, description, quan, dis);
                int n = dao.updateProducts(pro);
                ResultSet rs = dao.getData("select * from Products where ProductID=" + pid);
                request.setAttribute("rs", rs);
                RequestDispatcher dispath = request.getRequestDispatcher("updateadmin.jsp");
                dispath.forward(request, response);
            }
            if (service.equals("all")) {
                Vector<Products> vector = dao.listAllProduct("select * from Products");
                request.setAttribute("vector", vector);
                RequestDispatcher dispath = request.getRequestDispatcher("ProductsManager.jsp");
                dispath.forward(request, response);
            }
            if (service.equals("deleteP")) {
                String id = request.getParameter("id");
                int pid = Integer.parseInt(id);
                int n = dao.removeProduct(pid);
                Vector<Products> vector = dao.listAllProduct("select * from Products");
                request.setAttribute("vector", vector);
                RequestDispatcher dispath = request.getRequestDispatcher("ProductsManager.jsp");
                dispath.forward(request, response);
            }
            if (service.equals("insert")) {
                String cid = request.getParameter("cid");
                String name = request.getParameter("name");
                String year = request.getParameter("year");
                String price = request.getParameter("price");
                String imagine = request.getParameter("imagine");
                String description = request.getParameter("description");
                String quantity = request.getParameter("quantity");
                String discontinued = request.getParameter("discontinued");

                if (year == null || year.isEmpty()) {
                    out.print("<h3 style='font size:15px;'>Year cannot Null </h3>");
                    return;
                }
                if (year.matches("^[0-9]")) {
                    out.print("<h3 style='font size:15px;'>year must be number </h3>");
                    return;
                }
                if (price == null || price.isEmpty()) {
                    out.print("<h3 style='font size:15px;'>price cannot Null </h3>");
                    return;
                }
                if (price.matches("^[0-9]")) {
                    out.print("<h3 style='font size:15px;'>price must be number </h3>");
                    return;
                }
                if (quantity == null || quantity.isEmpty()) {
                    out.print("<h3 style='font size:15px;'>quantity cannot Null </h3>");
                    return;
                }
                if (quantity.matches("^[0-9]")) {
                    out.print("<h3 style='font size:15px;'>quantity must be number </h3>");
                    return;
                }
                if (discontinued == null || discontinued.isEmpty()) {
                    out.print("<h3 style='font size:15px;'>discontinued cannot Null </h3>");
                    return;
                }
                if (!discontinued.matches("^[0-9]")) {
                    out.print("<h3 style='font size:15px;'>discontinued must be number</h3>");
                    return;
                }
                int ccid = Integer.parseInt(cid);
                int yyear = Integer.parseInt(year);
                float uprice = Float.parseFloat(price);
                int quan = Integer.parseInt(quantity);
                int dis = Integer.parseInt(discontinued);
                Products pro = new Products(1, ccid, price, yyear, uprice, imagine, description, quan, dis);
                int n = dao.addProduct(pro);
                Vector<Products> vector = dao.listAllProduct("select * from Products");
                request.setAttribute("vector", vector);
                RequestDispatcher dispath = request.getRequestDispatcher("ProductsManager.jsp");
                dispath.forward(request, response);
            }
            if (service.equals("users")) {
                Vector<Customers> vector = daoe.listAllProduct("select * from Customers");
                request.setAttribute("vector", vector);
                RequestDispatcher dispath = request.getRequestDispatcher("UserManager.jsp");
                dispath.forward(request, response);
            }
            if (service.equals("Cid")) {
                String id = request.getParameter("id");
                int cid = Integer.parseInt(id);
//               Vector<Products> pro=dao.SelectbyID(pid);
                ResultSet rs = dao.getData("select * from Customers where CustomerID=" + cid);
                request.setAttribute("rs", rs);
                RequestDispatcher dispath = request.getRequestDispatcher("userUpdate.jsp");
                dispath.forward(request, response);
            }
            if (service.equals("updateC")) {
                String id = request.getParameter("id");
                String name = request.getParameter("cname");
                String country = request.getParameter("country");
                String gmail = request.getParameter("gmail");
                String user = request.getParameter("user");
                String pass = request.getParameter("pass");

                int cid = Integer.parseInt(id);

                Customers cus = new Customers(cid, user, country, gmail, user, pass);
                int n = daoe.updateProducts(cus);
                ResultSet rs = dao.getData("select * from Customers where CustomerID=" + cid);
                request.setAttribute("rs", rs);
                RequestDispatcher dispath = request.getRequestDispatcher("userUpdate.jsp");
                dispath.forward(request, response);
            }
            if (service.equals("deleteC")) {
                String id = request.getParameter("id");
                int pid = Integer.parseInt(id);
                int n = daoe.removeCustomers(pid);
                Vector<Customers> vector = daoe.listAllProduct("select * from Customers");
                request.setAttribute("vector", vector);
                RequestDispatcher dispath = request.getRequestDispatcher("UserManager.jsp");
                dispath.forward(request, response);
            }
            if (service.equals("InsertC")) {
                String name = request.getParameter("cname");
                String country = request.getParameter("country");
                String gmail = request.getParameter("gmail");
                String user = request.getParameter("user");
                String pass = request.getParameter("pass");

                if (name == null || name.isEmpty()) {
                    out.print("<h3 style='font size:15px;'>Customer Name cannot Null </h3>");
                    return;
                }
                if (user == null || user.isEmpty()) {
                    out.print("<h3 style='font size:15px;'>User cannot Null </h3>");
                    return;
                }
                if (pass == null || pass.isEmpty()) {
                    out.print("<h3 style='font size:15px;'>Password Name cannot Null </h3>");
                    return;
                }

                Customers cus = new Customers(name, country, gmail, user, pass);
                int n = daoe.addCustomer(cus);

                Vector<Customers> vector = daoe.listAllProduct("select * from Customers");
                request.setAttribute("vector", vector);
                RequestDispatcher dispath = request.getRequestDispatcher("UserManager.jsp");
                dispath.forward(request, response);
            }
            if (service.equals("Orders")) {
                Vector<Orders> vector = daoo.listAllOrders("select * from Orders");
                request.setAttribute("vector", vector);
                RequestDispatcher dispath = request.getRequestDispatcher("OrdersManager.jsp");
                dispath.forward(request, response);
            }
            if (service.equals("sortByDate")) {
                String date=request.getParameter("date1");
                String date1=request.getParameter("date2");
                Vector<Orders> vector = daoo.listAllOrdersbyDate(date, date1);
                request.setAttribute("vector", vector);
                RequestDispatcher dispath = request.getRequestDispatcher("OrdersManager.jsp");
                dispath.forward(request, response);
            }
            if (service.equals("Bid")) {
                String id = request.getParameter("id");
                int oid = Integer.parseInt(id);
                ResultSet rs = dao.getData("select * from Orders where OrderID=" + oid);
                request.setAttribute("rs", rs);
                RequestDispatcher dispath = request.getRequestDispatcher("OrdersUpdate.jsp");
                dispath.forward(request, response);
            }
            if (service.equals("updateO")) {
                String id = request.getParameter("id");
                String cid = request.getParameter("cid");
                String name = request.getParameter("cname");
                String phone = request.getParameter("phone");
                String gmail = request.getParameter("gmail");
                String add = request.getParameter("add");
                String total = request.getParameter("total");
                String status = request.getParameter("status");

                if (name == null || name.isEmpty()) {
                    out.print("<h3 style='font size:15px;'>Customer Name cannot Null </h3>");
                    return;
                }
                if (phone == null || phone.isEmpty()) {
                    out.print("<h3 style='font size:15px;'>phone cannot Null </h3>");
                    return;
                }
                if (phone.matches("[0-9]")) {
                    out.print("<h3 style='font size:15px;'>phone must be number </h3>");
                    return;
                }
                if (total == null || total.isEmpty()) {
                    out.print("<h3 style='font size:15px;'>total cannot Null </h3>");
                    return;
                }
                if (total.matches("[0-9]")) {
                    out.print("<h3 style='font size:15px;'>total must be number </h3>");
                    return;
                }
                int oid = Integer.parseInt(id);
                int cccid = Integer.parseInt(cid);
                int cphone = Integer.parseInt(phone);
                Double Tot = Double.parseDouble(total);
                int sta = Integer.parseInt(status);

                Orders ord = new Orders(oid, cccid, name, cphone, gmail, add, Tot, sta, null);
                int n = daoo.updateOrders(ord);
                ResultSet rs = dao.getData("select * from Orders where OrderID=" + oid);
                request.setAttribute("rs", rs);
                RequestDispatcher dispath = request.getRequestDispatcher("OrdersUpdate.jsp");
                dispath.forward(request, response);
            }
            if (service.equals("deleteO")) {
                String id = request.getParameter("id");
                int oid = Integer.parseInt(id);
                int n = daoo.removeOrder(oid);
                Vector<Orders> vector = daoo.listAllOrders("select * from Orders");
                request.setAttribute("vector", vector);
                RequestDispatcher dispath = request.getRequestDispatcher("OrdersManager.jsp");
                dispath.forward(request, response);
            }
            if (service.equals("insertO")) {
                String cid = request.getParameter("cid");
                String name = request.getParameter("cname");
                String phone = request.getParameter("phone");
                String gmail = request.getParameter("gmail");
                String add = request.getParameter("add");
                String total = request.getParameter("total");
                String status = request.getParameter("status");

                int cccid = Integer.parseInt(cid);
                int cphone = Integer.parseInt(phone);
                Double Tot = Double.parseDouble(total);
                int sta = Integer.parseInt(status);

                Orders ord = new Orders(cccid, name, cphone, gmail, add, Tot, sta, null);
                int n = daoo.addOrder(ord);
                RequestDispatcher dispath = request.getRequestDispatcher("InsertOrders.jsp");
                dispath.forward(request, response);
            }
            if (service.equals("details")) {
                String id = request.getParameter("id");
                int oid = Integer.parseInt(id);
                Vector<OrderDetails> vector = daoord.listAllProduct("select * from [Order Details] where OrderID=" + oid);
                ResultSet rs = dao.getData("select * from Orders where OrderID=" + oid);
                request.setAttribute("rs", rs);
                request.setAttribute("vector", vector);
                RequestDispatcher dispath = request.getRequestDispatcher("OrderDetails.jsp");
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
