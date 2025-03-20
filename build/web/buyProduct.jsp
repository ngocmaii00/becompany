<%-- 
    Document   : buyProduct
    Created on : Feb 20, 2025, 5:11:56 PM
    Author     : DucAnh
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <title>BuyProductPage</title>
  </head>
  
  <body class="pt-20">
      <%@ page session="true" %>
       
       <%@include file="header.jsp" %>
    <div class="border-2 border-[#543520] mx-12 my-12 rounded-lg bg-[#f2e6e6]">
      <span
        class="grid grid-cols-11 font-bold text-xl items-center mx-16 text-[#543520] py-4 border-b-4 border-[#543520]">
        <label for="product" class="col-span-5">Product</label>
        <label for="price" class="col-span-2 text-center">Unit Price</label>
        <label for="quantity" class="col-span-2 text-center">Quantity</label>
        <label for="estimate" class="col-span-2 text-center">Total Price</label>
      </span>

        <c:forEach var="item" items="${requestScope.products}">
            <div class="grid grid-cols-11 mx-16 my-4">
                <div class="col-span-5 flex flex-row place-items-center gap-x-6">
                   
                    <div
                      class="rounded-lg border-2 border-[#543520] size-28 bg-cover bg-center bg-[url('${item.image}')]">
                    </div>

                    <div>
                      <span class="font-bold text-2xl text-[#543520]">${item.name}</span>

                      <div class="flex flex-row items-center gap-x-2 mt-3">
                        <div
                          class="border-2 w-fit border-[#543520] rounded-full px-2 text-center items-center"
                        >
                          ${item.size}
                        </div>
                        <div class="rounded-full size-6 bg-[${item.color}]"></div>
                      </div>
                    </div>
                </div>
                  



                  <div class="col-span-2 flex justify-center items-center">
                      <span class="text-xl font-bold text-[#543520]"><fmt:formatNumber value="${item.price}" type="currency"/></span>
                      
                  </div>

                  <div class="col-span-2 flex justify-center items-center">
                    <span class="text-2xl font-bold text-[#543520]"> ${item.quantity} </span>
                  </div>



                   <div class="col-span-2 flex justify-center items-center">
                      <span class="text-xl font-bold text-[#543520]"><fmt:formatNumber value="${item.estimate}" type="currency"/></span>
                      <input type="hidden" name="total-product-price" value="${item.estimate}">
                  </div>
                     
            </div>
        
        </c:forEach>
      
    <form action="vnpayajax" id="frmCreateOrder" method="POST"> 
      <div class=" mx-16 grid grid-cols-11 border-b-4 py-2 pb-8 border-[#543520]">
        <div class="flex flex-col col-span-5">
            <span class="font-bold text-2xl text-[#543520]">Message: </span>
                <textarea 
                id="purpose" name="purpose"
                class="border-2 border-[#543520] rounded p-2 w-full max-w-xs h-28 resize-none overflow-auto"
                placeholder="Text here..."></textarea>
        </div>


        <div class="flex flex-col col-span-4 justify-center">
            <span class="font-bold text-xl text-[#543520]">Shipping Option: </span>

                <select id="shippingOption" name="shippingOption" onchange="updateShippingPrice()" class="border-2 border-[#543520] w-full max-w-xs  px-2 py-2 rounded-lg my-2 bg-white">
                    <c:forEach items="${requestScope.shippings}" var="shippings" varStatus="stat">
                        <option data-price="${shippings.price}" value="${shippings.deliveryID}" ${stat.index==0?"checked":""} class="">${shippings.description} (${shippings.duration}-${shippings.duration+1} days)</option>
                    </c:forEach>  
                </select>
            <span class="font-bold text-xl text-[#543520]">Payment Method: </span>
            <select id="bankCode" name="bankCode" onchange="redirect()" class="payment-method border-2 border-[#543520] w-full max-w-xs  px-2 py-2 rounded-lg my-2 bg-white">
                <option value="CASH">Cash on Delivery</option>
                <option value="VNBANK">Domestic payment card</option>
                <option value="INTCARD">International payment card</option>
            </select>
<!--            <h5>Cách 2: Tách phương thức tại site của đơn vị kết nối</h5>
                       <input type="radio" id="bankCode" name="bankCode" value="VNPAYQR">
                       <label for="bankCode">Thanh toán bằng ứng dụng hỗ trợ VNPAYQR</label><br>
                       
                       <input type="radio" id="bankCode" name="bankCode" value="VNBANK">
                       <label for="bankCode">Thanh toán qua thẻ ATM/Tài khoản nội địa</label><br>
                       
                       <input type="radio" id="bankCode" name="bankCode" value="INTCARD">
                       <label for="bankCode">Thanh toán qua thẻ quốc tế</label><br>
