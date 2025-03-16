<%-- 
    Document   : buyProduct
    Created on : Feb 20, 2025, 5:11:56 PM
    Author     : DucAnh
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
        <title>BuyProductPage</title>
<<<<<<< Updated upstream
  </head>

  <body>
    <div class="border-2 border-[#543520] mx-12 my-12 rounded-lg bg-[#f2e6e6]">
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
      <span
        class="grid grid-cols-11 font-bold text-xl items-center mx-16 text-[#543520] py-4 border-b-4 border-[#543520]"
      >
        <label for="product" class="col-span-5">Product</label>
        <label for="price" class="col-span-2 text-center">Unit Price</label>
        <label for="quantity" class="col-span-2 text-center">Quantity</label>
        <label for="estimate" class="col-span-2 text-center">Total Price</label>
      </span>


      <div class="grid grid-cols-11 mx-16 my-4">
        <div class="col-span-5 flex flex-row place-items-center gap-x-6">
          <div
            class="rounded-lg border-2 border-[#543520] size-28 bg-cover bg-center bg-[url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTD0SU96JeQD1HZUcAJMe1STZMATuxaua0tWrxApDP87lcjBLMqB-b77XWIvZmm7t-UPqE&usqp=CAU')]"
          ></div>

          <div>
            <span class="font-bold text-2xl text-[#543520]">Teddy V1</span>

            <div class="flex flex-row items-center gap-x-2 mt-3">
              <div
                class="border-2 w-fit border-[#543520] rounded-full px-2 text-center items-center"
              >
                40cm
              </div>
              <div class="rounded-full size-6 bg-[#543520]"></div>
