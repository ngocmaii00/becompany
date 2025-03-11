<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Becompany</title>
        <link rel="stylesheet" href="css/imageStyle.css"/>
    </head>
    <body>
        <main>
            <c:if test="${requestScope.slides.size() > 0}">
                <div class="images">
                    <div class="images-big" style="background-image: url('${requestScope.slides.get(0).image}')">
                        <h3>${requestScope.slides.get(0).description}</h3>
                    </div>
                    <div class="images-small">
                        <c:forEach items="${requestScope.slides}" var="i">
                            <div class="image-small" data-image-link="${i.image}" data-image-desc="${i.description}" style="background-image: url('${i.image}')"></div>

                        </c:forEach>
                    </div>
                </div>



                <div class="change">
                    <h2>Becompany</h2>

                    <form action="slides" method="post">
                        <div class="form-rows">
                            <c:forEach items="${requestScope.slides}" var="i">
                                <div class="form-row">
                                    <input class="image-link" name="image" value="${i.image}" placeholder="Image Link"/>
                                    <input class="image-title" name="title" value="${i.description}" placeholder="Image Title"/>
                                </div>
                            </c:forEach>
                        </div>

                        <button>Submit</button>
                        <button class="add-button" type="button">Add image</button>
                        <button class="add-button" type="button">
                            <a href="admin.jsp">Admin page</a>
                        </button>

                    </form>
                </div>
            </main>
        </c:if>
        
        <c:if test="${requestScope.slides.size() == 0}">
                <div class="change">
                    <h2>Becompany</h2>

                    <form action="slides" method="post">
                        <div class="form-rows">
                            
                                <div class="form-row">
                                    <input class="image-link" name="image" placeholder="Image Link"/>
                                    <input class="image-title" name="title" placeholder="Image Title"/>
                                </div>
                            
                        </div>

                        <button>Submit</button>
                        <button class="add-button" type="button">Add image</button>
                        <button class="add-button" type="button">
                            <a href="admin.jsp">Admin page</a>
                        </button>

                    </form>
                </div>
            </main>
        </c:if>


        <script>
            document
            document.querySelectorAll('.image-small').forEach((image) => {
                image.addEventListener('click', () => {
                    const imageLink = image.dataset.imageLink;
                    const imageDesc = image.dataset.imageDesc;
                    document.querySelector('.images-big').style.backgroundImage = "url('" + imageLink + "')";
                    document.querySelector('.images-big h3').innerText = imageDesc;
                });
            });

            document.querySelector('.add-button').addEventListener(('click'), () => {
                const count = document.querySelectorAll('.image-link').length;
                document.querySelector('.form-rows').innerHTML += `
                    <div class="form-row">
                        <input class="image-link" name="image" placeholder="Image Link"/>
                        <input class="image-title" name="title" placeholder="Image Title"/>
                    </div>
                `;
            });
        </script>
    </body>
</html>