-->
        </div>


        <div class="flex flex-row col-span-2 justify-center items-center">
            <span id="shippingPrice" name="shipping-fee" class="font-bold text-2xl text-[#543520]"></span>
            
        </div>
      </div>




      <div class="grid grid-cols-11 mx-16 py-6">
        <span class="flex col-span-5 font-bold text-3xl text-[#543520]">
          Total Amount: 
        </span>

        <span class="flex col-span-2 font-bold text-3xl text-[#543520] text-center justify-center">
            <p id="totalValue"></p>
            <input type="hidden" name="amount" id="amount">
            
        </span>
        <div class="col-span-2"></div>
        <div class="flex col-span-2 justify-center">
        <button type="submit" class="border-2 border-[#543520] bg-[#543520] text-white rounded-md w-32 justify-center items-center text-center">
          <span class="font-bold text-2xl">Pay</span>
        </button>
      </div>
      </div>
    </form>
    </div>
     
        
        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script>
          function redirectToServlet() {
          // Create a form element
          const form = document.createElement("form");
          form.method = "POST";
          form.action = "checkout_info"; // Replace with your servlet URL

          // Add data as hidden inputs
          const input1 = document.createElement("input");
          input1.type = "hidden";
          input1.name = "amount"; // Replace with your parameter name
          input1.value = document.querySelector("#amount").value; // Replace with your parameter value
          form.appendChild(input1);

          const input2 = document.createElement("input");
          input2.type = "hidden";
          input2.name = "purpose"; // Another parameter name
          input2.value = document.querySelector("#purpose").value; // Another parameter value
          form.appendChild(input2);
          
          const input3 = document.createElement("input");
          input3.type = "hidden";
          input3.name = "deliveryId"; // Another parameter name
          input3.value = document.querySelector("#shippingOption").value; // Another parameter value
          form.appendChild(input3);

          const input4 = document.createElement("input");
          input4.type = "hidden";
          input4.name = "bankCode"; // Another parameter name
          input4.value = document.querySelector("#bankCode").value; // Another parameter value
          form.appendChild(input4);
          // Add as many fields as needed
          // ...

  // Append the form to the body and submit it
  document.body.appendChild(form);
  form.submit();
}
        </script>
        <script id="vnpayScript" type="text/javascript">
        
            $("#frmCreateOrder").submit(function (event) {
                event.preventDefault();
                var postData = $("#frmCreateOrder").serialize();
                var submitUrl = $("#frmCreateOrder").attr("action");
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'json',
                    success: function (response) {
                        if (response.code === '00') {
                            if (window.vnpay) {
                                vnpay.open({width: 768, height: 600, url: response.data});
                            } else {
                                location.href = response.data;
                            }
                        } else {
                            alert(response.message);
                        }
                      },
                        error: function (xhr, status, error) {
                            // Redirecting to a servlet
                            //indow.location.href = "checkout_info";
                            redirectToServlet();
                        }
                    
                });
            });
        
        </script>       
      <script>
          const formatter = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND',
          });
              function redirect(){
              const payment_method =  document.querySelector(".payment-method").value;
              const amount = document.querySelector("#amount");
              const form = document.querySelector("#frmCreateOrder");
              const vnpayScript = document.querySelector("#vnpayScript");

              if(payment_method === "CASH"){
                  form.setAttribute("action","checkout_info");
                  vnpayScript.setAttribute("type","text/plain");
                  
              }else if(payment_method === "VNBANK" || payment_method === "INTCARD"){
                  form.setAttribute("action","vnpayajax");
                  
                  vnpayScript.setAttribute("type","text/javascript");
                  
                  
              }

          }
          let shipping = document.querySelector("#shippingOption");
          function updateShippingPrice(){
              let shippingOption = document.querySelector("#shippingOption");
              let shippingPrice = parseFloat(shippingOption.options[shippingOption.selectedIndex].getAttribute("data-price"));
              document.querySelector("#shippingPrice").innerText = formatter.format(shippingPrice);

              let allProductPrice = document.querySelectorAll("[name='total-product-price']");
              let totalPrice = 0;
              allProductPrice.forEach(function(item) {
                  totalPrice += parseFloat(item.value);
              });
              
              let totalValue = document.querySelector("#totalValue");
              totalValue.innerText = formatter.format(totalPrice + shippingPrice);
              document.querySelector("#amount").value = totalPrice + shippingPrice;
            }
        window.onload=function(){  
          updateShippingPrice();
          redirect();
          
        }
       
      </script>
  </body>
  </html>