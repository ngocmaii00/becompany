

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="CSS/index.css">
        <link rel="icon" type="image/svg+xml" href="images/head.png" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
        <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
        <script>
//            tailwind.config = {
//              theme: {
//                extend: {
//                  colors: {
//                    backgroundBrown: '#4f362b',
//                  },
//                },
//              },
//            };
        </script>


    </head>
    <body class="w-screen h-screen flex items-center">
        <div class="flex flex-row gap-6 justify-between p-8" style="background-color: #4f362b; width:100%;">
            <div class="flex flex-col items-center justify-center p-8">
                <img src="/becompany/image/head.png" class="w-[40%]"/>

                <h1 class="text-gray-50 peacesans-font text-center mt-7 uppercase font-extrabold" style="font-size: 5vw">becompany</h1>

            </div>
            <div class="font-medium font-bold w-[50%] flex items-center justify-center">

                <div class=" flex flex-col py-8 px-10 bg-[#f2e6e6] rounded-3xl border-3 border-gray-950 w-[450px]">
                    <h1 class="basic uppercase peacesans-font font-bold text-4xl text-center text-[#563a2d]" >
                        Login
                    </h1>
                <div class="h-[80%]">
                  

                    <div>
                        <div class=" mt-5 h-[3.5em] w-10/10">
                            <input type="text" 
                                   name="username" 
                                   id="username" 
                                   class="h-full w-full text-lg border-2 notosans-font border-gray-950 rounded-xl h-full p-3 bg-[#ffffff] hover:bg-[#ffffff]/60 pl-[16px] placeholder:font-bold" 
                                   placeholder="Username"
                                   value="${cookie.cu.value}">
                                   
                        </div>
                        <div class="mt-3 mb-3  h-[3.5em] w-10/10 relative">
                            <input type="password" 
                                   name="password" 
                                   id="password"
                                   value="${cookie.cp.value}"
                                   class="h-full w-full text-lg border-2 notosans-font border-gray-950 rounded-xl h-full p-3 bg-[#ffffff] hover:bg-[#ffffff]/60 pl-[16px] placeholder:font-bold" 
                                   placeholder="Password">

                            <button type="button" id="togglePassword" class="absolute top-[50%] right-[1rem] translate-y-[-50%]  cursor-pointer w-[1.5rem] flex items-center">

                                <svg id="eye" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                                <path id="firstPath" stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 0 1 0-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178Z" />
                                <path id="secondPath"stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                                </svg>
                                <svg id="eye-slash" style="display:none" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M3.98 8.223A10.477 10.477 0 0 0 1.934 12C3.226 16.338 7.244 19.5 12 19.5c.993 0 1.953-.138 2.863-.395M6.228 6.228A10.451 10.451 0 0 1 12 4.5c4.756 0 8.773 3.162 10.065 7.498a10.522 10.522 0 0 1-4.293 5.774M6.228 6.228 3 3m3.228 3.228 3.65 3.65m7.894 7.894L21 21m-3.228-3.228-3.65-3.65m0 0a3 3 0 1 0-4.243-4.243m4.242 4.242L9.88 9.88" />
                                </svg>

                            </button>
                            <!-- type="checkbox" name="peer remember" id="remember" -->
                            <!-- <label class="text-xl  font-bold text-[#563a2d] cursor-pointer"for="remember"> Remember me</label> -->
                        </div>
                                   <p class="text-red-700 ml-2" id="error">${requestScope.error}</p>
                        <div class="grid grid-cols-2 mb-2 mx-2">
                            <div class="inline-flex items-center">
                                <label class="flex items-center cursor-pointer relative" for="check-2">
                                    <input type="checkbox"
                                           id="check-2"
                                           name="rem"
                                            
                                           class="peer h-5 w-5 cursor-pointer transition-all appearance-none rounded shadow hover:shadow-md  border border-3 border-[#563a2d] checked:bg-[#563a2d] checked:border-[#563a2d]"
                                           value="on"
                                           ${cookie.cr.value == 'on'?"checked":""}  />
                                    <span for="check-2" class="absolute text-white opacity-0 peer-checked:opacity-100 top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-3.5 w-3.5" viewBox="0 0 20 20" fill="currentColor"
                                             stroke="currentColor" stroke-width="1">
                                        <path fill-rule="evenodd"
                                              d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
                                              clip-rule="evenodd"></path>
                                        </svg>
                                    </span>
                                </label>

                                <label class="cursor-pointer ml-2 text-md notosans-font font-bold text-[#563a2d]" for="check-2">
                                    Remember Me
                                </label>
                            </div>
                            <a class="inline-block text-base justify-self-end text-[#563a2d] hover:underline font-bold notosans-font" href="forgot-password" >Forgot password?</a>
                        </div>
                        <div class="h-[3em] w-full mt-4">
                            <button type="submit" onclick="submitForm()" 
                                    class="text-xl text-white peacesans-font w-full pt-4 pb-3 rounded-xl cursor-pointer uppercase bg-[#563a2d] hover:bg-[#563a2d]/80 ">
                                Login
                            </button>    
                        </div>



                        <div class="flex items-center py-5 gap-4">
                            <hr class="w-full border-2 border-[#563a2d]" />
                            <p class="text-md text-gray-800 text-center uppercase text-[#563a2d]">or</p>
                            <hr class="w-full border-2 border-[#563a2d]"    />

                        </div>
                        <div>
                            <div class="flex justify-between">
                                <a  href="https://www.facebook.com/v2.12/dialog/oauth?client_id=3449601631840990&redirect_uri=https://localhost:9999/becompany/login-facebook&scope=email,public_profile&respond_type=code"
                                    class="inline-flex justify-center items-center bg-white text-lg p-3 border-2 border-gray-950 rounded-xl" style="width: 49%">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="36px" viewBox="0 0 512 512" class="mr-2">
                                    <path fill="#1877f2" d="M512 256c0 127.78-93.62 233.69-216 252.89V330h59.65L367 256h-71v-48.02c0-20.25 9.92-39.98 41.72-39.98H370v-63s-29.3-5-57.31-5c-58.47 0-96.69 35.44-96.69 99.6V256h-65v74h65v178.89C93.62 489.69 0 383.78 0 256 0 114.62 114.62 0 256 0s256 114.62 256 256z" data-original="#1877f2" />
                                    <path fill="#fff" d="M355.65 330 367 256h-71v-48.021c0-20.245 9.918-39.979 41.719-39.979H370v-63s-29.296-5-57.305-5C254.219 100 216 135.44 216 199.6V256h-65v74h65v178.889c13.034 2.045 26.392 3.111 40 3.111s26.966-1.066 40-3.111V330z" data-original="#ffffff" />
                                    </svg>
                                    <p class="notosans-font">Facebook</p>
                                </a>
                                <a  href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:9999/becompany/login-google&response_type=code&client_id=852116808382-82db8ra9hkc52bsm7dmq7utbej4d9hi3.apps.googleusercontent.com&prompt=none" 
                                    class="inline-flex justify-center items-center bg-white text-lg p-3 border-2 border-gray-950 rounded-xl" style="width: 49%">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="30px" viewBox="0 0 512 512" class="mr-2">
                                    <path fill="#fbbd00" d="M120 256c0-25.367 6.989-49.13 19.131-69.477v-86.308H52.823C18.568 144.703 0 198.922 0 256s18.568 111.297 52.823 155.785h86.308v-86.308C126.989 305.13 120 281.367 120 256z" data-original="#fbbd00" />
                                    <path fill="#0f9d58" d="m256 392-60 60 60 60c57.079 0 111.297-18.568 155.785-52.823v-86.216h-86.216C305.044 385.147 281.181 392 256 392z" data-original="#0f9d58" />
                                    <path fill="#31aa52" d="m139.131 325.477-86.308 86.308a260.085 260.085 0 0 0 22.158 25.235C123.333 485.371 187.62 512 256 512V392c-49.624 0-93.117-26.72-116.869-66.523z" data-original="#31aa52" />
                                    <path fill="#3c79e6" d="M512 256a258.24 258.24 0 0 0-4.192-46.377l-2.251-12.299H256v120h121.452a135.385 135.385 0 0 1-51.884 55.638l86.216 86.216a260.085 260.085 0 0 0 25.235-22.158C485.371 388.667 512 324.38 512 256z" data-original="#3c79e6" />
                                    <path fill="#cf2d48" d="m352.167 159.833 10.606 10.606 84.853-84.852-10.606-10.606C388.668 26.629 324.381 0 256 0l-60 60 60 60c36.326 0 70.479 14.146 96.167 39.833z" data-original="#cf2d48" />
                                    <path fill="#eb4132" d="M256 120V0C187.62 0 123.333 26.629 74.98 74.98a259.849 259.849 0 0 0-22.158 25.235l86.308 86.308C162.883 146.72 206.376 120 256 120z" data-original="#eb4132" />
                                    </svg>

                                    <p class="notosans-font">Google</p>
                                </a>
                            </div>
                        </div>

                    </div>
                    <div class=" mt-3  text-md text-center ">
                        <p class="inline text-[#563a2d]">Don't have an account?</p>
                        <a href="signup" type="button" class="inline-block ml-1 font-base underline text-[#563a2d] hover:text-[#563a2d]/80  cursor-pointer" >Sign up</a>

                    </div>
                </div>
            </div>
        </div>
        <script>
            const toggle_password = document.querySelector('#togglePassword');
            const eye_icon = document.querySelector('#eye');
            const eye_slash_icon = document.querySelector('#eye-slash');
            const password = document.querySelector('#password');

            toggle_password.addEventListener('click', () => {
                if (password.type === 'password') {
                    password.type = 'text';
                    eye_icon.style.display = 'none';
                    eye_slash_icon.style.display = 'inline';
                } else {
                    password.type = 'password';
                    eye_icon.style.display = 'inline';
                    eye_slash_icon.style.display = 'none';
                }


            });
        </script>
        <script>

            function submitForm() {
                let errorMsg = document.querySelector("#error");

                const formData = new URLSearchParams();

                let username = document.querySelector("#username").value;
                let password = document.querySelector("#password").value;
                let rem = document.querySelector("#check-2").value
                formData.append("username", username);
                formData.append("password", password);
                formData.append("rem",rem);

                const baseURL = window.location.origin;
                console.log(baseURL);
                fetch("login", {
                    method: "POST",
                    headers: {"Content-Type": "application/x-www-form-urlencoded"},
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
                        })
                        .catch(error => {
                            console.error("Fetch Error:", error);
                        });
            }

        </script>


    </body>
</html>
