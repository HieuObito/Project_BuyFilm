/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import entity.Customers;
import entity.OrderDetails;
import entity.Orders;
import entity.ProductCart;
import entity.YourBill;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Vector;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAOBill;
import model.DAOEmployees;
import model.DAOOrderDetails;
import model.DAOOrders;
import model.DAOProducts;

/**
 *
 * @author admin
 */
@WebServlet(name = "ControllerCart", urlPatterns = {"/ControllerCart"})
public class ControllerCart extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            java.util.Enumeration em = session.getAttributeNames();
            String service = request.getParameter("do");
            DAOProducts dao = new DAOProducts();
            DAOOrderDetails ord = new DAOOrderDetails();
            DAOOrders or = new DAOOrders();
            DAOBill bill = new DAOBill();
            if (service == null) {
                service = "showCart";
            }
            if (service.equals("showCart")) {
                String key = request.getParameter("id");
                String user = request.getParameter("user");
                int id = Integer.parseInt(key);
                ProductCart pro = dao.CartbyID(id);
                if (session.getAttribute(key) == null) {
                    pro.setQuantity(1);
                    session.setAttribute(key, pro);
                } else {
                    pro = (ProductCart) session.getAttribute(key);
                    pro.setQuantity(pro.getQuantity() + 1);
                    session.setAttribute(key, pro);
                }
                response.sendRedirect("ControllerProducts?do=ALL&page=1");
            }
            if (service.equals("showCartindex")) {
                String key = request.getParameter("id");
                int id = Integer.parseInt(key);
                ProductCart pro = dao.CartbyID(id);
                if (session.getAttribute(key) == null) {
                    pro.setQuantity(1);
                    session.setAttribute(key, pro);
                } else {
                    pro = (ProductCart) session.getAttribute(key);
                    pro.setQuantity(pro.getQuantity() + 1);
                    session.setAttribute(key, pro);
                }
                response.sendRedirect("ControllerProducts");
            }
            if (service.equals("showCartcate")) {
                String key = request.getParameter("id");
                int id = Integer.parseInt(key);
                ProductCart pro = dao.CartbyID(id);
                if (session.getAttribute(key) == null) {
                    pro.setQuantity(1);
                    session.setAttribute(key, pro);
                } else {
                    pro = (ProductCart) session.getAttribute(key);
                    pro.setQuantity(pro.getQuantity() + 1);
                    session.setAttribute(key, pro);
                }
                response.sendRedirect("ControllerProducts?do=Category&cate=1");
            }
            if (service.equals("delete")) {
                String key = request.getParameter("id");
                session.removeAttribute(key);
                RequestDispatcher dispath = request.getRequestDispatcher("Cart.jsp");
                dispath.forward(request, response);
            }
            if (service.equals("deleteAll")) {
                session.invalidate();
                RequestDispatcher dispath = request.getRequestDispatcher("Cart.jsp");
                dispath.forward(request, response);
            }
            if (service.equals("update")) {
                Vector<ProductCart> vector = new Vector<>();
                String[] id = request.getParameterValues("id");
                String[] name = request.getParameterValues("name");
                String[] quan = request.getParameterValues("quantity");
                String[] price = request.getParameterValues("price");
                String[] img = request.getParameterValues("image");
                ProductCart cart = null;
                double total = 0;
                for (int i = 0; i < id.length; i++) {
                    cart = (ProductCart) session.getAttribute(id[i]);
                    Integer b = Integer.parseInt(quan[i]);
                    cart.setQuantity(b);
                    session.setAttribute(id[i], cart);
                }
                while (em.hasMoreElements()) {
                    String key = em.nextElement().toString();
                    if (key != "account") {
                        cart = (ProductCart) session.getAttribute(key);
                        total += cart.getQuantity() * cart.getUnitPrice();
                    }
                }
                for (int i = 0; i < id.length; i++) {
                    Integer a = Integer.parseInt(id[i]);
                    Integer b = Integer.parseInt(quan[i]);
                    Double c = Double.parseDouble(price[i]);
                    cart = new ProductCart(a, img[i], name[i], c, b, total);
                    vector.add(cart);
                }
                request.setAttribute("vector", vector);
                request.setAttribute("total", total);
                RequestDispatcher dispath = request.getRequestDispatcher("UpdateCart.jsp");
                dispath.forward(request, response);
            }

            if (service.equals("payment")) {
                ProductCart cart = null;
                Orders order = null;
                OrderDetails orderdetails = null;
                Customers cus = null;
                String[] id = request.getParameterValues("id");
                String[] name = request.getParameterValues("name");
                String[] quan = request.getParameterValues("quantity");
                String[] price = request.getParameterValues("price");

                String cname = request.getParameter("namec");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String address = request.getParameter("address");
                
                Integer ph = Integer.parseInt(phone);
                int cusid = 0;
                double total = 0;
                for (int i = 0; i < id.length; i++) {
                    cart = (ProductCart) session.getAttribute(id[i]);
                    Integer b = Integer.parseInt(quan[i]);
                    cart.setQuantity(b);
                    session.setAttribute(id[i], cart);
                }
                while (em.hasMoreElements()) {
                    String key = em.nextElement().toString();
                    if (key != "account") {
                        cart = (ProductCart) session.getAttribute(key);
                        total += cart.getQuantity() * cart.getUnitPrice();
                    }
                    if (key == "account") {
                        cus = (Customers) session.getAttribute(key);
                        cusid = cus.getCustomerID();
                    }
                }
                long miliSeconds = System.currentTimeMillis();
                Date date1= new Date();
                order = new Orders(cusid, cname, ph, email, address, total, 1,date1);
                int x = or.addOrder(order);
                double d = 0;
                for (int i = 0; i < id.length; i++) {
                    Integer a = Integer.parseInt(id[i]);
                    Integer b = Integer.parseInt(quan[i]);
                    Double c = Double.parseDouble(price[i]);
                    d = b * c;
                    orderdetails = new OrderDetails(x, a, c, b, d);
                    int n = ord.addOrder(orderdetails);
                    int z=dao.changQuantity(a, b);
                }
                session.invalidate();
                response.sendRedirect("/Project_PRJ/ControllerProducts");
            }
            if (service.equals("yourbill")) {
                Vector<YourBill> vector = new Vector<>();
                String cid = request.getParameter("id");
                int id = Integer.parseInt(cid);
                vector = bill.listAllBill(id);
                request.setAttribute("vector", vector);
                RequestDispatcher dispath = request.getRequestDispatcher("YourBill.jsp");
                dispath.forward(request, response);

            }
            if (service.equals("checkout")) {
                session.invalidate();
                response.sendRedirect("/Project_PRJ/ControllerProducts");
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
