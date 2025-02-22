<%-- 
    Document   : product.jsp
    Created on : Feb 18, 2025, 7:49:19 PM
    Author     : zeryus
--%>

<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <link rel="icon" type="image/svg+xml" href="images/head.png" />
        <title>Product</title>      
        <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
        <link href="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/index.css">
       
       

    </head>
   
    <body class="bg-white">
        <%List<String> imgList = new ArrayList<>();
            imgList.add("/becompany/image/product/leech_plush_1.jpg");
            imgList.add("/becompany/image/product/leech_plush_2.jpg");
            imgList.add("/becompany/image/product/leech_plush_3.jpg");
            imgList.add("/becompany/image/product/leech_plush_4.jpg");
            imgList.add("/becompany/image/product/leech_plush_5.jpg");
        %>

        <header class="mx-auto position-fixed justify-between relative">
            <div class="flex flex-row items-center p-1">
                <div class="basis-5/6">
                    <img src="images/logo.png" alt="logo" class="h-12 md:h-12 lg:h-14 ms-2" />
                </div>
                <label
                    class="flex flex-row border-2 border-[#563a2d] rounded-full basis-2/6 mr-2"
                    >
                    <svg
                        xmlns="http://www.w3.org/2000/svg"
                        viewBox="0 0 24 24"
                        fill="#563a2d"
                        class="md:size-9 size-7"
                        >
                    <path
                        d="M8.25 10.875a2.625 2.625 0 1 1 5.25 0 2.625 2.625 0 0 1-5.25 0Z"
                        />
                    <path
                        fill-rule="evenodd"
                        d="M12 2.25c-5.385 0-9.75 4.365-9.75 9.75s4.365 9.75 9.75 9.75 9.75-4.365 9.75-9.75S17.385 2.25 12 2.25Zm-1.125 4.5a4.125 4.125 0 1 0 2.338 7.524l2.007 2.006a.75.75 0 1 0 1.06-1.06l-2.006-2.007a4.125 4.125 0 0 0-3.399-6.463Z"
                        clip-rule="evenodd"
                        />
                    </svg>

                    <input
                        type="text"
                        class="focus:outline-none grow px-2 bg-transparent w-16 border-none focus:border-none checked:border-none"
                         
                        placeholder="Search"
                        style="color: #563a2d"
                        />
                </label>
                <div class="basis-1/6 flex flex-row items-center md:gap-x-2  justify-end notosans-font">
                    <div
                        class="flex rounded-full md:size-12 size-10 hover:bg-[#f2e6e6] items-center justify-center cursor-pointer"
                        >
                        <svg
                            xmlns="http://www.w3.org/2000/svg"
                            viewBox="0 0 24 24"
                            fill="#563a2d"
                            class="md:size-8 size-7"
                            >
                        <path
                            d="M11.47 3.841a.75.75 0 0 1 1.06 0l8.69 8.69a.75.75 0 1 0 1.06-1.061l-8.689-8.69a2.25 2.25 0 0 0-3.182 0l-8.69 8.69a.75.75 0 1 0 1.061 1.06l8.69-8.689Z"
                            />
                        <path
                            d="m12 5.432 8.159 8.159c.03.03.06.058.091.086v6.198c0 1.035-.84 1.875-1.875 1.875H15a.75.75 0 0 1-.75-.75v-4.5a.75.75 0 0 0-.75-.75h-3a.75.75 0 0 0-.75.75V21a.75.75 0 0 1-.75.75H5.625a1.875 1.875 0 0 1-1.875-1.875v-6.198a2.29 2.29 0 0 0 .091-.086L12 5.432Z"
                            />
                        </svg>
                    </div>
                    <div
                        class="flex rounded-full md:size-12 size-10 hover:bg-[#f2e6e6] items-center justify-center cursor-pointer"
                        >
                        <svg
                            xmlns="http://www.w3.org/2000/svg"
                            viewBox="0 0 24 24"
                            fill="#563a2d"
                            class="md:size-8 size-7"
                            >
                        <path
                            d="M2.25 2.25a.75.75 0 0 0 0 1.5h1.386c.17 0 .318.114.362.278l2.558 9.592a3.752 3.752 0 0 0-2.806 3.63c0 .414.336.75.75.75h15.75a.75.75 0 0 0 0-1.5H5.378A2.25 2.25 0 0 1 7.5 15h11.218a.75.75 0 0 0 .674-.421 60.358 60.358 0 0 0 2.96-7.228.75.75 0 0 0-.525-.965A60.864 60.864 0 0 0 5.68 4.509l-.232-.867A1.875 1.875 0 0 0 3.636 2.25H2.25ZM3.75 20.25a1.5 1.5 0 1 1 3 0 1.5 1.5 0 0 1-3 0ZM16.5 20.25a1.5 1.5 0 1 1 3 0 1.5 1.5 0 0 1-3 0Z"
                            />
                        </svg>
                    </div>
                    <div
                        class="flex rounded-full md:size-12 size-10 hover:bg-[#f2e6e6] items-center justify-center cursor-pointer"
                        >
                        <svg
                            xmlns="http://www.w3.org/2000/svg"
                            viewBox="0 0 24 24"
                            fill="#563a2d"
                            class="md:size-8 size-7"
                            >
                        <path
                            fill-rule="evenodd"
                            d="M18.685 19.097A9.723 9.723 0 0 0 21.75 12c0-5.385-4.365-9.75-9.75-9.75S2.25 6.615 2.25 12a9.723 9.723 0 0 0 3.065 7.097A9.716 9.716 0 0 0 12 21.75a9.716 9.716 0 0 0 6.685-2.653Zm-12.54-1.285A7.486 7.486 0 0 1 12 15a7.486 7.486 0 0 1 5.855 2.812A8.224 8.224 0 0 1 12 20.25a8.224 8.224 0 0 1-5.855-2.438ZM15.75 9a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0Z"
                            clip-rule="evenodd" 
                            />
                        </svg>
                    </div>
                </div>
            </div>
            <div
                class="flex flex-row bg-[#f2e6e6] h-10 notosans-font font-bold uppercase overflow-auto scrollbar-hidden"
                >
                <button
                    class="flex justify-center items-center hover:bg-[#563a2d] hover:text-white md:px-12 px-12 text-sm md:text-base"
                    >
                    <a href="##">Teddy</a>
                </button>
                <button
                    class="flex justify-center items-center hover:bg-[#563a2d] hover:text-white md:px-12 px-12 text-sm md:text-base"
                    >
                    <a href="##">Teddy</a>
                </button>
                <button
                    class="flex justify-center items-center hover:bg-[#563a2d] hover:text-white md:px-12 px-12 text-sm md:text-base"
                    >
                    <a href="##">Teddy</a>
                </button>
                <button
                    class="flex justify-center items-center hover:bg-[#563a2d] hover:text-white md:px-12 px-12 text-sm md:text-base"
                    >
                    <a href="##">Teddy</a>
                </button><button
                    class="flex justify-center items-center hover:bg-[#563a2d] hover:text-white md:px-12 px-12 text-sm md:text-base"
                    >
                    <a href="##">Teddy</a>
                </button>

                <button
                    class="flex justify-center items-center hover:bg-[#563a2d] hover:text-white md:px-12 px-12 text-sm md:text-base"
                    >
                    <a href="##">Teddy</a>
                </button>
                <button
                    class="flex justify-center items-center hover:bg-[#563a2d] hover:text-white md:px-12 px-12 text-sm md:text-base"
                    >
                    <a href="##">Teddy</a>
                </button>
                <button
                    class="flex justify-center items-center hover:bg-[#563a2d] hover:text-white md:px-12 px-12 text-sm md:text-base"
                    >
                    <a href="##">Teddy</a>
                </button>
                <button
                    class="flex justify-center items-center hover:bg-[#563a2d] hover:text-white md:px-12 px-12 text-sm md:text-base"
                    >
                    <a href="##">Teddy</a>
                </button>
            </div>
    
            <c:forEach items="${imgList}" var="c">
                <div class="duration-700 ease-in-out" data-carousel-item="active">
                    <img src="${c}" class="absolute block w-full -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2" alt="...">
                </div>
            </c:forEach>
             
        
    </header>
        <main class="flex flex-row gap-5 ">
            <div id="" class="relative w-150 ml-35 basis-47/100 flex-inital">
                <div class="relative mt-10 mr-10 mb-5">
                    
                    <ul id="slider">
                        <li class="h-[50vh] relative">
                            <img id="main-img" class="h-full w-full object-cover border-3 border-gray-900 rounded-[20px]" src="https://pbs.twimg.com/media/GCM7ZakWEAAS7uM.jpg:large" alt="">
                        
                        </li>
                        
                    </ul>
                    <!-- NEXT AND PREV BUTTONS

                     <div class="absolute h-[60%] flex h-full w-full top-0 left-0 bg-transparent">
                        <div class="my-auto w-full flex justify-between">
                            <button onclick="previous()" type="button" class="absolute top-0 start-0 z-30 flex items-center justify-center h-full px-4 cursor-pointer group focus:outline-none" >
                                <span class="inline-flex items-center justify-center w-10 h-10 rounded-full bg-white/30 dark:bg-gray-800/30 group-hover:bg-white/50 dark:group-hover:bg-gray-800/60 group-focus:ring-4 group-focus:ring-white dark:group-focus:ring-gray-800/70 group-focus:outline-none">
                                    <svg class="w-4 h-4 text-white dark:text-gray-800 rtl:rotate-180" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
                                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 1 1 5l4 4"/>
                                    </svg>
                                    <span class="sr-only">Previous</span>
                                </span>
                            </button>
                            <button onclick="next()" type="button" class="absolute top-0 end-0 z-30 flex items-center justify-center h-full px-4 cursor-pointer group focus:outline-none">
                                <span class="inline-flex items-center justify-center w-10 h-10 rounded-full bg-white/30 dark:bg-gray-800/30 group-hover:bg-white/50 dark:group-hover:bg-gray-800/60 group-focus:ring-4 group-focus:ring-white dark:group-focus:ring-gray-800/70 group-focus:outline-none">
                                    <svg class="w-4 h-4 text-white dark:text-gray-800 rtl:rotate-180" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
                                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
                                    </svg>
                                    <span class="sr-only">Next</span>
                                </span>
                            </button>
                        </div>
                    </div>
                -->
                </div>
                <div class="flex flex-row flex-none h-25 mr-10 overflow-auto  scrollbar-hidden"> 
                        <label class="inline-block aspect-23/18 mr-2 h-full w-auto">
                            <input onclick="selectImg(this)" type="radio" id="img-1" name="img" value="" class="hidden peer"/>
                            <div for="img-1" class="aspect-23/18 h-full w-auto rounded-[18px] cursor-pointer border-gray-900  border-2  hover:bg-gray-100 peer peer-checked:border-[#4a4b5c] peer-checked:border-6">
                                <img class="h-full w-full rounded-[16px]" src="https://pbs.twimg.com/media/GCM7ZakWEAAS7uM.jpg:large" alt="">
                                
                            </div>
                        </label>
                        <label class="inline-block aspect-23/18 mr-2 h-full w-auto ">
                            <input onclick="selectImg(this)" type="radio" id="img-2" name="img" value="" class="hidden peer"/>
                            <div for="img-2" class="aspect-23/18 h-full w-auto rounded-[18px] cursor-pointer border-gray-900 border-2 hover:bg-gray-100 peer peer-checked:border-[#4a4b5c] peer-checked:border-6">
                                <img class="w-full h-full p-0 m-0 rounded-[16px] " src="https://animaltoyforum.com/blog/wp-content/uploads/2023/10/Leech_Giant_Microbes_1.jpg">
                                
                            </div>
                        </label>
                        <label  class=" inline-block aspect-23/18 mr-2 h-full w-auto ">
                            <input onclick="selectImg(this)" type="radio" id="img-3" name="img" value="" class="hidden peer"/>
                            <div for="img-3" class="aspect-23/18 h-full w-auto rounded-[18px] cursor-pointer border-gray-900  border-2 hover:bg-gray-100 peer peer-checked:border-[#4a4b5c] peer-checked:border-6">
                                <img class="h-full w-full rounded-[16px] " src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNLGzp1g07eN6aLKNwPdj_pHgFyWlQ8Jj7DA&s" alt="">
                            </div>
                            
                        </label> 
                        <label class=" inline-block aspect-23/18 mr-2 h-full w-auto ">
                            <input onclick="selectImg(this)" type="radio" id="img-4" name="img" value="" class="hidden peer"/>
                            <div for="img-4" class="aspect-23/18 h-full w-auto rounded-[18px] cursor-pointer border-gray-900  border-2 hover:bg-gray-100 peer peer-checked:border-[#4a4b5c] peer-checked:border-6">
                                <img  class="h-full w-full rounded-[16px] " src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNLGzp1g07eN6aLKNwPdj_pHgFyWlQ8Jj7DA&s" alt="">
                            </div>
                            
                        </label> 
                        <label class=" inline-block aspect-23/18 mr-2 h-full/10 w-auto cursor-pointer  border-gray-900">
                            <input onclick="selectImg(this)" type="radio" id="img-5" name="img" value="" class="hidden peer"/>
                            <div class="aspect-23/18 h-full w-auto rounded-[18px] cursor-pointer border-gray-900 border-2 hover:bg-gray-100 peer peer-checked:border-[#4a4b5c] peer-checked:border-6">
                                <img  class=" h-full w-full rounded-[16px]" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNLGzp1g07eN6aLKNwPdj_pHgFyWlQ8Jj7DA&s" alt="">
                            </div>
                           
                        </label> 
                    
                </div>
            </div>
            <div id="description" class="basis-53/100 flex flex-col gap-8 p-10 mr-25   ">
                <div class="flex flex-row">
                    <p class=" text-[#563a2d] font-semibold text-4xl peacesans-font justify-items-start flex-2">Leech Plush Toy</p>
                    <div class="flex items-center justify-end flex-1">
                        <svg class="w-4 h-4 text-yellow-300 ms-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                            <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                        </svg>
                        <svg class="w-4 h-4 text-yellow-300 ms-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                            <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                        </svg>
                        <svg class="w-4 h-4 text-yellow-300 ms-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                            <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                        </svg>
                        <svg class="w-4 h-4 text-yellow-300 ms-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                            <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                        </svg>
                        <svg class="w-4 h-4 ms-1 text-gray-300 dark:text-gray-500" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                            <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                        </svg>
                        <p class="ms-1 text-xl font-semibold notosans-font font-xl text-gray-500 ">4.95</p>
                    </div>
                </div>
                <div>
                    <h2 class="text-[#563a2d] font-semibold text-3xl peacesans-font bg-[#f2e6e6] pl-7 py-7">100.000$</h2>
                </div>
                <div class=" flex flex-row ">
                   <p class="text-[#563a2d] font-semibold text-2xl notosans-font inline-block h-full mt-5  mb-0 pd-3">Color:</p>
                    <div class="flex flex-row gap-4 w-8/10 h-full ml-15 mt-3" >

                        <label class="relative h-full w-auto cursor-pointer">
                            <input
                              name="color"
                              type="radio"
                              class="peer aspect-square h-9/10 w-auto cursor-pointer appearance-none rounded-full border-2 border bg-[#563a2d] border-gray-900 checked:border-[#563a2d] text-[#563a2d] checked:ring-[#000000] focus:ring-[#563a2d] transition-all"
                             
                              checked
                            />
                            <span class="absolute aspect-square w-5 h-5 rounded-full opacity-0 peer-checked:opacity-100 transition-opacity duration-200 top-5.5 left-5.5 transform -translate-x-1/2 -translate-y-1/2">
                                <svg xmlns="http://www.w3.org/2000/svg" class="text-[#ffffff]" fill="none" viewBox="0 0 24 24" stroke-width="7" stroke="currentColor" class="size-6">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="m4.5 12.75 6 6 9-13.5" />
                                  </svg>

                            </span>
                        </label>
                            
                        <label class="relative h-full w-auto">
                            <input
                              name="color"
                              type="radio"
                              class="peer aspect-square h-9/10 w-auto cursor-pointer appearance-none rounded-full bg-[#936649] border border-2 border-gray-900 checked:border-slate-800 text-[#936649] checked:ring-[#000000] focus:ring-[#936649] transition-all"
                             
                              
                            />
                            <span class="absolute aspect-square w-5 h-5 rounded-full opacity-0 peer-checked:opacity-100 transition-opacity top-5.5 left-5.5 duration-200 transform -translate-x-1/2 -translate-y-1/2">
                                <svg xmlns="http://www.w3.org/2000/svg" class="text-[#ffffff]" fill="none" viewBox="0 0 24 24" stroke-width="7" stroke="currentColor" class="size-6">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="m4.5 12.75 6 6 9-13.5" />
                                  </svg>

                            </span>
                        </label>
                        
                        <label class="relative h-full w-auto">
                            <input name="color" type="radio" class="peer aspect-square h-9/10 w-auto cursor-pointer rounded-full outline-2 outline-solid outline-black bg-gray-150  checked:border-black ring-[#000000] text-[#ffffff] peer-checked:border-black focus:ring-[#000000] transition-all">
                            <span class="absolute aspect-square w-5 h-5 rounded-full opacity-0 peer-checked:opacity-100 transition-opacity duration-200 top-5.5 left-5.5 transform -translate-x-1/2 -translate-y-1/2">
                                <svg xmlns="http://www.w3.org/2000/svg" class="" fill="none" viewBox="0 0 24 24" stroke-width="7" stroke="currentColor" class="size-6">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="m4.5 12.75 6 6 9-13.5" />
                                  </svg>
                                  
                            </span>
                        </label>
                                
                    </div>
                </div>
                <div class="">
                    <p class="text-[#563a2d] font-semibold text-2xl  inline-block">Size:</p>
                    <div class="w-7/10 ml-18.5 inline-block">
                        <ul class="flex flex-row gap-4 w-8/10 " >
                            <li class="">
                                <input type="radio" id="size-small" name="size" value="30cm" class="hidden peer"/>
                                <label for="size-small" class="inline-flex items-center justify-between w-20 px-4 py-1 bg-white border border-[#563a2d] text-[#563a2d] rounded-xl cursor-pointer peer-checked:text-gray-50 hover:text-gray-600 hover:bg-gray-100 peer-checked:bg-[#563a2d] peer-checked:border-gray-950">                           
                                    <div class="block">
                                        <div class="w-full text-lg  peacesans-font font-semibold">30cm</div>                                       
                                    </div>      
                                </label>
                            </li>
                            <li class="">
                                <input type="radio" id="size-medium" name="size" value="40cm" class="hidden peer">
                                <label for="size-medium" class="inline-flex items-center justify-between w-20 px-4 py-1 bg-white border border-[#563a2d] text-[#563a2d] rounded-xl  cursor-pointer   peer-checked:text-gray-50 hover:text-gray-600 hover:bg-gray-100 peer-checked:bg-[#563a2d] peer-checked:border-gray-950">
                                    <div class="block">
                                        <div class="w-full text-lg  peacesans-font font-semibold">40cm</div>                                       
                                    </div>                              
                                </label>
                            </li>
                            <li class="">
                                <input type="radio" id="size-large" name="size" value="50cm" class="hidden peer">
                                <label for="size-large" class="inline-flex items-center justify-between w-20 px-4 py-1 bg-white border border-[#563a2d] text-[#563a2d] rounded-xl  cursor-pointer peer-checked:text-gray-50 hover:text-gray-600 hover:bg-gray-100 peer-checked:bg-[#563a2d] peer-checked:border-gray-950">
                                    <div class="block">
                                        <div class="w-full text-lg peacesans-font font-semibold">50cm</div>                                       
                                    </div>                              
                                </label>
                            </li>
                        </ul>
                        
                    </div>
                </div>
                <div class="flex flex-row">
                    <p class="text-[#563a2d] font-semibold text-2xl inline-block flex-none">Quantity: </p>
                    
                    <div class="grid grid-cols-3 justify-items-start items-center w-1/4 ml-10 border border-2 border-[#563a2d] rounded-lg flex-none">
                        <button id="plus" onclick="plus()" class="bg-[#563a2d] ml-1 my-1 pl-0.5 pt-0.5   aspect-square h-8/10 w-auto text-white rounded-lg cursor-pointer hover:bg-[#563a2d]/70">
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
                </div>
                <div class="grid grid-cols-3 gap-4 h-1/10 justify">
                    <div></div>
                    <button class="w-full h-full font-semibold py-2 px-3 font-semibold text-2xl bg-white border border-[#563a2d] border-4 text-[#563a2d] rounded-2xl cursor-pointer hover:text-gray-600 hover:bg-gray-100 peer-checked:bg-[#563a2d] peacesans-font peer-checked:border-gray-950">Add to Cart</button>
                    <button class="bg-[#563a2d]  py-2 px-3 h-full w-9/10 font-semibold peacesans-font text-2xl text-[#ffffff] rounded-2xl cursor-pointer justify-self-end hover:bg-[#563a2d]/70">Buy now</button>
                </div>
            </div>
        </main>
        <script>
            currentSlideId = 1;
            sliderElement = document.querySelector("#slider");
            totalSlide = sliderElement.childElementCount;
            console.log(totalSlide);


           function next(){
                if(currentSlideId < totalSlide){
                    currentSlideId++;
                    showSlide();
                }
                else if(currentSlideId === totalSlide){
                    currentSlideId = 1;
                    showSlide();
                }
           }
           function previous(){
                if(currentSlideId > 1){
                    currentSlideId--;
                    showSlide();
                }
                else if(currentSlideId ===1){
                    currentSlideId = totalSlide;
                    showSlide();
                }
           }
           function showSlide(){
                slide=document.querySelector("#slider").querySelectorAll("li");
                for(let i = 0; i< totalSlide; i++){
                    const element = slide[i];
                    if(currentSlideId === i+1){
                        element.classList.remove('hidden');
                    }else{
                        element.classList.add('hidden');
                    }
                }
            }
        </script>
            
        <script>
            function plus(){
                let quantity = parseInt(document.querySelector("#quantity-num").innerText,10);
                quantity = quantity + 1;
                document.querySelector("#quantity-num").innerHTML = quantity;
            }
            function minus(){
                let quantity = parseInt(document.querySelector("#quantity-num").innerText,10);
                if(quantity){
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
        <script src="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.js"></script>   
    </body>
</html>