=======
    </head>

    <body>
        <header class="mx-auto position-fixed justify-between relative">
            <div class="flex flex-row items-center p-1">
                <div class="basis-5/6">
                    <img src="images/logo.png" alt="logo" class="h-8 md:h-12 lg:h-14 ms-2" />
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
                        class="focus:outline-none grow px-2 bg-transparent w-16"
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
>>>>>>> Stashed changes
            </div>
            <div
                class="flex flex-row bg-[#f2e6e6] h-10 notosans-font font-bold uppercase overflow-auto scrollbar-hidden"
                >
                <button
                    class="flex justify-center items-center hover:bg-[#563a2d] hover:text-white md:px-12 px-6 text-sm md:text-base"
                    >
                    <a href="##">Teddy</a>
                </button>
                <button
                    class="flex justify-center items-center hover:bg-[#563a2d] hover:text-white md:px-12 px-6 text-sm md:text-base"
                    >
                    <a href="##">Teddy</a>
                </button>
                <button
                    class="flex justify-center items-center hover:bg-[#563a2d] hover:text-white md:px-12 px-6 text-sm md:text-base"
                    >
                    <a href="##">Teddy</a>
                </button>
                <button
                    class="flex justify-center items-center hover:bg-[#563a2d] hover:text-white md:px-12 px-6 text-sm md:text-base"
                    >
                    <a href="##">Teddy</a>
                </button><button
                    class="flex justify-center items-center hover:bg-[#563a2d] hover:text-white md:px-12 px-6 text-sm md:text-base"
                    >
                    <a href="##">Teddy</a>
                </button>

                <button
                    class="flex justify-center items-center hover:bg-[#563a2d] hover:text-white md:px-12 px-6 text-sm md:text-base"
                    >
                    <a href="##">Teddy</a>
                </button>
                <button
                    class="flex justify-center items-center hover:bg-[#563a2d] hover:text-white md:px-12 px-6 text-sm md:text-base"
                    >
                    <a href="##">Teddy</a>
                </button>
                <button
                    class="flex justify-center items-center hover:bg-[#563a2d] hover:text-white md:px-12 px-6 text-sm md:text-base"
                    >
                    <a href="##">Teddy</a>
                </button>
                <button
                    class="flex justify-center items-center hover:bg-[#563a2d] hover:text-white md:px-12 px-6 text-sm md:text-base"
                    >
                    <a href="##">Teddy</a>
                </button>
            </div>
        </header>




        <div class="border-2 border-[#543520] mx-12 my-12 rounded-lg bg-[#f2e6e6]">
            <span
                class="grid grid-cols-11 font-bold text-xl items-center mx-16 text-[#543520] py-4 border-b-4 border-[#543520]"
                >
                <label for="product" class="col-span-5">Product</label>
                <label for="price" class="col-span-2 text-center">Unit Price</label>
                <label for="quantity" class="col-span-2 text-center">Quantity</label>
                <label for="estimate" class="col-span-2 text-center">Total Price</label>
            </span>


            <div class="grid grid-cols-11 mx-16 my-4">
                <div class="col-span-5 flex flex-row place-items-center gap-x-6">
                    <div
                        class="rounded-lg border-2 border-[#543520] size-28 bg-cover bg-center bg-[url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTD0SU96JeQD1HZUcAJMe1STZMATuxaua0tWrxApDP87lcjBLMqB-b77XWIvZmm7t-UPqE&usqp=CAU')]"
                        ></div>

                    <div>
                        <span class="font-bold text-2xl text-[#543520]">Teddy V1</span>

                        <div class="flex flex-row items-center gap-x-2 mt-3">
                            <div
                                class="border-2 w-fit border-[#543520] rounded-full px-2 text-center items-center"
                                >
                                40cm
                            </div>
                            <div class="rounded-full size-6 bg-[#543520]"></div>
                        </div>
                    </div>
                </div>



                <div class="col-span-2 flex justify-center items-center">
                    <span class="text-xl font-bold text-[#543520]">130.000d</span>
                </div>

                <div class="col-span-2 flex justify-center items-center">
                    <span class="text-xl font-bold text-[#543520]"> 2 </span>
                </div>



                <div class="col-span-2 flex justify-center items-center">
                    <span class="text-xl font-bold text-[#543520]">260.000d</span>
                </div>
            </div>




            <div class=" mx-16 grid grid-cols-11 border-b-4 py-2 pb-8 border-[#543520]">
                <div class="flex flex-col col-span-5">
                    <span class="font-bold text-2xl text-[#543520]">Message: </span>
                    <textarea 
                        class="border-2 border-[#543520] rounded p-2 w-full max-w-xs h-28 resize-none overflow-auto"
                        placeholder="Text here..."></textarea>
                </div>


                <div class="flex flex-col col-span-4 justify-center">
                    <span class="font-bold text-xl text-[#543520]">Shipping Method: </span>

                    <select class="border-2 border-[#543520] w-full max-w-xs  px-2 py-2 rounded-lg my-2 bg-white">
                        <option value="Fast" class="">Fast (2-3 days)</option>
                        <option value="Express">Express (1-2 days)</option>
                        <option value="Economy">Economy (7-8 days)</option>
                    </select>
                    <span class="font-bold text-xl text-[#543520]">Pay Method: Cash on Delivery</span>
                </div>


                <div class="flex flex-row col-span-2 justify-center items-center">
                    <span class="font-bold text-2xl text-[#543520]">20.000d</span>
                </div>
            </div>




            <div class="grid grid-cols-11 mx-16 py-6">
                <span class="flex col-span-5 font-bold text-3xl text-[#543520]">
                    Total Amount: 
                </span>

                <span class="flex col-span-2 font-bold text-3xl text-[#543520] text-center justify-center">280.000d</span>
                <div class="col-span-2"></div>
                <div class="flex col-span-2 justify-center">
                    <button class="border-2 border-[#543520] bg-[#543520] text-white rounded-md w-32 justify-center items-center text-center">
                        <span class="font-bold text-2xl">Pay</span>
                    </button>
                </div>
            </div>
        </div>
    </body>
    <html/>