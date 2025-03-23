/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import utilities.VNPayConfig;

/**
 *
 * @author zeryus
 */
@WebServlet(name = "VNPayResponseServlet", urlPatterns = {"/vnpay-response"})
public class VNPayResponseServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        //order infomation sent from ajaxServlet
        String purpose =  (String)session.getAttribute("purpose");
        String shippingOption = (String) session.getAttribute("shippingOption");
        String bankCode =  (String) session.getAttribute("bankCode");
        String amount = (String) session.getAttribute("amount");
        
            //delete used Session
            session.removeAttribute("purpose");
            session.removeAttribute("shippingOption");
            session.removeAttribute("bankCode");
        Map fields = new HashMap();
        for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
            String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
            String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                fields.put(fieldName, fieldValue);
            }
        }

        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
        if (fields.containsKey("vnp_SecureHashType")) {
            fields.remove("vnp_SecureHashType");
        }
            if (fields.containsKey("vnp_SecureHash")) {
            fields.remove("vnp_SecureHash");
        }
        String signValue = VNPayConfig.hashAllFields(fields);
        /*request.getParameter("vnp_TxnRef")%></label>
                </div>    
                <div class="form-group">
                    <label >Số tiền:</label>
                    <label><%=request.getParameter("vnp_Amount")%></label>
                </div>  
                <div class="form-group">
                    <label >Mô tả giao dịch:</label>
                    <label><%=request.getParameter("vnp_OrderInfo")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã lỗi thanh toán:</label>
                    <label><%=request.getParameter("vnp_ResponseCode")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã giao dịch tại CTT VNPAY-QR:</label>
                    <label><%=request.getParameter("vnp_TransactionNo")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã ngân hàng thanh toán:</label>
                    <label><%=request.getParameter("vnp_BankCode")%></label>
                </div> 
                <div class="form-group">
                    <label >Thời gian thanh toán:</label>
                    <label><%=request.getParameter("vnp_PayDate")%>*/
        Double  doublevnp_Amount = Double.valueOf(request.getParameter("vnp_Amount"))/100;
        String vnp_Amount = doublevnp_Amount.toString();
//        String vnp_OrderInfo = request.getParameter("vnp_OrderInfo");
//        String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
//        String vnp_TransactionNo = request.getParameter("vnp_TransactionNo");
//        String vnp_BankCode = request.getParameter("vnp_BankCode");
//        String vnp_PayDate = request.getParameter("vnp_PayDate");

        if (signValue.equals(vnp_SecureHash)) {
            if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                    session.setAttribute("amount", vnp_Amount);
                    session.setAttribute("purpose", purpose);
                    session.setAttribute("shippingOption", shippingOption);
                    session.setAttribute("bankCode", bankCode);
                request.getRequestDispatcher("checkout_info").forward(request, response);
            } else {
                request.setAttribute("error", "Transaction failed, please try again!");
                request.getRequestDispatcher("checkout").forward(request, response);
            }

        } else {
            System.err.println("Invalid Signature");
        }
    }
    

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
