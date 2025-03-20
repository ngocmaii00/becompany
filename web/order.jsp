<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BeCompany</title>
        <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
        <link rel="stylesheet" href="css/styles.css"/>
        <link rel="stylesheet" href="css/responsiveHome.css"/>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <c:set var="user" value="${sessionScope.user}" />

        <main>
            <div class="grid md:grid-cols-3 md:mt-10 mt-8">
                <div class="flex flex-col items-center py-4 md:col-span-1">

                    <div class="flex flex-col items-center">
                        <img src="${user.image}"
                             class="avatar bg-cover bg-center size-[18em] rounded-full mb-8 shadow-lg border-2 border-[#563a2d]"></img>

                        <span class="peacesans-font uppercase text-5xl text-center mb-6">${user.username}</span>
                    </div>
                    <div class="flex flex-col mx-20 justify-start">
                        <span class="flex flex-row items-center gap-x-4 mb-12">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                                 class="size-8">
                            <path fill-rule="evenodd"
                                  d="M16.5 3.75a1.5 1.5 0 0 1 1.5 1.5v13.5a1.5 1.5 0 0 1-1.5 1.5h-6a1.5 1.5 0 0 1-1.5-1.5V15a.75.75 0 0 0-1.5 0v3.75a3 3 0 0 0 3 3h6a3 3 0 0 0 3-3V5.25a3 3 0 0 0-3-3h-6a3 3 0 0 0-3 3V9A.75.75 0 1 0 9 9V5.25a1.5 1.5 0 0 1 1.5-1.5h6ZM5.78 8.47a.75.75 0 0 0-1.06 0l-3 3a.75.75 0 0 0 0 1.06l3 3a.75.75 0 0 0 1.06-1.06l-1.72-1.72H15a.75.75 0 0 0 0-1.5H4.06l1.72-1.72a.75.75 0 0 0 0-1.06Z"
                                  clip-rule="evenodd"></path>
                            </svg>
                            <a href="logout" class="notosans-font font-bold text-xl hover:underline">
                                Log out
                            </a>
                        </span>
                    </div>
                </div>
                <div class="flex flex-col md:col-span-2">
                    <c:forEach items="${requestScope.data}" var="o">
                        <div class="border-2 border-[#543520] mb-4 mx-8 rounded-lg flex justify-between bg-[#f2e6e6] items-center notosans-font">
                            <div class="flex flex-row mt-4">
                                <div class="bg-[url('${o.image}')] h-20 w-20 bg-cover border-2 border-[#543520] rounded-lg mx-4 mb-4"></div>
                                <div>
                                    <span class="font-bold text-xl">${o.productName}</span>
                                    <div class="flex flex-row gap-x-2 mt-2">
                                        <div class="border-2 border-[#543520] rounded-lg w-fit px-2 text-[12px]">${o.size}</div>
                                        <div class="bg-[${o.color}] border-2 border-[#543520] size-5 bg-cover rounded-full"></div>
                                    </div>
                                </div>
                            </div>
                            <span>x${o.boughtQuantity}</span>
                            <div class="mx-4">
                                <span class="font-bold text-2xl">${o.boughtQuantity*o.price}$</span>
                            </div>

                        </div>
                        <div class="flex justify-end mx-8 mb-4">
                            <c:if test="${o.orderStatus != 'Completed'}">
                                <button type="submit" class="bg-[#563a2d] w-fit rounded-lg justify-end items-center px-4 py-2 font-bold text-white text-md opacity-60">
                                    ${o.orderStatus}
                                </button>
                            </c:if>
                            <c:if test="${o.orderStatus == 'Completed'}">
                                <button type="submit" class="bg-[#563a2d] w-fit rounded-lg justify-end items-center px-4 py-2 font-bold text-white text-md">
                                    ${o.orderStatus}
                                </button>
                            </c:if>
                        </div>
                    </c:forEach>
                    <a href="home">   
                        <button class="flex flex-row bg-[#563a2d] w-fit rounded-lg justify-center items-center px-4 py-3 gap-x-2 mx-8 mb-12">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="white" class="size-6">
                            <path fill-rule="evenodd" d="M7.28 7.72a.75.75 0 0 1 0 1.06l-2.47 2.47H21a.75.75 0 0 1 0 1.5H4.81l2.47 2.47a.75.75 0 1 1-1.06 1.06l-3.75-3.75a.75.75 0 0 1 0-1.06l3.75-3.75a.75.75 0 0 1 1.06 0Z" clip-rule="evenodd"></path>
                            </svg>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="white" class="size-7">
                            <path d="M11.47 3.841a.75.75 0 0 1 1.06 0l8.69 8.69a.75.75 0 1 0 1.06-1.061l-8.689-8.69a2.25 2.25 0 0 0-3.182 0l-8.69 8.69a.75.75 0 1 0 1.061 1.06l8.69-8.689Z"></path>
                            <path d="m12 5.432 8.159 8.159c.03.03.06.058.091.086v6.198c0 1.035-.84 1.875-1.875 1.875H15a.75.75 0 0 1-.75-.75v-4.5a.75.75 0 0 0-.75-.75h-3a.75.75 0 0 0-.75.75V21a.75.75 0 0 1-.75.75H5.625a1.875 1.875 0 0 1-1.875-1.875v-6.198a2.29 2.29 0 0 0 .091-.086L12 5.432Z"></path>
                            </svg>
                        </button>
                    </a> 
                </div>
            </div>
        </main>

        <%@include file="footer.jsp" %>
    </body>
</html>