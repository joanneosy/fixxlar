/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.WebUserDAO;
import entity.WebUser;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Joanne
 */
@WebServlet(name = "AddMasterAdminServlet", urlPatterns = {"/AddMasterAdmin"})
public class AddMasterAdminServlet extends HttpServlet {

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
        String wsStaffName = request.getParameter("staffName");
        String wsStaffHpNo = request.getParameter("staffHpNo");
        String wsStaffEmail = request.getParameter("staffEmail");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!password.equals(confirmPassword)) {
            request.setAttribute("errMsg", "Passwords do not match.");
            RequestDispatcher view = request.getRequestDispatcher("AddMasterAdmin.jsp");
            view.forward(request, response);
        } else {
            HttpSession session = request.getSession(true);
            WebUser user = (WebUser) session.getAttribute("loggedInUser");
            int staffId = user.getStaffId();
            String token = user.getToken();
            WebUserDAO uDAO = new WebUserDAO();
            boolean isSuccess = uDAO.addMasterAdmin(staffId, token, wsStaffName, wsStaffEmail, wsStaffHpNo, password);
            if (isSuccess) {
                response.sendRedirect("Workshop.jsp");
            } else {
                request.setAttribute("errMsg", "Failed");
                RequestDispatcher view = request.getRequestDispatcher("AddMasterAdmin.jsp");
                view.forward(request, response);
            }
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
