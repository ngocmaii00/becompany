<%-- 
    Document   : login
    Created on : Feb 15, 2025, 6:54:46 PM
    Author     : zeryus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        
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
    <body class="w-screen h-screen pt-[3%] ">
        <div class="flex flex-row gap-6 justify-center" style="background-color: #4f362b; height:90%; width:100%; ">
            <div class="basis-1/2">
                <img src="/becompany/image/head.png" class="w-[40%]  mx-[30%] mt-[17%] aspect-[146/107]"/>
                <h1 class="text-gray-50 text-7xl text-center mt-7 uppercase font-extrabold">becompany</h1>
            </div>
            <div class="basis-1/2 font-medium font-bold">
                  
                <div class=" flex flex-col gap-8  h-[83%] w-[75%]  p-[7%] pt-[4%] px-1/5 bg-[#f2e6e6] rounded-3xl border-3 border-gray-950" style="margin:6% 14% 6% 7%;">
                    <h1 class="basicuppercase font-bold text-6xl text-center text-[#563a2d]" >
                        Login
                    </h1>
                <form class="h-[50%]"action="login" method="post">
                    <div class=" mb-3 h-[4em] w-10/10">
                        <input type="text" name="username" id="username" class="h-full w-full text-2xl border-4 border-gray-950 rounded-3xl h-full p-1 bg-[#ffffff] hover:bg-[#ffffff]/60 pl-[16px] placeholder:font-bold" placeholder="Username">
                    </div>
                    <div class="mb-3  h-[4em] w-10/10 relative">
                        <input type="password" name="password" id="password" class="h-full w-full text-2xl border-4 border-gray-950 rounded-3xl p-1 h-full bg-[#ffffff] hover:bg-[#ffffff]/60 pl-[16px] placeholder:font-bold" placeholder="Password">
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
                    <div class="grid grid-cols-2 mb-2 mx-2">
                        <div class="inline-flex items-center">
                            <label class="flex items-center cursor-pointer relative" for="check-2">
                              <input type="checkbox"
                                checked
                                class="peer h-5 w-5 cursor-pointer transition-all appearance-none rounded shadow hover:shadow-md  border border-3 border-[#563a2d] checked:bg-[#563a2d] checked:border-[#563a2d]"
                                id="check-2" />
                              <span class="absolute text-white opacity-0 peer-checked:opacity-100 top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-3.5 w-3.5" viewBox="0 0 20 20" fill="currentColor"
                                  stroke="currentColor" stroke-width="1">
                                  <path fill-rule="evenodd"
                                  d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
                                  clip-rule="evenodd"></path>
                                </svg>
                              </span>
                            </label>
                            <label class="cursor-pointer ml-2 text-xl  font-bold text-[#563a2d]" for="check-2">
                              Remember Me
                            </label>
                          </div>
                        <a class="inline-block text-xl justify-self-end text-[#563a2d] hover:underline font-bold" href="#" >Forgot password?</a>
                    </div>
                    <div class="h-[4em] w-full mt-4">
                        <button type="submit" class="h-full text-4xl text-white w-full h-full py-2/10 font-bold cursor-pointer uppercase bg-[#563a2d] hover:bg-[#563a2d]/80 ">Login</button>    
                    </div>

                </form>
                
                <div class="flex items-center gap-4">
                    <hr class="w-full border-3 border-[#563a2d]" />
                    <p class="text-xl text-gray-800 text-center uppercase text-[#563a2d]">or</p>
                    <hr class="w-full border-3 border-[#563a2d]"    />
                </div>
                <div>
                    <div class="grid grid-cols-2 gap-10">
                        <button type="button" class="border-4 border-black outline-none py-2 rounded-3xl bg-[#ffffff] hover:bg-[#ffffff]/40 text-[#563a2d] " >
                        <svg xmlns="http://www.w3.org/2000/svg" width="47px" viewBox="0 0 512 512" class="inline mx-1">
                            <path fill="#1877f2" d="M512 256c0 127.78-93.62 233.69-216 252.89V330h59.65L367 256h-71v-48.02c0-20.25 9.92-39.98 41.72-39.98H370v-63s-29.3-5-57.31-5c-58.47 0-96.69 35.44-96.69 99.6V256h-65v74h65v178.89C93.62 489.69 0 383.78 0 256 0 114.62 114.62 0 256 0s256 114.62 256 256z" data-original="#1877f2" />
                            <path fill="#fff" d="M355.65 330 367 256h-71v-48.021c0-20.245 9.918-39.979 41.719-39.979H370v-63s-29.296-5-57.305-5C254.219 100 216 135.44 216 199.6V256h-65v74h65v178.889c13.034 2.045 26.392 3.111 40 3.111s26.966-1.066 40-3.111V330z" data-original="#ffffff" />
                        </svg>
                        <p class="inline-block w-3/5 ml-1  mt-1 text-[1.65rem]">Facebook</p>
                    </button>
                    <button type="button" class="border-4 border-black outline-none py-2 rounded-3xl bg-[#ffffff] hover:bg-[#ffffff]/40 text-[#563a2d] ">
                        <svg xmlns="http://www.w3.org/2000/svg" width="47px" viewBox="0 0 512 512" class="inline mx-1">
                        <path fill="#fbbd00" d="M120 256c0-25.367 6.989-49.13 19.131-69.477v-86.308H52.823C18.568 144.703 0 198.922 0 256s18.568 111.297 52.823 155.785h86.308v-86.308C126.989 305.13 120 281.367 120 256z" data-original="#fbbd00" />
                        <path fill="#0f9d58" d="m256 392-60 60 60 60c57.079 0 111.297-18.568 155.785-52.823v-86.216h-86.216C305.044 385.147 281.181 392 256 392z" data-original="#0f9d58" />
                        <path fill="#31aa52" d="m139.131 325.477-86.308 86.308a260.085 260.085 0 0 0 22.158 25.235C123.333 485.371 187.62 512 256 512V392c-49.624 0-93.117-26.72-116.869-66.523z" data-original="#31aa52" />
                        <path fill="#3c79e6" d="M512 256a258.24 258.24 0 0 0-4.192-46.377l-2.251-12.299H256v120h121.452a135.385 135.385 0 0 1-51.884 55.638l86.216 86.216a260.085 260.085 0 0 0 25.235-22.158C485.371 388.667 512 324.38 512 256z" data-original="#3c79e6" />
                        <path fill="#cf2d48" d="m352.167 159.833 10.606 10.606 84.853-84.852-10.606-10.606C388.668 26.629 324.381 0 256 0l-60 60 60 60c36.326 0 70.479 14.146 96.167 39.833z" data-original="#cf2d48" />
                        <path fill="#eb4132" d="M256 120V0C187.62 0 123.333 26.629 74.98 74.98a259.849 259.849 0 0 0-22.158 25.235l86.308 86.308C162.883 146.72 206.376 120 256 120z" data-original="#eb4132" />
                        </svg>
                        <p class="inline-block w-3/5 ml-1 mt-1 text-[1.65rem]">Google</p>
                    </button>
                    </div>
                </div>
                <div class=" mt-10  text-xl text-center ">
                    <p class="inline text-[#563a2d]">Don't have an account?</p>
                    <button type="button" class="inline-block ml-1 px-2.5 py-0.5 font-large text-gray-50 rounded-3xl bg-[#563a2d] hover:bg-[#563a2d]/80  cursor-pointer" >Sign up</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        const toggle_password = document.querySelector('#togglePassword');
        const eye_icon = document.querySelector('#eye');
        const eye_slash_icon = document.querySelector('#eye-slash');
        const password = document.querySelector('#password');

        toggle_password.addEventListener('click', () =>{
            if(password.type === 'password'){
                password.type = 'text' ;
                eye_icon.style.display = 'none';
                eye_slash_icon.style.display = 'inline';
            }else{
                 password.type = 'password';
                 eye_icon.style.display = 'inline';
                 eye_slash_icon.style.display = 'none';
            }

            
        } );
    </script>
        
    </body>
</html>
