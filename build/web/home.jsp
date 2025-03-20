<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BeCompany</title>
        <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
        <link rel="stylesheet" href="css/styles.css"/>
        <link rel="stylesheet" href="css/responsiveHome.css"/>
        
    </head>
    <body>
        <%@include file="header.jsp" %>
        <main>
            <div class="slide relative">
                <div class="slide-title">
                    <h3 class="absolute text-white" >Hello world!</h3>
                </div>
                <div class="dots"></div>
            </div>

            <div class="hightlight">
                <h2>Best-sellers</h2>
                <div class="hightlight-container">
                    <c:forEach items="${requestScope.data}" var="p">
                        <div class="home-teddy">
                            <a href="product?id=${p.productId}">
                                <div class="home-teddy-img" style="
                                     background-image: url('${p.getImages()[0]}');
                                     "></div>
                            </a>
                            <div class="flex justify-between items-baseline">
                                <a href="product?id=${p.productId}" class="home-teddy-name">${p.getProductName()}</a>
                                <p class="home-teddy-price"><fmt:formatNumber value="${p.getTeddies().get(0).getPrice()}" type="currency"/></p>
                            </div>
                            <div class="home-teddy-${p.productId}">
                                <div class="home-teddy-colors">
                                    <c:forEach items="${p.getColors()}" var="color">
                                        <span onclick="changeSize('${color}', '${p.productId}')" class="home-teddy-color" style="background-color: ${color}">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="size-4 check-icon">
                                            <path fill-rule="evenodd" d="M12.416 3.376a.75.75 0 0 1 .208 1.04l-5 7.5a.75.75 0 0 1-1.154.114l-3-3a.75.75 0 0 1 1.06-1.06l2.353 2.353 4.493-6.74a.75.75 0 0 1 1.04-.207Z" clip-rule="evenodd" />
                                            </svg>
                                        </span>
                                    </c:forEach>
                                </div>
                                <div class="home-teddy-sizes">
                                    <c:forEach items="${p.getSizes()}" var="size">
                                        <span onclick="changeColor('${size}', '${p.productId}')" class="home-teddy-size">${size}</span>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="flex justify-between items-center">
                                <div class="home-teddy-sold">
                                    <svg style="margin-right: 4px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">
                                    <path d="M3.375 4.5C2.339 4.5 1.5 5.34 1.5 6.375V13.5h12V6.375c0-1.036-.84-1.875-1.875-1.875h-8.25ZM13.5 15h-12v2.625c0 1.035.84 1.875 1.875 1.875h.375a3 3 0 1 1 6 0h3a.75.75 0 0 0 .75-.75V15Z" />
                                    <path d="M8.25 19.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0ZM15.75 6.75a.75.75 0 0 0-.75.75v11.25c0 .087.015.17.042.248a3 3 0 0 1 5.958.464c.853-.175 1.522-.935 1.464-1.883a18.659 18.659 0 0 0-3.732-10.104 1.837 1.837 0 0 0-1.47-.725H15.75Z" />
                                    <path d="M19.5 19.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0Z" />
                                    </svg>
                                    <span>${p.getSold()}</span>
                                </div>
                                <div class="flex justify-end">
                                    <button class="button">
                                        <a href="product?id=${p.productId}">Details</a>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <a class="see-more" href="type">See more</a>
            </div>


        </main>
        <%@include file="footer.jsp" %>

        <script type="text/javascript" src="scripts/home.js"></script>
        <script>
//            change slide show
            const slides = ${requestScope.slide.toString()};
            const dots = document.querySelector('.dots');

            for (var i = 0; i < slides.length; i++) {
                dots.innerHTML += `
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" class="size-4 dot">
                        <path d="M2 6.342a3.375 3.375 0 0 1 6-2.088 3.375 3.375 0 0 1 5.997 2.26c-.063 2.134-1.618 3.76-2.955 4.784a14.437 14.437 0 0 1-2.676 1.61c-.02.01-.038.017-.05.022l-.014.006-.004.002h-.002a.75.75 0 0 1-.592.001h-.002l-.004-.003-.015-.006a5.528 5.528 0 0 1-.232-.107 14.395 14.395 0 0 1-2.535-1.557C3.564 10.22 1.999 8.558 1.999 6.38L2 6.342Z" />
                    </svg>
                `;
            }
            changeSlide(slides);
        </script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
        
        <script>

            function changeSize(color, productId) {
                $.ajax({
                    url: "home",
                    type: 'POST',
                    data: jQuery.param({color: color, productId: productId}),
                    dataType: 'application/json',
                    success: function (res) {
                        const classname = ".home-teddy-" + productId;
                        document.querySelector(classname).innerHTML = res;
                    }
                });
            }

            function changeColor(size, productId) {
                $.ajax({
                    url: "home",
                    type: 'POST',
                    data: jQuery.param({size: size, productId: productId}),
                    dataType: 'application/json',
                    success: function (res) {
                        const classname = ".home-teddy-" + productId;
                        document.querySelector(classname).innerHTML = res;
                    }
                });
            }

        </script>
    </body>
</html>
