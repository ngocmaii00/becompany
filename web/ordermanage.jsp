<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Becompany</title>
        <link rel="stylesheet" href="css/orderManageStyle.css"/>
    </head>
    <body>
        <header>
            <h2>BECOMPANY</h2>
            <h2>PRODUCTS</h2>
        </header>

        <main>
            <nav>
                <div style="flex-direction: row" class="action-all">
                    <svg class="ok-button-all" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">
                    <path fill-rule="evenodd" d="M2.25 12c0-5.385 4.365-9.75 9.75-9.75s9.75 4.365 9.75 9.75-4.365 9.75-9.75 9.75S2.25 17.385 2.25 12Zm13.36-1.814a.75.75 0 1 0-1.22-.872l-3.236 4.53L9.53 12.22a.75.75 0 0 0-1.06 1.06l2.25 2.25a.75.75 0 0 0 1.14-.094l3.75-5.25Z" clip-rule="evenodd" />
                    <title>Approve</title>
                    </svg>

                    <svg class="decline-button-all" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">
                    <path fill-rule="evenodd" d="M2.25 12c0-5.385 4.365-9.75 9.75-9.75s9.75 4.365 9.75 9.75-4.365 9.75-9.75 9.75S2.25 17.385 2.25 12ZM12 8.25a.75.75 0 0 1 .75.75v3.75a.75.75 0 0 1-1.5 0V9a.75.75 0 0 1 .75-.75Zm0 8.25a.75.75 0 1 0 0-1.5.75.75 0 0 0 0 1.5Z" clip-rule="evenodd" />
                    <title>Decline</title>
                    </svg>

                </div>

                <form action="ordermanage" method="post" class="search">
                    <input name="search" class="search-input" type="text" placeholder="Search"/>
                    <button style="background: transparent; border: none">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-5">
                        <path fill-rule="evenodd" d="M9 3.5a5.5 5.5 0 1 0 0 11 5.5 5.5 0 0 0 0-11ZM2 9a7 7 0 1 1 12.452 4.391l3.328 3.329a.75.75 0 1 1-1.06 1.06l-3.329-3.328A7 7 0 0 1 2 9Z" clip-rule="evenodd" />
                        </svg>
                    </button>
                </form>
            </nav>

            <div class="table">
                <div class="table-head">
                    <div class="table-all">
                        <input type="checkbox" class="all-product-check" name="all"/>
                        <label>Product</label>
                    </div>
                    <p class="table-name"></p>
                    <p class="table-price">Price</p>
                    <p class="table-quantity">Quantity</p>
                    <p class="table-username">Username</p>
                    <p class="table-address">Address</p>
                    <p class="table-delivery">Delivery</p>
                    <p class="table-estimate">Estimate</p>
                    <p class="table-action">Action</p>
                </div>

                <c:forEach items="${requestScope.orders}" var="s">
                    <div class="table-data">
                        <div class="table-all">
                            <input type="checkbox" class="all-product" name="all"/>
                            <div class="product-image" style="background-image: url('${s.image}')"></div>
                        </div>
                        <div class="table-name">
                            <p class="product-name">${s.productName}</p>
                            <div class="product-sc">
                                <p class="product-size">${s.size}</p>
                                <div class="product-color" style="background-color: ${s.color}"></div>
                            </div>
                        </div>
                        <p class="table-price">${s.pricePerPros}</p>
                        <p class="table-quantity">${s.boughtQuantity}</p>
                        <p class="table-username">${s.username}</p>
                        <p class="table-address">${s.userAddress}</p>
                        <p class="table-delivery">${s.delivery}</p>
                        <p class="table-estimate">${s.price}</p>
                        <div class="table-action">
                            <svg class="ok-button" data-teddy-id="${s.teddyId}" data-order-id='${s.orderId}' data-staff-id='${sessionScope.user.id}' xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">
                            <path fill-rule="evenodd" d="M2.25 12c0-5.385 4.365-9.75 9.75-9.75s9.75 4.365 9.75 9.75-4.365 9.75-9.75 9.75S2.25 17.385 2.25 12Zm13.36-1.814a.75.75 0 1 0-1.22-.872l-3.236 4.53L9.53 12.22a.75.75 0 0 0-1.06 1.06l2.25 2.25a.75.75 0 0 0 1.14-.094l3.75-5.25Z" clip-rule="evenodd" />
                            <title>Approve</title>
                            </svg>

                            <svg data-teddy-id="${s.teddyId}" data-order-id='${s.orderId}' data-staff-id='${sessionScope.user.id}' class="decline-button" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">
                            <path fill-rule="evenodd" d="M2.25 12c0-5.385 4.365-9.75 9.75-9.75s9.75 4.365 9.75 9.75-4.365 9.75-9.75 9.75S2.25 17.385 2.25 12ZM12 8.25a.75.75 0 0 1 .75.75v3.75a.75.75 0 0 1-1.5 0V9a.75.75 0 0 1 .75-.75Zm0 8.25a.75.75 0 1 0 0-1.5.75.75 0 0 0 0 1.5Z" clip-rule="evenodd" />
                            <title>Decline</title>
                            </svg>

                        </div>
                    </div>
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

        <script>
            let checked = false;
            document.querySelector(".all-product-check").addEventListener('click', () => {
                checked = !checked;
                document.querySelectorAll(".all-product").forEach((element) => {
                    element.checked = checked;
                })
            });

            document.querySelectorAll('.ok-button').forEach((button) => {
                button.addEventListener('click', () => {
                    const teddyId = button.dataset.teddyId;
                    const orderId = button.dataset.orderId;
                    const staffId = button.dataset.staffId;
                    window.location.href = 'checkorder?teddyId=' + teddyId + '&orderId=' + orderId + '&staffId=' + staffId + '&status=Shipping';
                })
            });

            document.querySelectorAll('.decline-button').forEach((button) => {
                button.addEventListener('click', () => {
                    const teddyId = button.dataset.teddyId;
                    const orderId = button.dataset.orderId;
                    const staffId = button.dataset.staffId;
                    window.location.href = 'checkorder?teddyId=' + teddyId + '&orderId=' + orderId + '&staffId=' + staffId + '&status=Declined';
                })
            });

//            document.querySelectorAll('.ok-button-all').addEventListener('click', () => {
//                    const teddyId = button.dataset.teddyId;
//                    const orderId = button.dataset.orderId;
//                    const staffId = button.dataset.staffId;
//                    window.location.href = 'checkorder?teddyId=' + teddyId + '&orderId=' + orderId + '&staffId=' + staffId + '&status=Shipping';
//                })
//            });
//
//            document.querySelectorAll('.decline-button-all').forEach((button) => {
//                button.addEventListener('click', () => {
//                    const teddyId = button.dataset.teddyId;
//                    const orderId = button.dataset.orderId;
//                    const staffId = button.dataset.staffId;
//                    window.location.href = 'checkorder?teddyId=' + teddyId + '&orderId=' + orderId + '&staffId=' + staffId + '&status=Declined';
//                })
//            });

        </script>
    </body>
</html>
