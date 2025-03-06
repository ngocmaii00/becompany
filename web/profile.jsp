<%-- 
Document   : profile
Created on : Feb 20, 2025, 6:54:01 PM
Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp"%>

        <div class="md:mt-40 mt-32 flex lg:flex-row lg:gap-x-16 flex-col lg:items-start justify-center items-center">
            <div class="flex flex-col items-center">
                <div class="flex flex-col items-center">
                    <div class="bg-[url('images/head_left.png')] bg-cover bg-center size-[18em] rounded-full mb-8 shadow-lg border-2 border-[#563a2d]"></div>

                    <span class="peacesans-font uppercase text-5xl text-center mb-6">Account</span>
                </div>
                <div class="flex flex-col mx-20 justify-start">
                    <span class="flex flex-row items-center gap-x-4 mb-4">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-8">
                        <path d="M21.731 2.269a2.625 2.625 0 0 0-3.712 0l-1.157 1.157 3.712 3.712 1.157-1.157a2.625 2.625 0 0 0 0-3.712ZM19.513 8.199l-3.712-3.712-8.4 8.4a5.25 5.25 0 0 0-1.32 2.214l-.8 2.685a.75.75 0 0 0 .933.933l2.685-.8a5.25 5.25 0 0 0 2.214-1.32l8.4-8.4Z"></path>
                        <path d="M5.25 5.25a3 3 0 0 0-3 3v10.5a3 3 0 0 0 3 3h10.5a3 3 0 0 0 3-3V13.5a.75.75 0 0 0-1.5 0v5.25a1.5 1.5 0 0 1-1.5 1.5H5.25a1.5 1.5 0 0 1-1.5-1.5V8.25a1.5 1.5 0 0 1 1.5-1.5h5.25a.75.75 0 0 0 0-1.5H5.25Z"></path>
                        </svg>
                        <button class="notosans-font font-bold text-center text-xl hover:underline">
                            <a href="editprofile.jsp" class="text-nowrap">
                                Edit profile
                            </a>

                        </button>
                    </span>
                    <span class="flex flex-row items-center gap-x-4 mb-12">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-8">
                        <path fill-rule="evenodd" d="M16.5 3.75a1.5 1.5 0 0 1 1.5 1.5v13.5a1.5 1.5 0 0 1-1.5 1.5h-6a1.5 1.5 0 0 1-1.5-1.5V15a.75.75 0 0 0-1.5 0v3.75a3 3 0 0 0 3 3h6a3 3 0 0 0 3-3V5.25a3 3 0 0 0-3-3h-6a3 3 0 0 0-3 3V9A.75.75 0 1 0 9 9V5.25a1.5 1.5 0 0 1 1.5-1.5h6ZM5.78 8.47a.75.75 0 0 0-1.06 0l-3 3a.75.75 0 0 0 0 1.06l3 3a.75.75 0 0 0 1.06-1.06l-1.72-1.72H15a.75.75 0 0 0 0-1.5H4.06l1.72-1.72a.75.75 0 0 0 0-1.06Z" clip-rule="evenodd"></path>
                        </svg>
                        <button class="notosans-font font-bold text-xl hover:underline">
                            Log out
                        </button>
                    </span>
                </div>
            </div>
            <form class="mb-16">
                <div class=" bg-[#f2e6e6] w-fit mx-10 rounded-lg border-2 border-[#563a2d] notosans-font font-bold px-10 py-8 items-center">
                    <c:forEach items="${requestScope.data}" var="p">
                        <label for="username">
                            <span>Username: ${p.getUsername()}</span>
                            <span></span>
                        </label>
                        <label for="dob">
                            <span>Date Of Birth: ${p.getDob()}</span>
                            <span></span> 
                        </label>
                        <label for="status">
                            <span>Status: ${p.getStatus()}</span>
                            <span></span> 
                        </label>
                        <label for="email">
                            <span>Email: ${p.getEmail()}</span>
                            <span></span> 
                        </label>
                        <label for="address">
                            <span>Address: ${p.getAddress()}</span>
                            <span></span> 
                        </label>
                    </c:forEach>

                </div>
                <div class="flex flex-row justify-between mx-10 mt-4">
                    <button class="flex flex-row bg-[#563a2d] w-fit rounded-lg justify-center items-center px-4 py-3 gap-x-2">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="white" class="size-6">
                        <path fill-rule="evenodd" d="M7.28 7.72a.75.75 0 0 1 0 1.06l-2.47 2.47H21a.75.75 0 0 1 0 1.5H4.81l2.47 2.47a.75.75 0 1 1-1.06 1.06l-3.75-3.75a.75.75 0 0 1 0-1.06l3.75-3.75a.75.75 0 0 1 1.06 0Z" clip-rule="evenodd"></path>
                        </svg>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="white" class="size-7">
                        <path d="M11.47 3.841a.75.75 0 0 1 1.06 0l8.69 8.69a.75.75 0 1 0 1.06-1.061l-8.689-8.69a2.25 2.25 0 0 0-3.182 0l-8.69 8.69a.75.75 0 1 0 1.061 1.06l8.69-8.689Z"></path>
                        <path d="m12 5.432 8.159 8.159c.03.03.06.058.091.086v6.198c0 1.035-.84 1.875-1.875 1.875H15a.75.75 0 0 1-.75-.75v-4.5a.75.75 0 0 0-.75-.75h-3a.75.75 0 0 0-.75.75V21a.75.75 0 0 1-.75.75H5.625a1.875 1.875 0 0 1-1.875-1.875v-6.198a2.29 2.29 0 0 0 .091-.086L12 5.432Z"></path>
                        </svg>
                    </button>
                    <button type="submit" class="flex flex-row bg-[#563a2d] w-fit rounded-lg justify-center items-center px-6 py-3 gap-x-2 font-bold text-white text-lg">
                        Save Profile
                    </button>
                </div>
            </form>
        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>
