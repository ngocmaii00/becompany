<%-- 
    Document   : cart
    Created on : Feb 17, 2025, 9:31:39 PM
    Author     : DucAnhDepTrai
--%>
<%@page import="java.util.*" %>
<%@page import="java.net.URLDecoder" %>
<%@page import="java.nio.charset.StandardCharsets" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.tailwindcss.com"></script>
        <title>CartPage</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        
        <div class="mt-28">
            <span class="grid grid-cols-11 font-bold text-xl items-center mx-16 text-[#543520] py-4">
                <input type="checkbox" id="selectAll" class="col-span-1 size-5 mx-12 accent-[#543520]"/>
                <label for="product" class="col-span-3">Product</label>
                <label for="price" class="col-span-2 text-center">Price</label>
                <label for="quantity" class="col-span-2 text-center">Quantity</label>
                <label for="estimate" class="col-span-2 text-center">Estimate</label>
                <label for="action" class="col-span-1 text-center">Action</label>
            </span>

            <div class="border-2 border-[#543520] mx-16 rounded-lg py-4 bg-[#f2e6e6]">
                <%
                    Cookie[] cookies = request.getCookies();
                    String cartData = "";
                    if (cookies != null) {
                        for (Cookie cookie : cookies) {
                            if (cookie.getName().equals("cart")) {
                                cartData = URLDecoder.decode(cookie.getValue(), StandardCharsets.UTF_8.toString());
                                break;
                            }
                        }
                    }

                    if (!cartData.isEmpty()) {
                        String[] items = cartData.split(",");
                        request.setAttribute("cartItems", items);
                    }
                %>
                <c:choose>
                    <c:when test="${not empty cartItems}">
                        <c:forEach var="item" items="${cartItems}">
                            <%
                                String[] details = ((String) pageContext.getAttribute("item")).split("\\$");
                                if (details.length == 7) {
                                    String id = details[0];
                                    String image = details[1];
                                    String name = details[2];
                                    String size = details[3];
                                    String color = details[4];
                                    String price = details[5];
                                    String quantity = details[6];
                                    double estimate = Double.parseDouble(price) * Integer.parseInt(quantity);
                                    
                                    pageContext.setAttribute("id", id);
                                    pageContext.setAttribute("image", image);
                                    pageContext.setAttribute("name", name);
                                    pageContext.setAttribute("size", size);
                                    pageContext.setAttribute("color", color);
                                    pageContext.setAttribute("price", price);
                                    pageContext.setAttribute("quantity", quantity);
                                    pageContext.setAttribute("estimate", String.format("%.2f", estimate));
                                }
                            %>
                            <div class="grid grid-cols-11 items-center py-4">
                                <!-- item-checkbox -->
                                <input type="checkbox" class="item-checkbox col-span-1 size-5 mx-12 accent-[#543520]" data-id="${id}" data-estimate="${estimate}"/>
                                <div class="col-span-3">
                                    <div class="flex flex-row place-items-center gap-x-6">
                                        <div class="rounded-lg border-2 border-[#543520] size-28 bg-cover bg-center" style="background-image: url('${image}')"></div>
                                        <div>
                                            <span class="font-bold text-3xl text-[#543520]">${name}</span>
                                            <div class="flex flex-row items-center gap-x-2 mt-3">
                                                <div class="border-2 w-fit border-[#543520] rounded-full px-2">${size}</div>
                                                <div class="rounded-full size-6" style="background-color: ${color}"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-span-2 text-center text-xl font-bold">
                                    <span>${price}</span>
                                </div>
                                <div class="col-span-2 place-items-center">
                                    <div class="flex flex-row border-2 border-black h-fit w-fit rounded-md col-span-2 items-center">
                                        <button onclick="updateQuantity('${id}', ${quantity + 1}, '${size}', '${color}')">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#543520" class="size-6">
                                                <path fill-rule="evenodd" d="M12 2.25c-5.385 0-9.75 4.365-9.75 9.75s4.365 9.75 9.75 9.75 9.75-4.365 9.75-9.75S17.385 2.25 12 2.25ZM12.75 9a.75.75 0 0 0-1.5 0v2.25H9a.75.75 0 0 0 0 1.5h2.25V15a.75.75 0 0 0 1.5 0v-2.25H15a.75.75 0 0 0 0-1.5h-2.25V9Z" clip-rule="evenodd"/>
                                            </svg>
                                        </button>
                                        <input type="text" value="${quantity}" class="bg-transparent outline-none w-8 text-center"/>
                                        <button onclick="updateQuantity('${id}', ${quantity - 1}, '${size}', '${color}')">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#543520" class="size-6">
                                                <path fill-rule="evenodd" d="M12 2.25c-5.385 0-9.75 4.365-9.75 9.75s4.365 9.75 9.75 9.75 9.75-4.365 9.75-9.75S17.385 2.25 12 2.25Zm3 10.5a.75.75 0 0 0 0-1.5H9a.75.75 0 0 0 0 1.5h6Z" clip-rule="evenodd"/>
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                                <div class="col-span-2 text-center text-xl font-bold">
                                    <span>${estimate}</span>
                                </div>
                                <div class="col-span-1 place-items-center">
                                    <div class="flex flex-row gap-x-4 lg:mx-8 mx-4 col-span-1 items-end">
                                        <button class="relative group">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#543520" class="size-6">
                                                <path d="M21.731 2.269a2.625 2.625 0 0 0-3.712 0l-1.157 1.157 3.712 3.712 1.157-1.157a2.625 2.625 0 0 0 0-3.712ZM19.513 8.199l-3.712-3.712-8.4 8.4a5.25 5.25 0 0 0-1.32 2.214l-.8 2.685a.75.75 0 0 0 .933.933l2.685-.8a5.25 5.25 0 0 0 2.214-1.32l8.4-8.4Z"/>
                                                <path d="M5.25 5.25a3 3 0 0 0-3 3v10.5a3 3 0 0 0 3 3h10.5a3 3 0 0 0 3-3V13.5a.75.75 0 0 0-1.5 0v5.25a1.5 1.5 0 0 1-1.5 1.5H5.25a1.5 1.5 0 0 1-1.5-1.5V8.25a1.5 1.5 0 0 1 1.5-1.5h5.25a.75.75 0 0 0 0-1.5H5.25Z"/>
                                            </svg>
                                            <div class="absolute bottom-full left-1/2 transform -translate-x-1/2 mb-2 w-max px-2 py-1 text-sm text-white bg-[#543520] rounded shadow-lg opacity-0 group-hover:opacity-100">Edit</div>
                                        </button>
                                        <button class="relative group" onclick="removeItem('${id}', '${size}', '${color}')">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#543520" class="size-6">
                                                <path fill-rule="evenodd" d="M16.5 4.478v.227a48.816 48.816 0 0 1 3.878.512.75.75 0 1 1-.256 1.478l-.209-.035-1.005 13.07a3 3 0 0 1-2.991 2.77H8.084a3 3 0 0 1-2.991-2.77L4.087 6.66l-.209.035a.75.75 0 0 1-.256-1.478A48.567 48.567 0 0 1 7.5 4.705v-.227c0-1.564 1.213-2.9 2.816-2.951a52.662 52.662 0 0 1 3.369 0c1.603.051 2.815 1.387 2.815 2.951Zm-6.136-1.452a51.196 51.196 0 0 1 3.273 0C14.39 3.05 15 3.684 15 4.478v.113a49.488 49.488 0 0 0-6 0v-.113c0-.794.609-1.428 1.364-1.452Zm-.355 5.945a.75.75 0 1 0-1.5.058l.347 9a.75.75 0 1 0 1.499-.058l-.346-9Zm5.48.058a.75.75 0 1 0-1.498-.058l-.347 9a.75.75 0 0 0 1.5.058l.345-9Z" clip-rule="evenodd"/>
                                            </svg>
                                            <div class="absolute bottom-full left-1/2 transform -translate-x-1/2 mb-2 w-max px-2 py-1 text-sm text-white bg-[#543520] rounded shadow-lg opacity-0 group-hover:opacity-100">Remove</div>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center text-xl font-bold text-[#543520] py-4">Your cart is empty!</div>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Tổng tiền + nút mua -->
            <div class="mt-12 bottom-8 left-0 right-0 grid grid-cols-9 border-2 border-[#543520] rounded-lg bg-[#f2e6e6] mx-16 h-20 items-center">
                <div class="col-span-3 text-center">
                    <span class="text-3xl font-bold text-[#543520]"> Total Amount: </span>
                </div>
                <div class="col-span-4 text-center">
                    <span id="totalAmount" class="text-4xl font-bold text-[#543520]">0.00$</span>
                </div>
                <div class="col-span-2 flex justify-center">
                    <button class="flex border-2 border-[#543520] bg-[#543520] rounded-md w-40 h-14 text-center items-center justify-center align-center">
                        <span class="text-2xl font-bold text-white">Buy</span>
                    </button>
                </div>
            </div>
        </div>

        <script>
            function updateQuantity(id, newQuantity, size, color) {
                if (newQuantity < 1) return;
                window.location.href = "cart?action=update&id=" + id + "&quantity=" + newQuantity + "&size=" + size + "&color=" + color;
            }

            function removeItem(id, size, color) {
                window.location.href = "cart?action=remove&id=" + id + "&size=" + size + "&color=" + color;
            }

            // Tổng tiền theo sản phẩm được tick checkbox
            function updateTotalAmount() {
                const checkboxes = document.querySelectorAll('.item-checkbox');
                let total = 0;

                checkboxes.forEach(checkbox => {
                    if (checkbox.checked) {
                        const estimate = parseFloat(checkbox.getAttribute('data-estimate'));
                        total += estimate;
                    }
                });

                document.getElementById('totalAmount').textContent = total.toFixed(2) + '$';
            }

            // Tick checkbox
            document.querySelectorAll('.item-checkbox').forEach(checkbox => {
                checkbox.addEventListener('change', updateTotalAmount);
            });

            // Checkbox tổng
            document.getElementById('selectAll').addEventListener('change', function() {
                const isChecked = this.checked;
                const itemCheckboxes = document.querySelectorAll('.item-checkbox');

                itemCheckboxes.forEach(checkbox => {
                    checkbox.checked = isChecked;
                });

                updateTotalAmount();
            });

            // tổng 1st
            window.onload = function() {
                updateTotalAmount();
            };
        </script>
    </body>
</html>