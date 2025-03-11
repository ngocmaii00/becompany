<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Becompany</title>
        <link rel="stylesheet" href="css/staffStyle.css"/>
    </head>
    <body>
        <header>
            <h2>BECOMPANY</h2>
            <h2>STAFFS</h2>
        </header>

        <main>
            <nav>
                <form action="staff" method="post" class="search">
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
                    <p class="table-firstname">First Name</p>
                    <p class="table-lastname">Last Name</p>
                    <p class="table-age">Birth</p>
                    <p class="table-status">Status</p>
                    <p class="table-role">Position</p>
                    <p class="table-mail">Email</p>
                    <p class="table-address">Address</p>
                    <p class="table-action">Actions</p>
                </div>

                <c:forEach items="${requestScope.staffs}" var="s">
                    <div class="table-data">
                        <p class="table-id">${s.getId()}</p>
                        <p class="table-firstname">${s.firstname}</p>
                        <p class="table-lastname">${s.lastname}</p>
                        <p class="table-age">${s.dob}</p>
                        <c:if test="${s.status == 'active'}">
                            <p class="table-status">
                                <button class="table-status-active">Active</button>
                            </p>
                        </c:if>

                        <c:if test="${s.status == 'inactive'}">
                            <p class="table-status">
                                <button class="table-status-deactive">Inactive</button>
                            </p>
                        </c:if>
                        <p class="table-role">${s.role}</p>
                        <p class="table-mail">${s.email}</p>
                        <p class="table-address">${s.address}</p>
                        <p class="table-action">

                            <svg data-staff-id="${s.getId()}" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6 edit-button">
                            <path stroke-linecap="round" stroke-linejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L10.582 16.07a4.5 4.5 0 0 1-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 0 1 1.13-1.897l8.932-8.931Zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0 1 15.75 21H5.25A2.25 2.25 0 0 1 3 18.75V8.25A2.25 2.25 0 0 1 5.25 6H10" />
                            <title>Edit</title>
                            </svg>

                        </p>
                    </div>

                    <!--edit-form-->
                    <form class="table-edit table-edit-${s.getId()}" action="staffupdate" method="post">
                        <input class="table-id" type="text" value="${s.getId()}" name="getId()" readonly/>
                        <input class="table-firstname" type="text" value="${s.firstname}" name="firstname"/>
                        <input class="table-lastname" type="text" value="${s.lastname}" name="lastname"/>
                        <input class="table-age" type="date" value="${s.dob}" name="dob"/>
                        <c:if test="${s.status == 'active'}">
                            <select class="table-status" value="${s.status}" name="status">
                                <option selected value="active">Active</option>
                                <option value="inactive">Inactive</option>
                            </select>
                        </c:if>

                        <c:if test="${s.status == 'inactive'}">
                            <select class="table-status" value="${s.status}" name="status">
                                <option value="active">Active</option>
                                <option selected value="inactive">Inactive</option>
                            </select>
                        </c:if>
                        <h1></h1>
                        <select class="table-role" name="position">
                            <option ${s.role.compareTo('STAFF') == 1 ? 'selected' : ''} value="STAFF">STAFF</option>
                            <option ${s.role.compareTo('ADMIN') == 1 ? 'selected' : ''} value="ADMIN">ADMIN</option>
                        </select>

                        <input class="table-mail" type="email" value="${s.email}" name="email"/>
                        <input class="table-address" type="text" value="${s.address}" name="address"/>
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
            <form class="add-form" action="staffupdate">
                <h2>Add New Staff</h2>
                <div class="form-row">
                    <label>First Name</label>
                    <input required type="text" name="firstName"/>
                </div>
                <div class="form-row">
                    <label>Last Name</label>
                    <input required type="text" name="lastName" />
                </div>
                <div class="form-row">
                    <label>Date of birth</label>
                    <input required type="date" name="dob"/>
                </div>
                <div class="form-row">
                    <label>Address</label>
                    <input required type="text" name="address" />
                </div>
                <div class="form-row">
                    <label>Email</label>
                    <input required type="email" name="email" />
                </div>
                <div class="form-row">
                    <label>Position</label>
                    <select class="table-role" value="${s.role}" name="position">
                        <option value="STAFF">STAFF</option>
                        <option value="ADMIN">ADMIN</option>
                    </select>
                </div>
                <div class="form-row">
                    <label>Username</label>
                    <input required type="text" name="username"/>
                </div>
                <div class="form-row">
                    <label>Password</label>
                    <input required type="password" name="password"/>
                </div>

                <div class="button-container">
                    <button type="submit">Add staff</button>
                    <button class="cancel-button" type="reset">Cancel</button>
                </div>
            </form>
        </div>

    </body>
    <script>
        document.querySelector(".add-button").addEventListener('click', () => {
            document.querySelector('.form-container').style.display = 'flex';
        });
        document.querySelector(".cancel-button").addEventListener('click', () => {
            document.querySelector('.form-container').style.display = 'none';
        });
        document.querySelectorAll(".edit-button").forEach((button) => {
            let clicked = false;
            button.addEventListener('click', () => {
                const getId = button.dataset.staffId;
                clicked = !clicked;
                document.querySelector('.table-edit-' + getId).style.display = clicked ? 'flex' : 'none';
            });
        });

    </script>
</html>
