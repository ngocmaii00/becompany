

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="css/index.css">
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
    <body class="w-screen h-screen pt-[3%] ">
        <div class="flex flex-row gap-6 justify-center bg-lime-50" style=" height:90%; width:100%; ">
            <div class="basis-1/2 font-medium font-bold">
                  
                <div class=" flex flex-col gap-5  h-[83%] w-[75%]  p-[7%] pt-[4%] px-1/5 bg-[#f2e6e6] rounded-3xl border-3 border-gray-950" style="margin:6% 7% 6% 14%;">
                    <h1 class="mt-10 basic uppercase peacesans-font font-bold text-5xl text-center text-[#563a2d]" >
                        Login
                    </h1>
                <div class="h-[80%]">
                    <div class=" mb-3 h-[3.5em] w-10/10">
                        <input type="text" 
                               name="username" 
                               id="username" 
                               class="h-full w-full text-2xl border-4 notosans-font border-gray-950 rounded-3xl h-full p-1 bg-[#ffffff] hover:bg-[#ffffff]/60 pl-[16px] placeholder:font-bold" 
                               value="${cookie.cu.value}"
                               placeholder="Username">
                    </div>
                               
                    <div class="mb-3  h-[3.5em] w-10/10 relative">
                        <input type="password" 
                               name="password" 
                               id="password" 
                               class="h-full w-full text-2xl border-4 notosans-font border-gray-950 rounded-3xl p-1 h-full bg-[#ffffff] hover:bg-[#ffffff]/60 pl-[16px] placeholder:font-bold" 
                               value="${cookie.cp.value}"
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
                    <p class="text-red-700 ml-2" id="error">${requestScope.nonLocalError}</p>
                    
                    <div class="grid grid-cols-2 mb-2 mx-2">
                        <div class="inline-flex items-center">
                            <label class="flex items-center cursor-pointer relative" for="check-2">
                              <input type="checkbox"
                                
                                name="rememberme"
                                class="peer h-5 w-5 cursor-pointer transition-all appearance-none rounded shadow hover:shadow-md  border border-3 border-[#563a2d] checked:bg-[#563a2d] checked:border-[#563a2d]"
                                id="check-2"
                                ${cookie.cr.value == 'on'?"checked":""}
                                />
                              <span class="absolute text-white opacity-0 peer-checked:opacity-100 top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2">
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
                        <a class="inline-block text-md justify-self-end text-[#563a2d] hover:underline font-bold notosans-font" href="forgot-password" >Forgot password?</a>
                    </div>
                    <div class="h-[3em] w-full mt-4">
                        <button type="submit" onclick="submitForm()" class="h-full text-2xl text-white peacesans-font w-full h-full py-2/10 font-bold cursor-pointer uppercase bg-[#563a2d] hover:bg-[#563a2d]/80 ">Login</button>    
                    </div>

                
                
              
                </div>
               
            </div>
        </div>
         <div class="basis-1/2">
                <img src="/becompany/image/head.png" class="w-[40%]  mx-[30%] mt-[17%] aspect-[146/107]"/>

                <h1 class="text-gray-700 text-7xl peacesans-font text-center mt-7 uppercase font-extrabold">becompany</h1>

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
    <script>
        
        function submitForm(){
            let errorMsg = document.querySelector("#error");

            const formData = new URLSearchParams();

            let username = document.querySelector("#username").value;
            let password = document.querySelector("#password").value;
            formData.append("username", username);
            formData.append("password", password);
            
            const baseURL = window.location.origin;
            console.log(baseURL);
            fetch("login", {
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
            })
            .catch(error => {
                console.error("Fetch Error:", error);
            });
        }
        
    </script>
    
        
    </body>
</html>
