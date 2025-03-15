
<%-- Document : profile Created on : Feb 20, 2025, 6:54:01 PM Author : PC --%>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>

        </head>

        <body>
            <%@include file="header.jsp" %>
                <c:set var="customer" value="${sessionScope.user}" />

                <c:set var="details" value="${sessionScope.user.userDetail}" />

                <div
                    class="md:mt-40 mt-32 flex lg:flex-row lg:gap-x-16 flex-col lg:items-start justify-center items-center">
                    <div class="flex flex-col items-center">

                        <div class="flex flex-col items-center">
                            <img src="${user.image}"
                                class="avatar bg-cover bg-center size-[18em] rounded-full mb-8 shadow-lg border-2 border-[#563a2d]"></img>

                            <span class="peacesans-font uppercase text-5xl text-center mb-6">Account</span>
                        </div>
                        <div class="flex flex-col mx-20 justify-start">
                            <span class="flex flex-row items-center gap-x-4 mb-4">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                                    class="size-8">
                                    <path
                                        d="M21.731 2.269a2.625 2.625 0 0 0-3.712 0l-1.157 1.157 3.712 3.712 1.157-1.157a2.625 2.625 0 0 0 0-3.712ZM19.513 8.199l-3.712-3.712-8.4 8.4a5.25 5.25 0 0 0-1.32 2.214l-.8 2.685a.75.75 0 0 0 .933.933l2.685-.8a5.25 5.25 0 0 0 2.214-1.32l8.4-8.4Z">
                                    </path>
                                    <path
                                        d="M5.25 5.25a3 3 0 0 0-3 3v10.5a3 3 0 0 0 3 3h10.5a3 3 0 0 0 3-3V13.5a.75.75 0 0 0-1.5 0v5.25a1.5 1.5 0 0 1-1.5 1.5H5.25a1.5 1.5 0 0 1-1.5-1.5V8.25a1.5 1.5 0 0 1 1.5-1.5h5.25a.75.75 0 0 0 0-1.5H5.25Z">
                                    </path>
                                </svg>
                                <button class="notosans-font font-bold text-center text-xl hover:underline">
                                    <a href="#" onclick="toggleEdit()" id="edit_profile" class="text-nowrap">
                                        Edit profile
                                    </a>

                                </button>
                            </span>
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
                    <div class="mb-16" action="ProfileServlet" method="POST">
                        <p class="text-red-500 mx-10" id="error"></p>
                        <div
                            class="grid grid-cols-4 bg-[#f2e6e6] w-fit mx-10 rounded-lg border-2 border-[#563a2d] notosans-font font-bold px-10 py-8 items-center">
                            <div class="flex flex-col col-span-2 sm:col-span-1">
                                <label for="username" class="py-3.5">Username: </label>
                                <c:if test="${user.password != null}">
                                    <label for="password" class="py-3 my-0.5">Password:</label>
                                    <label for="re-enter-password" class="confirmPassword py-3" hidden>Confirm
                                        Password:</label>
                                </c:if>

                                <label for="fullName" class="fullName py-3.5">Name:</label>
                                <label for="firstName" class="firstName py-3.5" hidden>First Name:</label>
                                <label for="lastName" class="lastName py-3.5" hidden>Last Name:</label>
                                <label for="email" class="py-3.5">Email:</label>
                                <label for="phone" class="py-3.5">Phone:</label>
                                <label for="gender" class="py-3.5">Gender:</label>
                                <label for="address" class="py-3.5">Address:</label>
                                <label for="dob" class="py-3">Date Of Birth:</label>
                            </div>
                            <div class="flex flex-col gap-y-2 col-span-2">
                                <input
                                    class="py-3 ps-4 pe-10 block w-full border-gray-200 rounded-lg text-sm focus:border-blue-500 focus:ring-blue-500 disabled:bg-white  disabled:pointer-events-none"
                                    name="username" id="username" value="${user.username}" disabled>
                                <c:if test="${user.password != null}">
                                    <div class="max-w-sm">
                                        <div class="relative">
                                            <input id="hs-toggle-password" name="password" type="password"
                                                class="py-4 ps-4 pe-10 block w-full border-gray-200 rounded-lg text-sm focus:border-blue-500 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none"
                                                placeholder="Enter password" value="${user.password}" disabled>

                                            <button type="button" data-hs-toggle-password="{#hs-toggle-password&quot;
                                        }" class="absolute inset-y-0 end-0 flex items-center z-20 px-3 cursor-pointer text-gray-400 rounded-e-md focus:outline-none focus:text-blue-600">
                                                <svg class="shrink-0 size-3.5" width="24" height="24"
                                                    viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                    <path class="hs-password-active:hidden"
                                                        d="M9.88 9.88a3 3 0 1 0 4.24 4.24"></path>
                                                    <path class="hs-password-active:hidden"
                                                        d="M10.73 5.08A10.43 10.43 0 0 1 12 5c7 0 10 7 10 7a13.16 13.16 0 0 1-1.67 2.68">
                                                    </path>
                                                    <path class="hs-password-active:hidden"
                                                        d="M6.61 6.61A13.526 13.526 0 0 0 2 12s3 7 10 7a9.74 9.74 0 0 0 5.39-1.61">
                                                    </path>
                                                    <line class="hs-password-active:hidden" x1="2" x2="22" y1="2"
                                                        y2="22"></line>
                                                    <path class="hidden hs-password-active:block"
                                                        d="M2 12s3-7 10-7 10 7 10 7-3 7-10 7-10-7-10-7Z"></path>
                                                    <circle class="hidden hs-password-active:block" cx="12" cy="12"
                                                        r="3"></circle>
                                                </svg>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="confirmPassword relative" hidden>
                                        <input id="hs-toggle-confirm-password" name="re-enter-password" type="password"
                                            class="py-4 ps-4 pe-10 block w-full border-gray-200 rounded-lg text-sm focus:border-blue-500 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none"
                                            placeholder="Enter password" disabled>

                                        <button type="button" data-hs-toggle-password="{#hs-toggle-password&quot;
                                        }"
                                            class="absolute inset-y-0 end-0 flex items-center z-20 px-3 cursor-pointer text-gray-400 rounded-e-md focus:outline-none focus:text-blue-600">
                                            <svg class="shrink-0 size-3.5" width="24" height="24" viewBox="0 0 24 24"
                                                fill="none" stroke="currentColor" stroke-width="2"
                                                stroke-linecap="round" stroke-linejoin="round">
                                                <path class="hs-password-active:hidden"
                                                    d="M9.88 9.88a3 3 0 1 0 4.24 4.24"></path>
                                                <path class="hs-password-active:hidden"
                                                    d="M10.73 5.08A10.43 10.43 0 0 1 12 5c7 0 10 7 10 7a13.16 13.16 0 0 1-1.67 2.68">
                                                </path>
                                                <path class="hs-password-active:hidden"
                                                    d="M6.61 6.61A13.526 13.526 0 0 0 2 12s3 7 10 7a9.74 9.74 0 0 0 5.39-1.61">
                                                </path>
                                                <line class="hs-password-active:hidden" x1="2" x2="22" y1="2" y2="22">
                                                </line>
                                                <path class="hidden hs-password-active:block"
                                                    d="M2 12s3-7 10-7 10 7 10 7-3 7-10 7-10-7-10-7Z"></path>
                                                <circle class="hidden hs-password-active:block" cx="12" cy="12" r="3">
                                                </circle>
                                            </svg>
                                        </button>
                                    </div>
                                </c:if>
                                <input
                                    class="py-3 ps-4 pe-10 block w-full border-gray-200 rounded-lg text-sm focus:border-blue-500 focus:ring-blue-500 disabled:bg-white  disabled:pointer-events-none"
                                    name="fullName" id="name" value="${details.fullName}" disabled>
                                <input
                                    class="firstName py-3 ps-4 pe-10 block w-full border-gray-200 rounded-lg text-sm focus:border-blue-500 focus:ring-blue-500 disabled:bg-white  disabled:pointer-events-none"
                                    name="firstName" id="firstName" value="${details.firstName}" style="display: none" required>
                                <input
                                    class="lastName py-3 ps-4 pe-10 block w-full border-gray-200 rounded-lg text-sm focus:border-blue-500 focus:ring-blue-500 disabled:bg-white  disabled:pointer-events-none"
                                    name="lastName" id="lastName" value="${details.lastName}" style="display: none;" required>
                                <input
                                    class="py-3 ps-4 pe-10 block w-full border-gray-200 rounded-lg text-sm focus:border-blue-500 focus:ring-blue-500 disabled:bg-white  disabled:pointer-events-none"
                                    name="email" id="email" type="email" value="${user.email}" disabled required>
                                <input
                                    class="py-3 ps-4 pe-10 block w-full border-gray-200 rounded-lg text-sm focus:border-blue-500 focus:ring-blue-500 disabled:bg-white  disabled:pointer-events-none"
                                    name="phone" id="phone" value="${details.phone==null?'':details.phone}" disabled required>
                                <div class="flex flex-row items-center gap-x-2 py-1">
                                    <input class="accent-[#563a2d] size-3" name="gender" value="true" type="radio"
                                        disabled ${details.gender?"checked":"" }>
                                    Male
                                    <input class="accent-[#563a2d] md:ms-8 ms-3 size-3" name="gender" value="false"
                                        type="radio" disabled ${details.gender?"":"checked"}>
                                    Female
                                </div>
                                <input
                                    class="py-3 ps-4 pe-10 block w-full border-gray-200 rounded-lg text-sm focus:border-blue-500 focus:ring-blue-500 disabled:bg-white  disabled:pointer-events-none"
                                    name="address" id="address" value="${details.address==null?'':details.address}"
                                    disabled required>
                                <input type="date" name="dob" value="${details.dob}"
                                    class="placeholder-white border-gray-300 text-gray-900 text-sm rounded-md focus:#563a2d focus:border-[#563a2d] block w-full p-2.5"
                                    disabled required> 
                            </div>
                            <div
                                class="flex flex-col justify-center items-center gap-y-4 sm:ms-8 mt-10 sm:mt-0 col-span-4 sm:col-span-1">
                                <img src="${user.image}"
                                    class="avatar ms-2 bg-cover bg-center md:size-[6em] size-[8em] rounded-full border-2 border-[#543520] shadow-lg"></img>


                                <label class="cursor-pointer" for="file-input">
                                    <input type="file" name="file" hidden="" accept="image/*" id="file-input">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                                        class="size-8">
                                        <path d="M12 9a3.75 3.75 0 1 0 0 7.5A3.75 3.75 0 0 0 12 9Z"></path>
                                        <path fill-rule="evenodd"
                                            d="M9.344 3.071a49.52 49.52 0 0 1 5.312 0c.967.052 1.83.585 2.332 1.39l.821 1.317c.24.383.645.643 1.11.71.386.054.77.113 1.152.177 1.432.239 2.429 1.493 2.429 2.909V18a3 3 0 0 1-3 3h-15a3 3 0 0 1-3-3V9.574c0-1.416.997-2.67 2.429-2.909.382-.064.766-.123 1.151-.178a1.56 1.56 0 0 0 1.11-.71l.822-1.315a2.942 2.942 0 0 1 2.332-1.39ZM6.75 12.75a5.25 5.25 0 1 1 10.5 0 5.25 5.25 0 0 1-10.5 0Zm12-1.5a.75.75 0 1 0 0-1.5.75.75 0 0 0 0 1.5Z"
                                            clip-rule="evenodd"></path>
                                    </svg>

                                </label>
                            </div>
                        </div>
                        <div class="flex flex-row justify-between mx-10 mt-4">
                            <a href="home"
                                class="flex flex-row bg-[#563a2d] w-fit rounded-lg justify-center items-center px-4 py-3 gap-x-2">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="white" class="size-6">
                                    <path fill-rule="evenodd"
                                        d="M7.28 7.72a.75.75 0 0 1 0 1.06l-2.47 2.47H21a.75.75 0 0 1 0 1.5H4.81l2.47 2.47a.75.75 0 1 1-1.06 1.06l-3.75-3.75a.75.75 0 0 1 0-1.06l3.75-3.75a.75.75 0 0 1 1.06 0Z"
                                        clip-rule="evenodd"></path>
                                </svg>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="white" class="size-7">
                                    <path
                                        d="M11.47 3.841a.75.75 0 0 1 1.06 0l8.69 8.69a.75.75 0 1 0 1.06-1.061l-8.689-8.69a2.25 2.25 0 0 0-3.182 0l-8.69 8.69a.75.75 0 1 0 1.061 1.06l8.69-8.689Z">
                                    </path>
                                    <path
                                        d="m12 5.432 8.159 8.159c.03.03.06.058.091.086v6.198c0 1.035-.84 1.875-1.875 1.875H15a.75.75 0 0 1-.75-.75v-4.5a.75.75 0 0 0-.75-.75h-3a.75.75 0 0 0-.75.75V21a.75.75 0 0 1-.75.75H5.625a1.875 1.875 0 0 1-1.875-1.875v-6.198a2.29 2.29 0 0 0 .091-.086L12 5.432Z">
                                    </path>
                                </svg>
                            </a>
                            <button onclick="submitForm()" id="save_profile"
                                class="flex flex-row bg-[#563a2d] w-fit rounded-lg justify-center items-center px-6 py-3 gap-x-2 font-bold text-white text-lg"
                                disabled>
                                Save Profile
                            </button>
                        </div>
                    </div>
                </div>
                <%@include file="footer.jsp" %>
                    <script>
                        function toggleEdit() {
                            let saveProfile = document.querySelector("#save_profile");
                            saveProfile.removeAttribute('disabled');

                            let edit_profile = document.querySelector("#edit_profile");


                            let allInput = document.querySelectorAll("input");
                            for (let i = 0; i < allInput.length; i++) {
                                allInput[i].removeAttribute('disabled');
                            }
                            let allConfirmPassword = document.querySelectorAll(".firstName, .lastName");
                                for (let i = 0; i < allConfirmPassword.length; i++)
                                    allConfirmPassword[i].style.display = "block";
                            let allFullName = document.querySelectorAll(".fullName,input[name='fullName']");
                                for (let i = 0; i < allFullName.length; i++)
                                    allFullName[i].style.display = "none";
                            document.querySelector("input[name='username']").setAttribute('disabled', 'true');
                            
                            if (document.querySelector("input[name='password']")) {
                                
                                let allConfirmPassword = document.querySelectorAll(".confirmPassword");
                                for (let i = 0; i < allConfirmPassword.length; i++)
                                    allConfirmPassword[i].style.display = "block";

                                document.querySelector("label[for='password']").innerHTML = "New Password:";
                            }
                        }
                    </script>

                    <script>
                        let errorMsg = document.querySelector("#error");
                        let imgInput = document.querySelector("input[name='file']");
                        let img = document.querySelectorAll(".avatar");

                        imgInput.addEventListener('change', (event) => {
                            const file = event.target.files[0]; // Get the first uploaded file
                            if (file) {
                                const reader = new FileReader();
                                reader.onload = function (e) {
                                    for (let i = 0; i < img.length; i++)
                                        img[i].setAttribute("src", e.target.result); // Set the background image to the file's data URL
                                };
                                reader.readAsDataURL(file); // Read the file as a data URL
                            }

                            let formData = new FormData();
                            formData.append("file", file);

                            fetch("profile_avatar",
                                {
                                    method: "POST",
                                    body: formData
                                })
                                .then(response => response.json())
                                .then(data => {
                                    if (data.error) {
                                        errorMsg.innerHTML = data.error;
                                    }
                                    if (data.success) {
                                        for (let i = 0; i < img.length; i++) {

                                            img[i].setAttribute("src", data.success);
                                        }
                                        console.log(data.success);
                                    }
                                });
                        });
                        // });
                    </script>

                    <script>
                        function submitForm() {
                            let errorMsg = document.querySelector("#error");

                            const formData = new URLSearchParams();

                            let username = document.querySelector("input[name='username']").value;
                            let password = "";
                            let confirmPassword = "";
                            if (document.querySelector("input[name='password']")) {
                                password = document.querySelector("input[name='password']").value;
                            }
                            if (document.querySelector("input[name='re-enter-password']")) {
                                confirmPassword = document.querySelector("input[name='re-enter-password']").value;
                            }
                            let firstName = document.querySelector("input[name='firstName']").value;
                            let lastName = document.querySelector("input[name='lastName']").value;
                            let email = document.querySelector("input[name='email']").value;
                            let phone = document.querySelector("input[name='phone']").value;
                            let gender = document.querySelector("input[name='gender']:checked").value;
                            let address = document.querySelector("input[name='address']").value;
                            let dob = document.querySelector("input[name='dob']").value;


                            formData.append("username", username);
                            formData.append("password", password);
                            formData.append("confirmPassword", confirmPassword);
                            formData.append("firstName", firstName);
                            formData.append("lastName", lastName);

                            formData.append("email", email);
                            formData.append("phone", phone);
                            formData.append("gender", gender);
                            formData.append("dob", dob);
                            formData.append("address", address);

                            const baseURL = window.location.origin;
                            console.log(baseURL);
                            fetch("profile", {
                                method: "POST",
                                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                                body: formData.toString()
                            })
                                .then(response => response.json())
                                .then(data => {
                                    if (data.success) {
                                        window.location.href = data.redirect;

                                    }
                                    if (data.error) {

                                        errorMsg.innerHTML = data.error;

                                    }
                                });
                                
                        }
                    </script>
        </body>

        </html>

