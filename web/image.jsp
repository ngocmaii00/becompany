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
            <div class="images">
                <div class="images-big" style="background-image: url('${requestScope.images[0]}')"></div>
                <div class="images-small">
                    <c:forEach items="${requestScope.images}" var="i">
                        <div class="image-small" data-image-link="${i}" style="background-image: url('${i}')"></div>

                    </c:forEach>
                </div>
            </div>



            <div class="change">
                <h2>${requestScope.productName}</h2>

                <form action="image" method="post">
                    <input name="productId" class="image-link" value="${requestScope.productId}" readonly/>
                    <div class="form-rows">
                        <c:forEach items="${requestScope.count}" var="i">
                            <div class="form-row">
                                <p class="image-index">Image ${i+1}</p>
                                <input class="image-link" name="image" value="${requestScope.images[i]}" placeholder="Image link"/>
                            </div>
                        </c:forEach>
                    </div>

                    <button>Submit</button>
                    <button class="add-button" type="button">Add image</button>
                    <button>
                        <a href="pros" style="color: white">Product page</a>
                    </button>
                </form>
            </div>
        </main>

        <script>
            document.querySelectorAll('.image-small').forEach((image) => {
                image.addEventListener('click', () => {
                    const imageLink = image.dataset.imageLink;
                    document.querySelector('.images-big').style.backgroundImage = "url('" + imageLink + "')";
                });
            });

            document.querySelector('.add-button').addEventListener(('click'), () => {
                const count = document.querySelectorAll('.image-link').length;
                document.querySelector('.form-rows').innerHTML += `
                            <div class="form-row">
                                <p class="image-index">Image `+count+`</p>
                                <input class="image-link" name="image" placeholder="Image link"/>
                            </div>`;
            });
        </script>
    </body>
</html>
