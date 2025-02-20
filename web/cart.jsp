<%-- 
    Document   : cart
    Created on : Feb 17, 2025, 9:31:39 PM
    Author     : DucAnhDepTrai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.tailwindcss.com"></script>
        <title>CartPage</title>
    </head>
    <body>
        <div class="">
            <span
                class="grid grid-cols-11 font-bold text-xl items-center mx-16 text-[#543520] py-4"
                >
                <input
                    type="checkbox"
                    class="col-span-1 size-5 mx-12 accent-[#543520]"
                    />
                <label for="product" class="col-span-3">Product</label>
                <label for="price" class="col-span-2 text-center">Price</label>
                <label for="quantity" class="col-span-2 text-center">Quantity</label>
                <label for="estimate" class="col-span-2 text-center">Estimate</label>
                <label for="action" class="col-span-1 text-center">Action</label>
            </span>
            <div class="border-2 border-[#543520] mx-16 rounded-lg py-4 bg-[#f2e6e6]">
                <div class="grid grid-cols-11 items-center py-4">
                    <input
                        type="checkbox"
                        class="col-span-1 size-5 mx-12 accent-[#543520]"
                        />
                    <div class="col-span-3">
                        <div class="flex flex-row place-items-center gap-x-6">
                            <div
                                class="rounded-lg border-2 border-[#543520] size-28 bg-cover bg-center bg-[url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTD0SU96JeQD1HZUcAJMe1STZMATuxaua0tWrxApDP87lcjBLMqB-b77XWIvZmm7t-UPqE&usqp=CAU')]"
                                ></div>
                            <div class="">
                                <span class="font-bold text-3xl text-[#543520]">Teddy</span>
                                <div class="flex flex-row items-center gap-x-2 mt-3">
                                    <div
                                        class="border-2 w-fit border-[#543520] rounded-full px-2"
                                        >
                                        40cm
                                    </div>
                                    <div class="rounded-full size-6 bg-[#543520]"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-span-2 text-center text-xl font-bold">
                        <span>160.000</span>
                    </div>
                    <div class="col-span-2 place-items-center">
                        <div
                            class="flex flex-row border-2 border-black h-fit w-fit rounded-md col-span-2 items-center"
                            >
                            <button>
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    viewBox="0 0 24 24"
                                    fill="#543520"
                                    class="size-6"
                                    >
                                <path
                                    fill-rule="evenodd"
                                    d="M12 2.25c-5.385 0-9.75 4.365-9.75 9.75s4.365 9.75 9.75 9.75 9.75-4.365 9.75-9.75S17.385 2.25 12 2.25ZM12.75 9a.75.75 0 0 0-1.5 0v2.25H9a.75.75 0 0 0 0 1.5h2.25V15a.75.75 0 0 0 1.5 0v-2.25H15a.75.75 0 0 0 0-1.5h-2.25V9Z"
                                    clip-rule="evenodd"
                                    />
                                </svg>
                            </button>

                            <input
                                type="text"
                                class="bg-transparent outline-none w-8 text-center"
                                />
                            <button>
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    viewBox="0 0 24 24"
                                    fill="#543520"
                                    class="size-6"
                                    >
                                <path
                                    fill-rule="evenodd"
                                    d="M12 2.25c-5.385 0-9.75 4.365-9.75 9.75s4.365 9.75 9.75 9.75 9.75-4.365 9.75-9.75S17.385 2.25 12 2.25Zm3 10.5a.75.75 0 0 0 0-1.5H9a.75.75 0 0 0 0 1.5h6Z"
                                    clip-rule="evenodd"
                                    />
                                </svg>
                            </button>
                        </div>
                    </div>
                    <div class="col-span-2 text-center text-xl font-bold">
                        <span>160.000</span>
                    </div>
                    <div class="col-span-1 place-items-center">
                        <div
                            class="flex flex-row gap-x-4 lg:mx-8 mx-4 col-span-1 items-end"
                            >
                            <button class="relative group">
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    viewBox="0 0 24 24"
                                    fill="#543520"
                                    class="size-6"
                                    >
                                <path
                                    d="M21.731 2.269a2.625 2.625 0 0 0-3.712 0l-1.157 1.157 3.712 3.712 1.157-1.157a2.625 2.625 0 0 0 0-3.712ZM19.513 8.199l-3.712-3.712-8.4 8.4a5.25 5.25 0 0 0-1.32 2.214l-.8 2.685a.75.75 0 0 0 .933.933l2.685-.8a5.25 5.25 0 0 0 2.214-1.32l8.4-8.4Z"
                                    />
                                <path
                                    d="M5.25 5.25a3 3 0 0 0-3 3v10.5a3 3 0 0 0 3 3h10.5a3 3 0 0 0 3-3V13.5a.75.75 0 0 0-1.5 0v5.25a1.5 1.5 0 0 1-1.5 1.5H5.25a1.5 1.5 0 0 1-1.5-1.5V8.25a1.5 1.5 0 0 1 1.5-1.5h5.25a.75.75 0 0 0 0-1.5H5.25Z"
                                    />
                                </svg>

                                <div
                                    class="absolute bottom-full left-1/2 transform -translate-x-1/2 mb-2 w-max px-2 py-1 text-sm text-white bg-[#543520] rounded shadow-lg opacity-0 group-hover:opacity-100"
                                    >
                                    Edit
                                </div>
                            </button>
                            <button class="relative group">
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    viewBox="0 0 24 24"
                                    fill="#543520"
                                    class="size-6"
                                    >
                                <path
                                    fill-rule="evenodd"
                                    d="M16.5 4.478v.227a48.816 48.816 0 0 1 3.878.512.75.75 0 1 1-.256 1.478l-.209-.035-1.005 13.07a3 3 0 0 1-2.991 2.77H8.084a3 3 0 0 1-2.991-2.77L4.087 6.66l-.209.035a.75.75 0 0 1-.256-1.478A48.567 48.567 0 0 1 7.5 4.705v-.227c0-1.564 1.213-2.9 2.816-2.951a52.662 52.662 0 0 1 3.369 0c1.603.051 2.815 1.387 2.815 2.951Zm-6.136-1.452a51.196 51.196 0 0 1 3.273 0C14.39 3.05 15 3.684 15 4.478v.113a49.488 49.488 0 0 0-6 0v-.113c0-.794.609-1.428 1.364-1.452Zm-.355 5.945a.75.75 0 1 0-1.5.058l.347 9a.75.75 0 1 0 1.499-.058l-.346-9Zm5.48.058a.75.75 0 1 0-1.498-.058l-.347 9a.75.75 0 0 0 1.5.058l.345-9Z"
                                    clip-rule="evenodd"
                                    />
                                </svg>

                                <div
                                    class="absolute bottom-full left-1/2 transform -translate-x-1/2 mb-2 w-max px-2 py-1 text-sm text-white bg-[#543520] rounded shadow-lg opacity-0 group-hover:opacity-100"
                                    >
                                    Remove
                                </div>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="grid grid-cols-11 mx-16 items-center my-4 h-14">
                <div
                    class="col-span-7 rounded-lg size-6 h-11 w-20 bg-[#543520] flex flex-row items-center space-x-4 justify-between"
                    >
                    <button
                        class="relative group mx-2 flex flex-row space-x-4 justify-between"
                        >
                        <svg
                            xmlns="http://www.w3.org/2000/svg"
                            viewBox="0 0 24 24"
                            fill="white"
                            class="size-6"
                            >
                        <path
                            fill-rule="evenodd"
                            d="M11.03 3.97a.75.75 0 0 1 0 1.06l-6.22 6.22H21a.75.75 0 0 1 0 1.5H4.81l6.22 6.22a.75.75 0 1 1-1.06 1.06l-7.5-7.5a.75.75 0 0 1 0-1.06l7.5-7.5a.75.75 0 0 1 1.06 0Z"
                            clip-rule="evenodd"
                            />
                        </svg>
                        <svg
                            xmlns="http://www.w3.org/2000/svg"
                            viewBox="0 0 24 24"
                            fill="white"
                            class="size-6"
                            >
                        <path
                            d="M11.47 3.841a.75.75 0 0 1 1.06 0l8.69 8.69a.75.75 0 1 0 1.06-1.061l-8.689-8.69a2.25 2.25 0 0 0-3.182 0l-8.69 8.69a.75.75 0 1 0 1.061 1.06l8.69-8.689Z"
                            />
                        <path
                            d="m12 5.432 8.159 8.159c.03.03.06.058.091.086v6.198c0 1.035-.84 1.875-1.875 1.875H15a.75.75 0 0 1-.75-.75v-4.5a.75.75 0 0 0-.75-.75h-3a.75.75 0 0 0-.75.75V21a.75.75 0 0 1-.75.75H5.625a1.875 1.875 0 0 1-1.875-1.875v-6.198a2.29 2.29 0 0 0 .091-.086L12 5.432Z"
                            />
                        </svg>
                    </button>
                </div>

                <div class="col-span-3">
                    <input
                        type="text"
                        id="voucher"
                        name="voucher"
                        placeholder="Voucher"
                        class="border-black border-2 h-11 rounded-lg w-30 placeholder-grey-500 pl-2 font-bold"
                        />
                </div>
                <div
                    class="col-span-1 rounded-lg h-11 w-28 bg-[#543520] flex flex-row items-center justify-center"
                    >
                    <button class="relative group">
                        <h3 class="text-white text-lg font-bold text-center items-center">
                            Apply
                        </h3>
                    </button>
                </div>
            </div>

            <div class="fixed bottom-8 left-0 right-0 grid grid-cols-9 border-2 border-[#543520] rounded-lg bg-[#f2e6e6] mx-16 h-20 items-center">
                <div class="col-span-3 text-center">
                    <span class="text-3xl font-bold text-[#543520]"> Total Amount: </span>
                </div>

                <div class="col-span-4 text-center">
                    <span class="text-4xl font-bold text-[#543520]"> 260.000d </span>
                </div>

                <div class="col-span-2 flex justify-center">
                    <button class="flex border-2 border-[#543520] bg-[#543520] rounded-md w-40 h-14 text-center items-center justify-center">
                        <span class="text-3xl font-bold text-white ">Buy (2)</span>
                    </button>
                </div>
            </div>
        </div>
    </body>
</html>
