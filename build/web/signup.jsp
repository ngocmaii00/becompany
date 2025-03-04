<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign-up</title>
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
        <div class="py-5em flex flex-row gap-6 justify-center" style="background-color: #4f362b; height:90%; width:100%; ">
            <div class="basis-1/2">
                <img src="/becompany/image/head.png" class="w-[40%]  mx-[30%] mt-[17%] aspect-[146/107]"/>
                <h1 class="text-gray-50 text-7xl text-center mt-7 peacesans-font uppercase font-extrabold">becompany</h1>
            </div>
            <div class="basis-1/2 font-medium font-bold">
                  
                <div class=" flex flex-col gap-4  h-[83%] w-[75%]  p-[7%] pt-[4%] px-1/5 bg-[#f2e6e6] rounded-3xl border-3 border-gray-950" style="margin:6% 14% 6% 7%;">
                    <h1 class="basic uppercase font-bold peacesans-font text-3xl text-center text-[#563a2d]" >
                        Sign Up
                    </h1>
                <div class="h-[65%]">
                    <div class=" mb-3 h-[3.4em] w-10/10">
                        <input type="text" name="email" id="email" class="h-full w-full text-2xl border-4 notosans-font border-gray-950 rounded-2xl h-full p-1  bg-[#ffffff] hover:bg-[#ffffff]/40  pl-[16px] placeholder:font-bold" placeholder="Email">
                    </div>
                    <div class=" mb-3 h-[3.4em] w-10/10">
                        <input type="text" name="username" id="username" class="h-full w-full text-2xl border-4 notosans-font border-gray-950 rounded-2xl h-full p-1  bg-[#ffffff] hover:bg-[#ffffff]/40  pl-[16px] placeholder:font-bold" placeholder="Username">
                    </div>
                    <div class="mb-3  h-[3.4em] w-10/10 relative">
                        <input type="password" name="password" id="password" class="h-full w-full text-2xl border-4 notosans-font border-gray-950 rounded-2xl p-1 h-full bg-[#ffffff] hover:bg-[#ffffff]/40  pl-[16px] placeholder:font-bold"  placeholder="Password">
                        <button type="button" id="togglePassword" class="absolute top-[50%] right-[1rem] translate-y-[-50%]  cursor-pointer w-[1.5rem] flex items-center">

                        <svg id="eye" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                            <path id="firstPath" stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 0 1 0-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178Z" />
                            <path id="secondPath"stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                          </svg>
                          <svg id="eye-slash" style="display:none" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M3.98 8.223A10.477 10.477 0 0 0 1.934 12C3.226 16.338 7.244 19.5 12 19.5c.993 0 1.953-.138 2.863-.395M6.228 6.228A10.451 10.451 0 0 1 12 4.5c4.756 0 8.773 3.162 10.065 7.498a10.522 10.522 0 0 1-4.293 5.774M6.228 6.228 3 3m3.228 3.228 3.65 3.65m7.894 7.894L21 21m-3.228-3.228-3.65-3.65m0 0a3 3 0 1 0-4.243-4.243m4.242 4.242L9.88 9.88" />
                          </svg>
                                                    
                        </button>
                          
                    </div>
                    <div class="mb-3  h-[3.4em] w-10/10 relative">
                        <input type="password" name="password_re_enter" id="password_re_enter" class="h-full w-full text-2xl border-4 notosans-font border-gray-950 rounded-2xl p-1 h-full bg-[#ffffff] hover:bg-[#ffffff]/60  pl-[16px] placeholder:font-bold" placeholder="Re-enter password">
                        <button type="button" id="toggleReEnter" class="absolute top-[50%] right-[1rem] translate-y-[-50%]  cursor-pointer w-[1.5rem] flex items-center">

                        <svg id="eye-re" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                            <path id="firstPath" stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 0 1 0-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178Z" />
                            <path id="secondPath"stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                          </svg>
                          <svg id="eye-slash-re" style="display:none" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M3.98 8.223A10.477 10.477 0 0 0 1.934 12C3.226 16.338 7.244 19.5 12 19.5c.993 0 1.953-.138 2.863-.395M6.228 6.228A10.451 10.451 0 0 1 12 4.5c4.756 0 8.773 3.162 10.065 7.498a10.522 10.522 0 0 1-4.293 5.774M6.228 6.228 3 3m3.228 3.228 3.65 3.65m7.894 7.894L21 21m-3.228-3.228-3.65-3.65m0 0a3 3 0 1 0-4.243-4.243m4.242 4.242L9.88 9.88" />
                          </svg>
                                                    
                        </button>
                    </div>
                   
                    <div class="h-[3em] w-full mt-8">
                        <button type="button" onclick="submitForm()" class="h-full text-2xl text-white w-full h-full py-2/10 peacesans-font font-bold uppercase bg-[#563a2d] hover:bg-[#563a2d]/80 cursor-pointer">Sign Up</button>    
                    </div>

                </div>
                
                <p id="error" class="text-red-500 text-center mt-8 mb-2 "></p>    
                <div class="text-xl text-center ">
                    <p class="inline notosans-font text-[#563a2d]">Already had an account?</p>
                    <a type="button" href="login" class="inline-block ml-1 px-6 py-0.5 font-large text-gray-50 rounded-3xl cursor-pointer bg-[#563a2d] hover:bg-[#563a2d]/80 cursor-pointer">Login</a>
                </div>
            </div>
        </div>
    </div>
    <script>
        const toggle_password = document.querySelector('#togglePassword');
        const eye_icon = document.querySelector('#eye');
        const eye_slash_icon = document.querySelector('#eye-slash');
        const password = document.querySelector('#password');

        const toggleReEnter = document.querySelector("#toggleReEnter");
        const eye_re_icon = document.querySelector('#eye-re');
        const eye_slash_re_icon = document.querySelector('#eye-slash-re');
        const password_re_enter = document.querySelector('#password_re_enter');

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
        });
        toggleReEnter.addEventListener('click', () =>{
            if(password_re_enter.type === 'password'){
                password_re_enter.type = 'text' ;
                eye_re_icon.style.display = 'none';
                eye_slash_re_icon.style.display = 'inline';
            }else{
                 password_re_enter.type = 'password';
                 eye_re_icon.style.display = 'inline';
                 eye_slash_re_icon.style.display = 'none';
            }
        }); 
            
        
    </script>
    <script>
        
        function submitForm(){
            let errorMsg = document.querySelector("#error");

            const formData = new URLSearchParams();
            let email = document.querySelector("#email").value;
            let username = document.querySelector("#username").value;
            let password = document.querySelector("#password").value;
            let password_re_enter = document.querySelector("#password_re_enter").value;

            formData.append("email", email);
            formData.append("username", username);
            formData.append("password", password);
            formData.append("password_re_enter", password_re_enter);
            
            
           
            fetch("signup", {
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
