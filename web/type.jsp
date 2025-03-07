<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BeCompany</title>
        <link rel="stylesheet" href="css/styles.css"/>
        <link rel="stylesheet" href="css/typeStyle.css"/>

    </head>
    <body>
        <%@include file="header.jsp" %>
        <main>
            <div class="type"> 
                <div class="filter-icon">
                    <h2>${requestScope.title}</h2>
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 6h9.75M10.5 6a1.5 1.5 0 1 1-3 0m3 0a1.5 1.5 0 1 0-3 0M3.75 6H7.5m3 12h9.75m-9.75 0a1.5 1.5 0 0 1-3 0m3 0a1.5 1.5 0 0 0-3 0m-3.75 0H7.5m9-6h3.75m-3.75 0a1.5 1.5 0 0 1-3 0m3 0a1.5 1.5 0 0 0-3 0m-9.75 0h9.75" />
                    </svg>
                </div>
                <div class="type-left">
                    <div class="type-header">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 3c2.755 0 5.455.232 8.083.678.533.09.917.556.917 1.096v1.044a2.25 2.25 0 0 1-.659 1.591l-5.432 5.432a2.25 2.25 0 0 0-.659 1.591v2.927a2.25 2.25 0 0 1-1.244 2.013L9.75 21v-6.568a2.25 2.25 0 0 0-.659-1.591L3.659 7.409A2.25 2.25 0 0 1 3 5.818V4.774c0-.54.384-1.006.917-1.096A48.32 48.32 0 0 1 12 3Z" />
                        </svg>
                        <h2>Filter</h2>
                    </div>

                    <form action="filter" class="filter">
                        <div class="flex filter-item filter-item-color">
                            <h4>Type</h4>
                            <input class="flex-1 ml-2" type="text" id="type" name="type" readonly value="<%= request.getParameter("type") != null ? request.getParameter("type") : "All" %>"/>
                        </div>
                        <div class="flex justify-between">
                            <div style="margin-right: 10px" class="flex flex-col filter-item filter-item-color">
                                <h4>Color</h4>
                                <input placeholder="-Color-" style="width: 100%" type="text" id="color" name="color" value="<%= request.getParameter("color") != null ? request.getParameter("color") : "" %>"/>

                            </div>
                            <div class="filter-item filter-item-size">
                                <h4>Size</h4>
                                <select id="size" name="size" value="${request.getParameter("size") != null ? request.getParameter("size") : ""}">
                                    <option style="color: grey" value="">-Size-</option>
                                    <option value="small">Small</option>
                                    <option value="medium">Medium</option>
                                    <option value="large">Large</option>
                                </select>
                            </div>
                        </div>

                        <div class="filter-item">
                            <h4>Price range</h4>
                            <div class="filter-price">
                                <input style="margin-right: 10px" name="from" type="text" placeholder="from" value="<%= request.getParameter("from") != null ? request.getParameter("from") : "" %>"/>
                                <input type="text" name="to" placeholder="to" value="<%= request.getParameter("to") != null ? request.getParameter("to") : "" %>"/>
                            </div>
                        </div>

                        <div class="filter-item">
                            <h4>Status</h4>
                            <div class="filter-status">

                                <div class="filter-status-row">
                                    <input name="status" type="checkbox" value="available"/>
                                    <label>Available products</label>
                                </div> 
                                <div class="filter-status-row">
                                    <input name="status" type="checkbox" value="preorder" />
                                    <label>Pre-order products</label>
                                </div> 
                                <div class="filter-status-row">
                                    <input name="status" type="checkbox" value="onsale" />
                                    <label>On-sale products</label>
                                </div> 
                                <div class="filter-status-row">
                                    <input name="status" type="checkbox" value="freeship" />
                                    <label>Free-ship products</label>
                                </div> 
                            </div>
                        </div>

                        <div class="filter-item">
                            <h4>Rating</h4>
                            <div class="filter-rating">
                                <div class="filter-rating-row">
                                    <input name="rating" type="checkbox" value="5"/>
                                    <label>Very good</label>
                                </div> 
                                <div class="filter-rating-row">
                                    <input name="rating" type="checkbox" value="4"/>
                                    <label>Good</label>
                                </div>
                                <div class="filter-rating-row">
                                    <input name="rating" type="checkbox" value="3"/>
                                    <label>Fine</label>
                                </div>
                                <div class="filter-rating-row">
                                    <input name="rating" type="checkbox" value="2"/>
                                    <label>Not good</label>
                                </div>
                                <div class="filter-rating-row">
                                    <input name="rating" type="checkbox" value="1"/>
                                    <label>Really bad</label>
                                </div>
                            </div>
                        </div>
                        <button class="button">Apply</button>
                    </form>
                </div>

                <div class="type-right">
                    <h2>${requestScope.title}</h2>
                    <div class="type-container">
                        <c:forEach items="${requestScope.data}" var="p">
                            <div class="home-teddy">
                                <a href="product?name=${p.getProductName()}">
                                    <div class="home-teddy-img" style="
                                         background-image: url('${p.getImages()[0]}');
                                         "></div>
                                </a>
                                <div class="flex justify-between items-baseline">
                                    <a href="product?name=${p.getProductName()}" class="home-teddy-name">${p.getProductName()}</a>
                                    <p class="home-teddy-price">${p.getTeddies().get(0).getPrice()}$</p>
                                </div>
                                <div class="home-teddy-${p.productId}">
                                    <div class="home-teddy-colors">
                                        <c:forEach items="${p.getColors()}" var="color">
                                            <span onclick="changeSize('${color}', '${p.productId}', '${p.colors}', '${p.sizes}')" class="home-teddy-color" style="background-color: ${color}">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="size-4 check-icon">
                                                <path fill-rule="evenodd" d="M12.416 3.376a.75.75 0 0 1 .208 1.04l-5 7.5a.75.75 0 0 1-1.154.114l-3-3a.75.75 0 0 1 1.06-1.06l2.353 2.353 4.493-6.74a.75.75 0 0 1 1.04-.207Z" clip-rule="evenodd" />
                                                </svg>
                                            </span>
                                        </c:forEach>
                                    </div>
                                    <div class="home-teddy-sizes">
                                        <c:forEach items="${p.getSizes()}" var="size">
                                            <span onclick="changeColor('${size}', '${p.productId}', '${p.colors}', '${p.sizes}')" class="home-teddy-size">${size}</span>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="flex justify-between align-center">
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
                                            <a href="product?name=${p.getProductName()}">Details</a>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </main>

        <%@include file="footer.jsp" %>
        <script src="scripts/type.js"></script>

        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>

        <script>

                                                function changeSize(color, productId, colors, sizes) {
                                                    'application/x-www-form-urlencoded; charset=UTF-8'
                                                    $.ajax({
                                                        url: "colorsize",
                                                        type: 'POST',
                                                        data: jQuery.param({color: color, productId: productId, sizes: sizes, colors: colors}),
                                                        dataType: 'application/json',
                                                        success: function (res) {
                                                            const classname = ".home-teddy-" + productId;
                                                            document.querySelector(classname).innerHTML = res;
                                                        }
                                                    });
                                                }

                                                function changeColor(size, productId, colors, sizes) {
                                                    $.ajax({
                                                        url: "colorsize",
                                                        type: 'POST',
                                                        data: jQuery.param({size: size, productId: productId, colors: colors, sizes: sizes}),
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
