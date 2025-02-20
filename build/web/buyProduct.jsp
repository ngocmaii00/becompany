<%-- 
    Document   : buyProduct
    Created on : Feb 20, 2025, 5:11:56 PM
    Author     : DucAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.tailwindcss.com"></script>
        <title>BuyProductPage</title>
  </head>

  <body>
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