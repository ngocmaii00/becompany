<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Account</title>
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
            <div class="basis-1/2 font-medium font-bold">
                  
                <div class=" flex flex-col gap-4  h-[83%] w-[70%]  p-[7%] pt-[4%] px-1/5 bg-[#f2e6e6] rounded-3xl border-3 border-gray-950" style="margin:6% 7% 6% 7%;">
                    <h1 class="basic uppercase font-bold text-3xl peacesans-font text-center text-[#563a2d]" >
                        Reset Password
                    </h1>
                    <p class="inline text-[#563a2d] notosans-font">We will be sending a reset password link to your Email</p>
                <div class="h-[65%]">
                    <div class=" mb-3 h-[3.4em] w-10/10">
                           <input type="email" name="email" id="email" class="h-full w-full text-2xl border-4 border-gray-950 rounded-2xl h-full p-1  bg-[#ffffff] hover:bg-[#ffffff]/40  pl-[16px] placeholder:font-bold" placeholder="Email">
                    </div>
                    
                    <div id="alert" class="text-red-500 notosans-font mt-3 ml-5" ></div>
                    <div class="h-[3em] w-full mt-8">
                        <button type="button" onclick="submitForm()" class="h-full text-2xl text-white w-full h-full py-2/10 font-bold uppercase bg-[#563a2d] hover:bg-[#563a2d]/80 cursor-pointer">Confirm</button>    
                    </div>

                </div>
                
                <p id="error" class="text-red-500 text-center mt-8 mb-2 "></p>    
                <div class="text-xl text-center ">
                    <p class="inline text-[#563a2d]">Already had an account?</p>
                    <a type="button" href="login" class="inline-block ml-1 px-6 py-0.5 font-large text-gray-50 rounded-3xl cursor-pointer bg-[#563a2d] hover:bg-[#563a2d]/80 cursor-pointer">Login</a>
                </div>
            </div>
        </div>
    </div>
    <script>
        
        function submitForm(){
            let errorMsg = document.querySelector("#error");

            const formData = new URLSearchParams();
            let email = document.querySelector("#email").value;
           
            formData.append("email", email);
                       
            
           
            fetch("forgot-password", {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: formData.toString()
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    window.location.href = data.redirect;
                    
                }
                if (data.alert) {
                
                    errorMsg.innerHTML = data.alert;
                    
                } 
            });
           
        }
        
    </script>
        
    </body>
</html>
