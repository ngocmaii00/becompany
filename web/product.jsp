<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN" />
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="icon" type="image/svg+xml" href="images/head.png" />
            <title>Product</title>
            <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
            <link rel="stylesheet" href="css/index.css">
    </head>

    <body class="bg-white">
                    <%@include file="header.jsp" %>
                    <c:set var="product" value="${requestScope.product}" />
                    <c:set var="teddy" value="${requestScope.teddy}" />

                    <main class="grid lg:grid-cols-5 md:grid-cols-2 grid-cols-1 mt-20 lg:mt-16">
                        <div
                            class="relative aspect-square mx-10 md:mx-0 md:ms-10 col-span-1 lg:col-span-2 lg:scale-95 scale-100">
                            <div class="relative mt-10 mb-5">
                                <ul id="slider">
                                    <li class="relative">
                                        <img id="main-img"
                                             class="aspect-square h-full w-full object-cover border-[3px] border-gray-900 rounded-[20px]"
                                             src="${product.getImages()[0]}" alt="">
                                    </li>
                                </ul>
                            </div>
                            <div class="flex flex-row flex-none h-25 overflow-auto scrollbar-hidden">
                                <c:forEach items="${product.getImages()}" var="img" varStatus="status">
                                    <label class="inline-block aspect-23/18 mr-2 h-full w-auto">
                                        <input onclick="selectImg(this)" type="radio"
                                               id="img-${status.index + 1}" name="img" value="" class="hidden peer"
                                               ${status.index==0 ? 'checked' : '' } />
                                        <div for="img-${status.index + 1}"
                                             class="aspect-23/18 h-full w-auto rounded-[18px] cursor-pointer border-gray-900  border-2  hover:bg-gray-100 peer peer-checked:border-[#4a4b5c] peer-checked:rounded-[21px] peer-checked:border-[4px]">
                                            <img class="h-full w-full object-cover rounded-[17px]" src="${img}"
                                                 alt="">
                                        </div>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>

                        <div id="description" class="px-10 lg:col-span-3 col-span-1 lg:mt-20 mt-16">
                            <div class="flex flex-row justify-between items-center mb-6">
                                <p
                                    class=" text-[#563a2d] lg:text-5xl text-4xl uppercase peacesans-font justify-items-start">
                                    ${product.getProductName()}</p>
                                <div class="flex flex-row justify-center items-baseline text-nowrap">
                                    <!--Print yellow Star -->
                                    <c:if test="${requestScope.rating != -1}">
                                        <c:forEach begin="1" end="${requestScope.rating}">
                                            <svg class="w-4 h-4 text-yellow-300 ms-1" aria-hidden="true"
                                                 xmlns="http://www.w3.org/2000/svg" fill="currentColor"
                                                 viewBox="0 0 22 20">
                                                <path
                                                    d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z" />
                                            </svg>
                                        </c:forEach>

                                        <!--Print grayed-out Star -->
                                        <c:forEach begin="1" end="${5-requestScope.rating}">
                                            <svg class="w-4 h-4 text-gray-300 dark:text-gray-500 ms-1"
                                                 aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                                 fill="currentColor" viewBox="0 0 22 20">
                                                <path
                                                    d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z" />
                                            </svg>
                                        </c:forEach>
                                        <p
                                            class="ms-1 text-xl font-semibold notosans-font text-lg text-gray-500 ">
                                            &nbsp; ${requestScope.rating}</p>
                                        </c:if>
                                        <c:if test="${requestScope.rating == -1}">
                                        <p
                                            class="ms-1 text-xl font-semibold notosans-font text-lg text-gray-500 ">
                                            No rating</p>
                                        </c:if>
                                </div>
                            </div>
                            <div
                                class="flex flex-row justify-between text-[#563a2d] bg-[#f2e6e6] py-4 px-4 mb-8">
                                <div class="text-4xl peacesans-font text-nowrap" id="price">
                                    <fmt:formatNumber value="${requestScope.price}" type="currency"/></div>
                                <div class="flex flex-row w-3/4 justify-end gap-x-2 items-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#543520"
                                         class="size-8">
                                        <path
                                            d="M3.375 3C2.339 3 1.5 3.84 1.5 4.875v.75c0 1.036.84 1.875 1.875 1.875h17.25c1.035 0 1.875-.84 1.875-1.875v-.75C22.5 3.839 21.66 3 20.625 3H3.375Z" />
                                        <path fill-rule="evenodd"
                                              d="m3.087 9 .54 9.176A3 3 0 0 0 6.62 21h10.757a3 3 0 0 0 2.995-2.824L20.913 9H3.087Zm6.163 3.75A.75.75 0 0 1 10 12h4a.75.75 0 0 1 0 1.5h-4a.75.75 0 0 1-.75-.75Z"
                                              clip-rule="evenodd" />
                                    </svg>

                                    <p class="notosans-font font-bold text-2xl" id="instock"></p>
                                </div>
                            </div>
                            <div class=" flex flex-row justify-start items-center mb-8">

                                <p class="text-[#563a2d] font-semibold text-xl notosans-font inline-block">
                                    Color:</p>
                                <div class="flex gap-x-4 ms-8">
                                    <c:forEach items="${requestScope.color}" var="color" varStatus="status">
                                        <!-- if the -->
                                        <c:if test="${color.value == false}">
                                            <label class="relative h-full w-auto cursor-pointer">
                                                <input name="color" type="radio"

                                                       class="peer aspect-square size-8 w-auto cursor-pointer appearance-none rounded-full border-[3px] border bg-[${color.key}] border-gray-900 checked:border-[${color.key}] text-[${color.key}] checked:ring-[#000000] focus:ring-[${color.key}] transition-all"
                                                       value="${color.key}" ${status.index == 0?"checked":""} onclick="showSize();submitForm();" />
                                                <span
                                                    class="absolute aspect-square size-4 rounded-full opacity-0 peer-checked:opacity-100 transition-opacity duration-200 top-75/100 left-7/10 transform -translate-x-1/2 -translate-y-1/2">
                                                    <svg xmlns="http://www.w3.org/2000/svg"
                                                         class="text-[#ffffff]" fill="none" viewBox="0 0 24 24"
                                                         stroke-width="7" stroke="currentColor" class="size-6">
                                                        <path stroke-linecap="round" stroke-linejoin="round"
                                                              d="m4.5 12.75 6 6 9-13.5" />
                                                    </svg>

                                                </span>
                                            </label>
                                        </c:if>
                                        <c:if test="${color.value == true}">
                                            <label class="relative h-full w-auto">
                                                <input name="color" type="radio"

                                                       class="peer aspect-square size-8 w-auto cursor-pointer appearance-none rounded-full border-2 border bg-[${color.key}] border-gray-300    checked:border-gray-900 text-[${color.key}] checked:ring-[#000000] focus:ring-[${color.key}] transition-all"
                                                       value="${color.key}" ${status.index == 0?"checked":""} onclick="showSize();submitForm();" />
                                                <span
                                                    class="absolute aspect-square size-4  rounded-full opacity-0 peer-checked:opacity-100 transition-opacity duration-200 top-75/100 left-7/10 transform -translate-x-1/2 -translate-y-1/2">
                                                    <svg xmlns="http://www.w3.org/2000/svg"
                                                         class="text-[#000000]" fill="none" viewBox="0 0 24 24"
                                                         stroke-width="7" stroke="currentColor" class="size-6">
                                                        <path stroke-linecap="round" stroke-linejoin="round"
                                                              d="m4.5 12.75 6 6 9-13.5" />
                                                    </svg>
                                                </span>
                                            </label>
                                        </c:if>
                                    </c:forEach>

                                </div>
                            </div>


                            <div class="flex flex-row items-center mb-8">
                                <p class="text-[#563a2d] font-semibold text-xl notosans-font inline-block">Size:
                                </p>

                                <div class="w-78/100 ml-10 inline-block">
                                    <c:forEach items="${requestScope.type}" var="type" varStatus="typeIndex">
                                        <ul class="flex flex-row gap-4 w-full" id="${type.key}" name="size"
                                            style="display:none;">
                                            <c:forEach items="${type.value}" var="value" varStatus="stat">
                                                <li class="inline mr-1">
                                                    <input type="radio" onclick="submitForm()"
                                                           id="size-${typeIndex.index}-${value}" name="size"
                                                           value="${value}" class="hidden peer"
                                                           ${stat.first?"checked":""} />
                                                    <label for="size-${typeIndex.index}-${value}"
                                                           class="inline-flex items-center justify-between px-4 py-1 bg-white border-[3px] border-[#563a2d] text-[#563a2d] rounded-xl cursor-pointer peer-checked:text-gray-50 hover:text-gray-600 hover:bg-gray-100 peer-checked:bg-[#563a2d] peer-checked:border-gray-950">

                                                        <div class="block">
                                                            <div
                                                                class="w-full text-md notosans-font font-semibold">
                                                                ${value}</div>
                                                        </div>
                                                    </label>
                                                </li>
                                            </c:forEach>

                                        </ul>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="flex flex-row items-center mb-8">
                                <p class="text-[#563a2d] font-semibold text-xl notosans-font inline-block">
                                    Quantity: </p>

                                <div
                                    class="flex flex-row ms-8 px-1 py-0.5 gap-x-4 justify-between items-center border border-[3px] border-[#563a2d] rounded-lg w-28">
                                    <button id="plus" onclick="plus()"
                                            class="col-span-1 bg-[#563a2d] size-6 place-items-center text-white rounded-md cursor-pointer hover:bg-[#563a2d]/70">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                             stroke-width="4" stroke="currentColor" class="size-4">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M12 4.5v15m7.5-7.5h-15" />
                                        </svg>

                                    </button>

                                    <p id="quantity-num" name="quantity"
                                       class="font-semibold text-xl text-[#563a2d]">1</p>

                                    <button id="minus" onclick="minus()"
                                            class="col-span-1 bg-[#563a2d] size-6 place-items-center text-white rounded-md cursor-pointer hover:bg-[#563a2d]/70">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                             stroke-width="4" stroke="currentColor" class="size-4">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M5 12h14" />
                                        </svg>
                                    </button>
                                </div>
                            </div>
                            <div class="fixed bottom-6 right-6 font-bold z-10">
                                <button onclick="submitCart()"
                                        class="flex gap-x-2 text-[#543520] text-nowrap border-4 border-[#543520] rounded-lg px-4 py-3 text-xl uppercase bg-white hover:bg-[#543520] hover:text-white hover:-translate-y-1 hover:scale-105 htext-[#543520]over:duration-300 hover:transition-all hover:ease-in-out animate-bounce">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
                                         fill="currentColor" class="size-7">
                                        <path fill-rule="evenodd"
                                              d="M7.5 6v.75H5.513c-.96 0-1.764.724-1.865 1.679l-1.263 12A1.875 1.875 0 0 0 4.25 22.5h15.5a1.875 1.875 0 0 0 1.865-2.071l-1.263-12a1.875 1.875 0 0 0-1.865-1.679H16.5V6a4.5 4.5 0 1 0-9 0ZM12 3a3 3 0 0 0-3 3v.75h6V6a3 3 0 0 0-3-3Zm-3 8.25a3 3 0 1 0 6 0v-.75a.75.75 0 0 1 1.5 0v.75a4.5 4.5 0 1 1-9 0v-.75a.75.75 0 0 1 1.5 0v.75Z"
                                              clip-rule="evenodd" />
                                    </svg>
                                    Add to cart
                                </button>
                            </div>
                        </div>

                        <!--Information-->
                        <div>
                            <div class="bg-white drop-shadow-xl mx-10 mb-16 z-5 border">
                                <span class="peacesans-font">Information About
                                    ${product.getProductName()}</span>
                            </div>
                        </div>
                    </main>
                    <%@include file="footer.jsp" %>
                    
                    <script>
                        function showSize() {
                            let selectedValue = document.querySelector("input[name='color']:checked").value;
                            let sizeArray = document.querySelectorAll('ul[name="size"]');
                            for (let i = 0; i < sizeArray.length; i++) {
                                if (sizeArray[i].getAttribute('id') === selectedValue) {
                                    sizeArray[i].style.display = "block";
                                } else {
                                    sizeArray[i].style.display = "none";
                                }
                            }
                        }


                        function next() {
                            if (currentSlideId < totalSlide) {
                                currentSlideId++;
                                showSlide();
                            } else if (currentSlideId === totalSlide) {
                                currentSlideId = 1;
                                showSlide();
                            }
                        }
                        function previous() {
                            if (currentSlideId > 1) {
                                currentSlideId--;
                                showSlide();
                            } else if (currentSlideId === 1) {
                                currentSlideId = totalSlide;
                                showSlide();
                            }
                        }
                        function showSlide() {
                            slide = document.querySelector("#slider").querySelectorAll("li");
                            for (let i = 0; i < totalSlide; i++) {
                                const element = slide[i];
                                if (currentSlideId === i + 1) {
                                    element.classList.remove('hidden');
                                } else {
                                    element.classList.add('hidden');
                                }
                            }
                        }
                    </script>

                    <script>
                        function plus(){
                            let quantity = parseInt(document.querySelector("#quantity-num").innerText, 10);
                            let stockText = document.querySelector("#instock").innerText;
                            let stock = stockText ? parseInt(stockText, 10) : 0;
                            if (quantity < stock) {
                                quantity = quantity + 1;
                                document.querySelector("#quantity-num").innerHTML = quantity;
                            }
                        }
                        function minus(){
                            let quantity = parseInt(document.querySelector("#quantity-num").innerText, 10);
                            if (quantity > 1) {
                                quantity = quantity - 1;
                                document.querySelector("#quantity-num").innerHTML = quantity;
                            }
                        }

                        function selectImg(element) {
                        let img = document.querySelector("#main-img");
                                let nextSibling = element.nextElementSibling;
                                if (nextSibling && nextSibling.children.length > 0) {
                        let imgChild = nextSibling.querySelector('img');
                                img.src = imgChild.src;
                        }


                        function updateForm() {
                        const selectedColor = document.querySelector('input[name="color"]:checked')?.value;
                                const selectedSize = document.querySelector('input[name="size"]:checked')?.value;
                                const quantity = document.querySelector("#quantity-num").innerText;
                                const price = document.querySelector("#price").innerText.replace("$", "").trim();
                                if (!selectedColor || !selectedSize) {
                        console.error("Color or size not selected");
                                return;
                        }


                        }

                    </script>
                    <script>
                        function showSize() {
                        let selectedValue = document.querySelector("input[name='color']:checked").value;
                                let sizeArray = document.querySelectorAll('ul[name="size"]');
                                for (let i = 0; i < sizeArray.length; i++) {
                        if (sizeArray[i].getAttribute('id') === selectedValue) {
                        sizeArray[i].style.display = "block";
                                sizeArray[i].querySelector('input').checked = true;
                        } else {
                        sizeArray[i].style.display = "none";
                                let sizeArrayChild = sizeArray[i].querySelectorAll('input');
                                for (let j = 0; j < sizeArrayChild.length; j++) {
                        sizeArrayChild[j].checked = false;
                        }
                        }
                        }
                        }
                        (function () {
                        let selectedValue = document.querySelector("input[name='color']:checked").value;
                                let sizeArray = document.querySelectorAll('ul[name="size"]');
                                for (let i = 0; i < sizeArray.length; i++) {
                        if (sizeArray[i].getAttribute('id') === selectedValue) {
                        sizeArray[i].style.display = "block";
                                sizeArray[i].firstChild.checked = true;
                        } else {
                        sizeArray[i].style.display = "none";
                                let sizeArrayChild = sizeArray[i].querySelectorAll('input');
                                for (let j = 0; j < sizeArrayChild.length; j++) {
                        sizeArrayChild[j].checked = false;
                        }
                        }
                        }
                        })();
                                function submitForm() {
                                const color = document.querySelector('input[name="color"]:checked')?.value;
                                        showedSize = document.querySelector('ul[name="size"]:not([style="display: none;"])');
                                        const size = showedSize.querySelector('input[name="size"]:checked').value;
                                        if (!color || !size) {
                                console.error("Color or size not selected");
                                        return;
                                }

                                let price = document.querySelector("#price");
                                        let instock = document.querySelector("#instock");
                                        const formData = new URLSearchParams();
                                        formData.append("color", color);
                                        formData.append("size", size);
                                        fetch("product", {
                                        method: "POST",
                                                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                                                body: formData.toString()
                                        })
                                        .then(response => {
                                        if (!response.ok) {
                                        throw new Error("Network response was not ok");
                                        }
                                        return response.json();
                                        })
                                        .then(data => {
                                        price.innerHTML = "$ " + data.price;
                                                instock.innerHTML = data.quantity || "N/A"; // Hiển thị "N/A" nếu không có quantity
                                        })
                                        .catch(error => {
                                        console.error("Error in submitForm:", error);
                                                instock.innerHTML = "N/A";
                                        });
                                }

                        window.onload = function() {
                        submitForm();
                                showSize();
                        }
                        (function () {
                        let selectedValue = document.querySelector("input[name='color']:checked").value;
                                let sizeArray = document.querySelectorAll('ul[name="size"]');
                                for (let i = 0; i < sizeArray.length; i++) {
                        if (sizeArray[i].getAttribute('id') === selectedValue) {
                        sizeArray[i].style.display = "block";
                                sizeArray[i].firstChild.checked = true;
                        } else {
                        sizeArray[i].style.display = "none";
                                let sizeArrayChild = sizeArray[i].querySelectorAll('input');
                                for (let j = 0; j < sizeArrayChild.length; j++) {
                        sizeArrayChild[j].checked = false;
                        }
                        }
                        }
                        })();
                    </script>

                    <form id="cartForm" action="cart" method="post">
                    <input type="hidden" name="id" value="${product.getProductId()}">
                    <input type="hidden" name="image" value="${product.getImages()[0]}">
                    <input type="hidden" name="name" value="${product.getProductName()}">
                    <input type="hidden" id="sizeInput" name="size" value="">
                    <input type="hidden" id="colorInput" name="color" value="">
                    <input type="hidden" id="priceInput" name="price" value="${requestScope.price}">
                    <input type="hidden" id="quantityInput" name="quantity" value="1">
                    </form>

                    <script>
                        function submitCart() {
                            updateForm();
                        document.getElementById("cartForm").submit();
                        }

                        function updateForm() {
                        const selectedColor = document.querySelector('input[name="color"]:checked')?.value;
                        const selectedSize = document.querySelector('input[name="size"]:checked')?.value;
                        const quantity = document.querySelector("#quantity-num").innerText;
                        const price = document.querySelector("#price").innerText.replace("$", "").trim();
                        if (!selectedColor || !selectedSize) {
                            console.error("Color or size not selected");
                            return;
                        }

                        document.querySelector("#colorInput").value = selectedColor;
                        document.querySelector("#sizeInput").value = selectedSize;
                        document.querySelector("#quantityInput").value = quantity;
                        document.querySelector("#priceInput").value = price;
                        }
                    </script>
              
    </body>
</html>