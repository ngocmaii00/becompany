<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Becompany</title>
        <link rel="stylesheet" href="css/proStyle.css"/>
    </head>
    <body>
        <header>
            <h2>BECOMPANY</h2>
            <h2>PRODUCTS</h2>
        </header>

        <main>
            <nav>
                <div>
                    <div class="type-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
                        <path fill-rule="evenodd" d="M2.628 1.601C5.028 1.206 7.49 1 10 1s4.973.206 7.372.601a.75.75 0 0 1 .628.74v2.288a2.25 2.25 0 0 1-.659 1.59l-4.682 4.683a2.25 2.25 0 0 0-.659 1.59v3.037c0 .684-.31 1.33-.844 1.757l-1.937 1.55A.75.75 0 0 1 8 18.25v-5.757a2.25 2.25 0 0 0-.659-1.591L2.659 6.22A2.25 2.25 0 0 1 2 4.629V2.34a.75.75 0 0 1 .628-.74Z" clip-rule="evenodd" />
                        </svg>
                    </div>

                    <form class="type-form" action="prosfilter" method="get">
                        <div class="type">
                            <label for="gender">Gender</label>
                            <input type="radio" name="gender" id="gender" value="1"/><span>Male</span> 
                            <input type="radio" name="gender" id="gender" value="0"/> <span>Female</span>                             
                        </div>
                        <div class="type">
                            <label for="type">Type</label>
                            <input checked type="radio" name="type" id="type" value="mostorder"/><span>Most Order</span>
                            <input type="radio" name="type" id="type" value="leastorder"/><span>Least Order</span>                          
                        </div>
                        <div class="type">
                            <label for="types">Teddy Type</label>
                            <input checked type="radio" name="types" id="type" value="all"/><span>All</span> 
                            <c:forEach items="${requestScope.types}" var="type">
                                <input type="radio" name="types" id="type" value="${type.trim()}"/><span>${type.trim()}</span> 
                            </c:forEach>                         
                        </div>
                        <div class="type">
                            <label for="top">Top</label>
                            <input checked type="radio" name="top" id="top" value="1"/><span>Top 1</span>  
                            <input type="radio" name="top" id="top" value="5"/><span>Top 5</span> 
                            <input type="radio" name="top" id="top" value="10"/><span>Top 10</span>                          
                        </div>
                        <button>Filter</button>
                    </form>
                </div>
                <form action="pros" method="post" class="search">
                    <input name="search" class="search-input" type="text" placeholder="Search"/>
                    <button style="background: transparent; border: none">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
                        <path fill-rule="evenodd" d="M9 3.5a5.5 5.5 0 1 0 0 11 5.5 5.5 0 0 0 0-11ZM2 9a7 7 0 1 1 12.452 4.391l3.328 3.329a.75.75 0 1 1-1.06 1.06l-3.329-3.328A7 7 0 0 1 2 9Z" clip-rule="evenodd" />
                        </svg>
                    </button>
                </form>

                <div class="add-button">Add new</div>
            </nav>

            <div class="table">
                <div class="table-head">
                    <p class="table-id">Id</p>
                    <p class="table-name">Product Name</p>
                    <p class="table-origin">Origin</p>
                    <p class="table-descrip">Description</p>
                    <p class="table-manu">Manufacturer</p>
                    <p class="table-sold">Sold</p>
                    <p class="table-image">Image</p>
                    <p class="table-type">Type</p>
                    <p class="table-status">Status</p>
                    <p class="table-action">Action</p>
                </div>

                <c:forEach items="${requestScope.pros}" var="s">
                    <div class="table-data">
                        <p class="table-id">${s.productId}</p>
                        <p class="table-name">${s.productName}</p>
                        <p class="table-origin">${s.origin}</p>
                        <p class="table-descrip">${s.description}</p>
                        <p class="table-manu">${s.manufacturer}</p>
                        <p class="table-sold">${s.sold}</p>
                        <p class="table-image">
                            <a href="image?productId=${s.productId}">View</a>
                        </p>
                        <p class="table-type">${s.type}</p>
                        <p class="table-status">${s.status}</p>
                        <p class="table-action">
                            <svg data-product-id="${s.productId}" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6 edit-button">
                            <path stroke-linecap="round" stroke-linejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L10.582 16.07a4.5 4.5 0 0 1-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 0 1 1.13-1.897l8.932-8.931Zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0 1 15.75 21H5.25A2.25 2.25 0 0 1 3 18.75V8.25A2.25 2.25 0 0 1 5.25 6H10" />
                            <title>Edit</title>
                            </svg>

                            <svg data-product-id="${s.productId}" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6 detail-button">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 0 1 0-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178Z" />
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                            <title>See teddies' details</title>
                            </svg>

                        </p>
                    </div>

                    <!--teddy detail table-->
                    <div class="product-detail product-detail-${s.productId}">
                        <c:forEach items="${s.teddies}" var="t">
                            <form action="teddy" class="table-teddy table-teddy-${t.teddyId}">
                                <div class="teddy-id">
                                    <label>TeddyId</label>
                                    <input readonly="true" type="text" name="teddyId" value="${t.teddyId}">
                                </div>
                                <div class="teddy-color">
                                    <label>Color</label>
                                    <input readonly="true" type="text" name="color" value="${t.color}">

                                </div>
                                <div class="teddy-size">
                                    <label>Size</label>
                                    <input readonly="true" type="text" name="size" value="${t.size}">
                                </div>
                                <div class="teddy-quantity">
                                    <label>Quantity</label>
                                    <input readonly="true" type="number" name="quantity" value="${t.quantity}"></div>
                                <div class="teddy-price">
                                    <label>Price</label>
                                    <input readonly="true" type="text" name="price" value="${t.price}">
                                </div>
                                <div class="table-action">
                                    <svg data-teddy-id="${t.teddyId}" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6 edit-teddy-button">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L10.582 16.07a4.5 4.5 0 0 1-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 0 1 1.13-1.897l8.932-8.931Zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0 1 15.75 21H5.25A2.25 2.25 0 0 1 3 18.75V8.25A2.25 2.25 0 0 1 5.25 6H10" />
                                    <title>Edit</title>
                                    </svg>

                                    <button class="edit-teddy-submit">Submit</button>
                                </div>
                            </form>
                        </c:forEach>
                        <button data-product-id="${s.productId}" class="add-teddy-button">Add teddy</button>
                    </div>

                    <!--edit-form-->
                    <form class="table-edit table-edit-${s.productId}" action="prosupdate" method="post">
                        <input class="table-id" type="text" value="${s.productId}" name="productId" readonly/>
                        <input class="table-name" type="text" value="${s.productName}" name="productName" />
                        <input class="table-origin" type="text" value="${s.origin}" name="origin" />
                        <input class="table-descrip" type="text" value="${s.description}" name="description" />
                        <input class="table-manu" type="text" value="${s.manufacturer}" name="manufacturer" />
                        <p class="table-sold"></p>
                        <p class="table-image"></p>
                        <input class="table-type" type="text" value="${s.type}" name="type" />
                        <select class="table-status" value="${s.status}" name="status">
                            <option ${s.status.compareTo('available') == 0 ? 'selected' : ''} value="available">available</option>
                            <option ${s.status.compareTo('preorder') == 0 ? 'selected' : ''} value="preorder">pre-order</option>
                            <option ${s.status.compareTo('onsale') == 0 ? 'selected' : ''} value="onsale">on-sale</option>
                            <option ${s.status.compareTo('freeship') == 0 ? 'selected' : ''} value="freeship">free-ship</option>
                            <option ${s.status.compareTo('outofstock') == 0 ? 'selected' : ''} value="outofstock">out of stock</option>
                            <option ${s.status.compareTo('layoff') == 0 ? 'selected' : ''} value="layoff">lay-off</option>
                        </select>

                        <p class="table-action">
                            <button class="submit-edit-button">Submit</button>
                        </p>
                    </form>
                </c:forEach>

                <a href="admin.jsp" class="home-button">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
                    <path fill-rule="evenodd" d="M18 10a.75.75 0 0 1-.75.75H4.66l2.1 1.95a.75.75 0 1 1-1.02 1.1l-3.5-3.25a.75.75 0 0 1 0-1.1l3.5-3.25a.75.75 0 1 1 1.02 1.1l-2.1 1.95h12.59A.75.75 0 0 1 18 10Z" clip-rule="evenodd" />
                    </svg>

                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
                    <path fill-rule="evenodd" d="M9.293 2.293a1 1 0 0 1 1.414 0l7 7A1 1 0 0 1 17 11h-1v6a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1v-3a1 1 0 0 0-1-1H9a1 1 0 0 0-1 1v3a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-6H3a1 1 0 0 1-.707-1.707l7-7Z" clip-rule="evenodd" />
                    </svg>

                </a>

            </div>
        </main>
        <!--add-form-->
        <div class="form-container">
            <form class="add-form" action="prosupdate" method="POST">
                <h2>Add New Product</h2>
                <div class="form-row">
                    <label>Product Name</label>
                    <input required type="text" name="productName"/>
                </div>
                <div class="form-row">
                    <label>Origin</label>
                    <input required type="text" name="origin"/>
                </div>
                <div class="form-row">
                    <label>Description</label>
                    <input required type="text" name="description" />
                </div>
                <div class="form-row">
                    <label>Manufacturer</label>
                    <input required type="manufacturer" name="manufacturer" />
                </div>
                <div class="form-row">
                    <label>Images</label>
                    <input required type="images" name="images" />
                </div>
                <div class="form-row">
                    <label>Type</label>
                    <input required type="type" name="type"/>
                </div>
                <div class="form-row">
                    <label>Status</label>
                    <select class="table-status" value="${s.status}" name="status">
                        <option value="available">available</option>
                        <option value="preorder">preorder</option>
                        <option value="onsale">onsale</option>
                        <option value="freeship">freeship</option>
                    </select>
                </div>

                <div class="button-container">
                    <button type="submit">Add product</button>
                    <button class="cancel-button" type="reset">Cancel</button>
                </div>
            </form>
        </div>

        <script>
            let clicked = false;
            document.querySelector(".type-icon").addEventListener('click', () => {
                clicked = !clicked;
                document.querySelector(".type-form").style.display = clicked ? 'block' : 'none';
            });

            document.querySelector(".add-button").addEventListener('click', () => {
                document.querySelector('.form-container').style.display = 'flex';
            });
            document.querySelector(".cancel-button").addEventListener('click', () => {
                document.querySelector('.form-container').style.display = 'none';
            });
            document.querySelectorAll(".edit-button").forEach((button) => {
                let clicked = false;
                button.addEventListener('click', () => {
                    const productId = button.dataset.productId;
                    clicked = !clicked;
                    document.querySelector('.table-edit-' + productId).style.display = clicked ? 'flex' : 'none';
                });
            });

            document.querySelectorAll(".detail-button").forEach((button) => {
                let clicked = false;
                button.addEventListener('click', () => {
                    const productId = button.dataset.productId;
                    clicked = !clicked;
                    document.querySelector('.product-detail-' + productId).style.display = clicked ? 'block' : 'none';
                });
            });

            document.querySelectorAll(".edit-teddy-button").forEach((button) => {
                button.addEventListener('click', () => {
                    const teddyId = button.dataset.teddyId;
                    document.querySelector('.table-teddy-' + teddyId + ' button').style.display = 'block';
                    document.querySelector('.table-teddy-' + teddyId + ' .teddy-color input').readOnly = false;
                    document.querySelector('.table-teddy-' + teddyId + ' .teddy-size input').readOnly = false;
                    document.querySelector('.table-teddy-' + teddyId + ' .teddy-price input').readOnly = false;
                    document.querySelector('.table-teddy-' + teddyId + ' .teddy-quantity input').readOnly = false;
                });
            });

            document.querySelectorAll(".add-teddy-button").forEach((button) => {
                button.addEventListener('click', () => {
                    const productId = button.dataset.productId;
                    document.querySelector('.product-detail-' + productId).innerHTML += `
                            <form action="teddy" method="post" class="table-teddy">
                                <div class="teddy-color">
                                    <label>ProductId</label>
                                    <input readonly value='` + productId + `' name="productId"/>

                                </div>
                                
                                <div class="teddy-color">
                                    <label>Color</label>
                                    <input placeholder="Color" type="text" name="color">

                                </div>
                                <div class="teddy-size">
                                    <label>Size</label>
                                    <select name="size">
                                        <option value="Small" >Small</option>
                                        <option value="Medium" >Medium</option>
                                        <option value="Large" >Large</option>
                                    </select>
                                </div>
                                <div class="teddy-quantity">
                                    <label>Quantity</label>
                                    <input placeholder="Quantity" type="number" name="quantity"></div>
                                <div class="teddy-price">
                                    <label>Price</label>
                                    <input placeholder="Price" type="text" name="price">
                                </div>
                                <div class="table-action">
                                    <button>Create teddy</button>
                                </div>
                            </form>
`
                });
            });

        </script>
    </body>
</html>
