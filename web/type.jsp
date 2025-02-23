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

                    <form class="filter">
                        <div class="flex justify-between">
                            <div style="margin-right: 10px" class="filter-item filter-item-color">
                                <h4>Color</h4>
                                <select id="color" name="color">
                                    <option style="color: grey" value="">-Color-</option>
                                    <option value="brown">Brown</option>
                                    <option value="white">White</option>
                                    <option value="black">Black</option>
                                </select>
                            </div>
                            <div class="filter-item filter-item-size">
                                <h4>Size</h4>
                                <select id="size" name="size">
                                    <option style="color: grey" value="">-Size-</option>
                                    <option value="30cm">20cm</option>
                                    <option value="40cm">40cm</option>
                                    <option value="50cm">50cm</option>
                                </select>
                            </div>
                        </div>

                        <div class="filter-item">
                            <h4>Price range</h4>
                            <div class="filter-price">
                                <input style="margin-right: 10px" type="text" placeholder="from"/>
                                <input type="text" placeholder="to"/>
                            </div>
                        </div>

                        <div class="filter-item">
                            <h4>Status</h4>
                            <div class="filter-status">
                                <div class="filter-status-row">
                                    <input type="checkbox" value="available"/>
                                    <label>Available products</label>
                                </div> 
                                <div class="filter-status-row">
                                    <input type="checkbox" value="pre-order"/>
                                    <label>Pre-order products</label>
                                </div> 
                                <div class="filter-status-row">
                                    <input type="checkbox" value="on-sale"/>
                                    <label>On-sale products</label>
                                </div> 
                                <div class="filter-status-row">
                                    <input type="checkbox" value="free-ship"/>
                                    <label>Free-ship products</label>
                                </div> 
                            </div>
                        </div>

                        <div class="filter-item">
                            <h4>Rating</h4>
                            <div class="filter-rating">
                                <div class="filter-rating-row">
                                    <input type="checkbox" value="5"/>
                                    <label>Very good</label>
                                </div> 
                                <div class="filter-rating-row">
                                    <input type="checkbox" value="4"/>
                                    <label>Good</label>
                                </div>
                                <div class="filter-rating-row">
                                    <input type="checkbox" value="3"/>
                                    <label>Fine</label>
                                </div>
                                <div class="filter-rating-row">
                                    <input type="checkbox" value="2"/>
                                    <label>Not good</label>
                                </div>
                                <div class="filter-rating-row">
                                    <input type="checkbox" value="1"/>
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
                                <div>
                                    <c:forEach items="${p.getColors()}" var="color">
                                        <span class="home-teddy-color" style="background-color: ${color}"></span>
                                    </c:forEach>
                                </div>
                                <div class="home-teddy-sizes">
                                    <c:forEach items="${p.getSizes()}" var="size">
                                        <span class="home-teddy-size">${size}</span>
                                    </c:forEach>
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
                                        <button class="button">Buy now</button>
                                        <button class="button-cart">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">
                                            <path d="M2.25 2.25a.75.75 0 0 0 0 1.5h1.386c.17 0 .318.114.362.278l2.558 9.592a3.752 3.752 0 0 0-2.806 3.63c0 .414.336.75.75.75h15.75a.75.75 0 0 0 0-1.5H5.378A2.25 2.25 0 0 1 7.5 15h11.218a.75.75 0 0 0 .674-.421 60.358 60.358 0 0 0 2.96-7.228.75.75 0 0 0-.525-.965A60.864 60.864 0 0 0 5.68 4.509l-.232-.867A1.875 1.875 0 0 0 3.636 2.25H2.25ZM3.75 20.25a1.5 1.5 0 1 1 3 0 1.5 1.5 0 0 1-3 0ZM16.5 20.25a1.5 1.5 0 1 1 3 0 1.5 1.5 0 0 1-3 0Z" />
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </main>

        <script src="scripts/type.js"></script>
    </body>
</html>
