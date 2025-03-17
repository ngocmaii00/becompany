    
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<<<<<<< HEAD
        <link rel="icon" type="image/svg+xml" href="images/head.png" />
        <title>Product</title>      
        <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
        
        <link rel="stylesheet" href="CSS/index.css">
       
       

    </head>
   
    <body class="bg-white">
        <%@include file="header.jsp" %>     
       
    
    <c:set var="product" value="${requestScope.product}"/>
    <c:set var="teddy" value="${requestScope.teddy}"/>
   
        <main class="flex flex-row gap-5 mt-[100px]">
            <div id="" class="relative w-150 ml-35 basis-47/100 flex-inital">
                <div class="relative mt-10 mr-10 mb-5">
                    <ul id="slider">
                        <li class="h-[50vh] relative">
                            <img id="main-img" class="h-full w-full object-cover border-[3px] border-gray-900 rounded-[20px]" src="${product.getImages()[0]}" alt="">
                        </li>
                    </ul>
                </div>
                <div class="flex flex-row flex-none h-25 mr-10 overflow-auto scrollbar-hidden"> 
                    <c:forEach items="${product.getImages()}" var="img" varStatus="status">
                        <label class="inline-block aspect-23/18 mr-2 h-full w-auto">
                            <input onclick="selectImg(this)" 
                                   type="radio" 
                                   id="img-${status.index + 1}" 
                                   name="img" value="" 
                                   class="hidden peer" ${status.index == 0 ? 'checked' : ''}/>
                            <div for="img-${status.index + 1}" 
                                 class="aspect-23/18 h-full w-auto rounded-[18px] cursor-pointer border-gray-900 border-2 hover:bg-gray-100 peer peer-checked:border-[#4a4b5c] peer-checked:rounded-[21px] peer-checked:border-[4px]">
                                <img class="h-full w-full object-cover rounded-[17px]" src="${img}" alt="">
                            </div>
                        </label>
                    </c:forEach>
                </div>
            </div>
            
            <div id="description" class="basis-53/100 flex flex-col gap-8 p-10 mr-25">
                <div class="flex flex-row">
                    <p class="text-[#563a2d] font-semibold text-4xl peacesans-font justify-items-start flex-2">${product.getProductName()}</p>
                    <div class="flex items-center justify-end flex-1">
                         Print yellow Star 
                        <c:if test="${requestScope.rating != -1}">
                            <c:forEach begin="1" end="${requestScope.rating}">
                                <svg class="w-4 h-4 text-yellow-300 ms-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                    <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                                </svg>
                            </c:forEach>
                             Print grayed-out Star 
                            <c:forEach begin="1" end="${5-requestScope.rating}">
                                <svg class="w-4 h-4 ms-1 text-gray-300 dark:text-gray-500" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                    <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                                </svg>
                            </c:forEach>
                            <p class="ms-1 ml-15 text-xl font-semibold notosans-font font-xl text-gray-500">${requestScope.rating}</p>
                        </c:if>
                        <c:if test="${requestScope.rating == -1}">
                            <p class="ms-1 ml-15 text-xl font-semibold notosans-font font-xl text-gray-500">No rating</p>
                        </c:if>
                    </div>
                </div>
                <div>
                    <h2 class="text-[#563a2d] font-semibold text-3xl peacesans-font bg-[#f2e6e6] pl-7 py-7"
                        id="price">${requestScope.price}$</h2>
                </div>
                <div class="flex flex-row">
                    <p class="text-[#563a2d] font-semibold text-2xl notosans-font inline-block h-full mt-5 mb-0 pd-3">Color:</p>
                    <div class="flex flex-row gap-4 w-8/10 h-full ml-15 mt-3">
                        <c:forEach items="${requestScope.color}" var="color">
                            <c:if test="${color.value == false}">
                                <label class="relative h-full w-auto cursor-pointer">
                                    <input
                                        name="color"
                                        type="radio"
                                        class="peer aspect-square h-9/10 w-auto cursor-pointer appearance-none rounded-full border-2 border bg-[${color.key}] border-gray-900 checked:border-[${color.key}] text-[${color.key}] checked:ring-[#000000] focus:ring-[${color.key}] transition-all" 
                                        value="${color.key}"
                                        checked
                                        onclick="showSize()"
                                    />
                                    <span class="absolute aspect-square w-5 h-5 rounded-full opacity-0 peer-checked:opacity-100 transition-opacity duration-200 top-65/100 left-7/10 transform -translate-x-1/2 -translate-y-1/2">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="text-[#ffffff]" fill="none" viewBox="0 0 24 24" stroke-width="7" stroke="currentColor" class="size-6">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="m4.5 12.75 6 6 9-13.5" />
                                        </svg>
                                    </span>
                                </label>
                            </c:if>
                            <c:if test="${color.value == true}">
                                <label class="relative h-full w-auto">
                                    <input  
                                        name="color"
                                        type="radio"
                                        class="peer aspect-square h-9/10 w-auto cursor-pointer appearance-none rounded-full border-2 border bg-[${color.key}] border-gray-300 checked:border-gray-900 text-[${color.key}] checked:ring-[#000000] focus:ring-[${color.key}] transition-all" 
                                        value="${color.key}"
                                        onclick="showSize()"
                                    />
                                    <span class="absolute aspect-square w-5 h-5 rounded-full opacity-0 peer-checked:opacity-100 transition-opacity duration-200 top-65/100 left-7/10 transform -translate-x-1/2 -translate-y-1/2">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="text-[#000000]" fill="none" viewBox="0 0 24 24" stroke-width="6" stroke="currentColor" class="size-6">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="m4.5 12.75 6 6 9-13.5" />
                                        </svg>
                                    </span>
                                </label>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div class="">
                    <p class="text-[#563a2d] font-semibold text-2xl inline-block">Size:</p>
                    <div class="w-78/100 ml-10 inline-block">
                        <c:forEach items="${requestScope.type}" var="type" varStatus="typeIndex">
                            <ul class="flex flex-row gap-4 w-full" id="${type.key}" name="size" style="display:none;">
                                <c:forEach items="${type.value}" var="value" varStatus="stat">
                                    <li class="inline mr-1">
                                        <input type="radio" onclick="submitForm()" id="size-${typeIndex.index}-${value}" name="size" value="${value}" class="hidden peer" ${stat.first?"checked":""}/>
                                        <label for="size-${typeIndex.index}-${value}"
                                               class="inline-flex items-center justify-between px-4 py-1 bg-white border border-[#563a2d] text-[#563a2d] rounded-xl cursor-pointer peer-checked:text-gray-50 hover:text-gray-600 hover:bg-gray-100 peer-checked:bg-[#563a2d] peer-checked:border-gray-950">                           
                                            <div class="block">
                                                <div class="w-full text-md peacesans-font font-semibold">${value}</div>                                       
                                            </div>      
                                        </label>
                                    </li>
                                </c:forEach>
                            </ul>
                        </c:forEach>
                    </div>
                </div>
                <div class="flex flex-row">
                    <p class="text-[#563a2d] font-semibold text-2xl inline-block flex-none">Quantity: </p>
                    <div class="grid grid-cols-3 justify-items-start items-center w-1/4 ml-10 border border-2 border-[#563a2d] rounded-lg flex-none">
                        <button id="plus" onclick="plus()" class="bg-[#563a2d] ml-1 my-1 pl-0.5 pt-0.5 aspect-square h-8/10 w-auto text-white rounded-lg cursor-pointer hover:bg-[#563a2d]/70">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="4" stroke="currentColor" class="size-6">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
                            </svg>
                        </button>
                        <p id="quantity-num" name="quantity" class="justify-self-center font-semibold text-xl text-[#563a2d]">2</p>
                        <button id="minus" onclick="minus()" class="bg-[#563a2d] mr-1 my-1 pl-0.5 pt-0.5 aspect-square h-8/10 w-auto text-white rounded-lg cursor-pointer justify-self-end hover:bg-[#563a2d]/70">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="4" stroke="currentColor" class="size-6">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M5 12h14" />
                            </svg>                          
                        </button>
                    </div>
                    <div class="mt-1 flex flex-row notosans-font text-[#563a2d] w-3/4 font-bold"
                         align="right"> 
                        <p class="notosans-font basis-55 text-[#563a2d] font-bold">In Stock: </p>
                        <p class="notosans-font basis-7 text-[#563a2d] font-bold" id="instock"></p>
                    </div>
                </div>
                <div class="grid grid-cols-3 gap-4 h-1/10 justify">
                    <div></div>
                    <button onclick="submitCart()" class="w-full h-full font-semibold py-2 px-3 font-semibold text-2xl bg-white border border-[#563a2d] border-4 text-[#563a2d] rounded-2xl cursor-pointer hover:text-gray-600 hover:bg-gray-100 peer-checked:bg-[#563a2d] peacesans-font peer-checked:border-gray-950">Add to Cart</button>
                    <button class="bg-[#563a2d] py-2 px-3 h-full w-9/10 font-semibold peacesans-font text-2xl text-[#ffffff] rounded-2xl cursor-pointer justify-self-end hover:bg-[#563a2d]/70">Buy now</button>
                </div>
            </div>
        </main>
        <script>
            currentSlideId = 1;
            sliderElement = document.querySelector("#slider");
            totalSlide = sliderElement.childElementCount;
            console.log(totalSlide);

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
            function plus() {
                let quantity = parseInt(document.querySelector("#quantity-num").innerText, 10);
                let stockText = document.querySelector("#instock").innerText;
                let stock = stockText ? parseInt(stockText, 10) : Infinity; // Nếu không có stock, cho phép tăng vô hạn
                if (quantity < stock) {
                    quantity = quantity + 1;
                    document.querySelector("#quantity-num").innerHTML = quantity;
                }
            }

            function minus() {
                let quantity = parseInt(document.querySelector("#quantity-num").innerText, 10);
                if (quantity > 1) { // Đảm bảo quantity không nhỏ hơn 1
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
            }
        </script>
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

            (function() {
                let selectedValue = document.querySelector("input[name='color']:checked").value;
                let sizeArray = document.querySelectorAll('ul[name="size"]');
                for (let i = 0; i < sizeArray.length; i++) {
                    if (sizeArray[i].getAttribute('id') === selectedValue) {
                        sizeArray[i].style.display = "block";
                    } else {
                        sizeArray[i].style.display = "none";
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

=======