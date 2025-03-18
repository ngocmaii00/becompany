<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<fmt:setLocale value="vi_VN" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout Success</title>
    <style>
        .peacesans-font {
            font-family: 'Peace Sans', sans-serif;
        }
        .notosans-font {
            font-family: 'Noto Sans', sans-serif;
        }
    </style>
</head>
<body class="flex flex-col my-10 gap-4 items-center">
    <div class="flex flex-row gap-6 justify-between p-8" style="background-color: #4f362b; height: 90%; width: 100%">
        <!-- Left Section - Logo & Company Name -->
        <div class="flex flex-col items-center justify-center p-8">
            <img src="/becompany/image/head.png" class="w-[60%]"/>
            <h1 class="text-gray-50 peacesans-font text-center mt-7 uppercase font-extrabold" style="font-size: 5vw">
                becompany
            </h1>
        </div>

        <!-- Right Section - Checkout Card -->
        <div class="font-medium font-bold w-[70%] flex items-center justify-center">
            <div class="flex flex-col py-8 px-10 bg-[#f2e6e6] rounded-3xl border-3 border-gray-950 w-[800px]" style="margin: 6% 7%">
                <h1 class="basic uppercase font-bold peacesans-font text-3xl text-center text-[#563a2d] mb-8">
                    Checkout Successful
                </h1>
    
                <!-- Order Summary -->
                <div class="bg-white rounded-xl p-4 mb-6">
                    <h2 class="text-[#563a2d] peacesans-font text-lg mb-2">Order Summary</h2>
                    <hr class="bg-[#563a2d]/20 mb-3" />
                    <div class="space-y-2 notosans-font">
                        <div class="flex justify-between">
                            <span class="text-[#563a2d]/80">Order ID:</span>
                            <span class="text-[#563a2d] font-semibold">#${requestScope.orderId}</span>
                        </div>
                        <div class="flex justify-between">
                            <span class="text-[#563a2d]/80">Date:</span>
                            <span class="text-[#563a2d]">${requestScope.date}</span>
                        </div>
                        <div class="flex justify-between">
                            <span class="text-[#563a2d]/80">Total Amount:</span>
                            <span class="text-[#563a2d] font-semibold"><fmt:formatNumber value="${requestScope.totalAmount}" type="currency"/></span>
                        </div>
                    </div>
                </div>

                <!-- Ordered Products -->
                <div class="bg-white rounded-xl p-4 mb-6">
                    <h2 class="text-[#563a2d] peacesans-font text-lg mb-2">Ordered Products</h2>
                    <hr class="bg-[#563a2d]/20 mb-3" />
                    <div class="grid grid-cols-2 gap-4 notosans-font">
                        <!-- Product Item 1 -->
                        <c:forEach items="${requestScope.order}" var="item">
                        <div class="flex items-center gap-4 p-4 bg-[#563a2d]/5 rounded-lg">
                            <div class="w-16 h-16 bg-[#563a2d]/10 rounded-lg flex items-center justify-center">
                                <div
                                    class="rounded-lg border-2 border-[#543520] size-20 bg-cover bg-center bg-[url('${item.image}')]">
                                  </div>
                            </div>
                            <div class="flex-1">
                                <h3 class="text-[#563a2d] font-semibold">${item.name}</h3>
                                <p class="text-[#563a2d]/60 text-sm">Quantity: ${item.quantity}</p>
                            </div>
                                <span class="text-[#563a2d] font-semibold"><fmt:formatNumber value="${item.estimate}" type="currency"/></span>
                        </div>
                        </c:forEach>
                        
                    </div>
                </div>

                <!-- Navigation Buttons -->
                <div class="flex justify-between mb-6">
                    <a href="${pageContext.request.contextPath}/home" 
                       class="inline-flex justify-center items-center bg-white text-lg p-2 border-2 border-gray-950 rounded-xl hover:bg-[#563a2d]/5 transition-colors"
                       style="width: 49%">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#563a2d" class="md:size-8 size-10">
                            <path d="M11.47 3.841a.75.75 0 0 1 1.06 0l8.69 8.69a.75.75 0 1 0 1.06-1.061l-8.689-8.69a2.25 2.25 0 0 0-3.182 0l-8.69 8.69a.75.75 0 1 0 1.061 1.06l8.69-8.689Z" />
                            <path d="m12 5.432 8.159 8.159c.03.03.06.058.091.086v6.198c0 1.035-.84 1.875-1.875 1.875H15a.75.75 0 0 1-.75-.75v-4.5a.75.75 0 0 0-.75-.75h-3a.75.75 0 0 0-.75.75V21a.75.75 0 0 1-.75.75H5.625a1.875 1.875 0 0 1-1.875-1.875v-6.198a2.29 2.29 0 0 0 .091-.086L12 5.432Z" />
                        </svg>
                        <p class="notosans-font ml-2">Home Page</p>
                    </a>
                    <a href="${pageContext.request.contextPath}/order" 
                       class="inline-flex justify-center items-center bg-white text-lg p-2 border-2 border-gray-950 rounded-xl hover:bg-[#563a2d]/5 transition-colors"
                       style="width: 49%">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="#563a2d" viewBox="0 0 24 24" stroke-width="1.5" stroke="#563a2d" class="size-10">
                            <path d="M8.25 18.75a1.5 1.5 0 0 1-3 0m3 0a1.5 1.5 0 0 0-3 0m3 0h6m-9 0H3.375a1.125 1.125 0 0 1-1.125-1.125V14.25m17.25 4.5a1.5 1.5 0 0 1-3 0m3 0a1.5 1.5 0 0 0-3 0m3 0h1.125c.621 0 1.129-.504 1.09-1.124a17.902 17.902 0 0 0-3.213-9.193 2.056 2.056 0 0 0-1.58-.86H14.25M16.5 18.75h-2.25m0-11.177v-.958c0-.568-.422-1.048-.987-1.106a48.554 48.554 0 0 0-10.026 0 1.106 1.106 0 0 0-.987 1.106v7.635m12-6.677v6.677m0 4.5v-4.5m0 0h-12" />
                        </svg>
                        <p class="notosans-font ml-2">Order Page</p>
                    </a>
                </div>

                <hr class="my-8 bg-[#563a2d]/20" />

                <!-- Email Confirmation -->
                <p class="text-center text-[#563a2d]/80 notosans-font">
                    
                </p>
            </div>
        </div>
    </div>

    <!-- Include Tailwind CSS -->   
    <script src="https://cdn.tailwindcss.com"></script>
</body>
</html>