<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                    <h3 class="absolute text-white">Happy Valentine day!</h3>
                </div>
                <div class="dots flex absolute bottom-4 w-full justify-center">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="size-4 ">
                    <path d="M2 6.342a3.375 3.375 0 0 1 6-2.088 3.375 3.375 0 0 1 5.997 2.26c-.063 2.134-1.618 3.76-2.955 4.784a14.437 14.437 0 0 1-2.676 1.61c-.02.01-.038.017-.05.022l-.014.006-.004.002h-.002a.75.75 0 0 1-.592.001h-.002l-.004-.003-.015-.006a5.528 5.528 0 0 1-.232-.107 14.395 14.395 0 0 1-2.535-1.557C3.564 10.22 1.999 8.558 1.999 6.38L2 6.342Z" />
                    </svg>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="size-4 dots-chosen">
                    <path d="M2 6.342a3.375 3.375 0 0 1 6-2.088 3.375 3.375 0 0 1 5.997 2.26c-.063 2.134-1.618 3.76-2.955 4.784a14.437 14.437 0 0 1-2.676 1.61c-.02.01-.038.017-.05.022l-.014.006-.004.002h-.002a.75.75 0 0 1-.592.001h-.002l-.004-.003-.015-.006a5.528 5.528 0 0 1-.232-.107 14.395 14.395 0 0 1-2.535-1.557C3.564 10.22 1.999 8.558 1.999 6.38L2 6.342Z" />
                    </svg>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="size-4">
                    <path d="M2 6.342a3.375 3.375 0 0 1 6-2.088 3.375 3.375 0 0 1 5.997 2.26c-.063 2.134-1.618 3.76-2.955 4.784a14.437 14.437 0 0 1-2.676 1.61c-.02.01-.038.017-.05.022l-.014.006-.004.002h-.002a.75.75 0 0 1-.592.001h-.002l-.004-.003-.015-.006a5.528 5.528 0 0 1-.232-.107 14.395 14.395 0 0 1-2.535-1.557C3.564 10.22 1.999 8.558 1.999 6.38L2 6.342Z" />
                    </svg>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="size-4">
                    <path d="M2 6.342a3.375 3.375 0 0 1 6-2.088 3.375 3.375 0 0 1 5.997 2.26c-.063 2.134-1.618 3.76-2.955 4.784a14.437 14.437 0 0 1-2.676 1.61c-.02.01-.038.017-.05.022l-.014.006-.004.002h-.002a.75.75 0 0 1-.592.001h-.002l-.004-.003-.015-.006a5.528 5.528 0 0 1-.232-.107 14.395 14.395 0 0 1-2.535-1.557C3.564 10.22 1.999 8.558 1.999 6.38L2 6.342Z" />
                    </svg>
                </div>
            </div>

            <div class="hightlight">
                <h2>Best-sellers</h2>
                <div class="hightlight-container">
                    <div class="home-teddy">
                        <div class="home-teddy-img" style="
                             background-image: url('https://www.kawaiies.com/cdn/shop/files/kawaiies-plushies-plush-softtoy-fluffy-sleepy-capybara-with-orange-plushie-soft-toy-381962_1024x1024.jpg?v=1713722259');
                             "></div>
                        <div class="flex justify-between items-baseline">
                            <a class="home-teddy-name">Teddy Name Teddy Name</a>
                            <p class="home-teddy-price">100.000d</p>
                        </div>
                        <div>
                            <span class="home-teddy-color" style="background-color: #573a2e"></span>
                            <span class="home-teddy-color" style="background-color: #936649"></span>
                            <span class="home-teddy-color" style="background-color: #ffffff"></span>
                        </div>
                        <div class="home-teddy-sizes">
                            <span class="home-teddy-size">30cm</span>
                            <span class="home-teddy-size">40cm</span>
                            <span class="home-teddy-size">50cm</span>
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
                    <div class="home-teddy">
                        <div class="home-teddy-img" style="
                             background-image: url('https://th.bing.com/th/id/OIP.vOn5QZwVCEyzI1MIggzD-gHaHa?rs=1&pid=ImgDetMain');
                             "></div>
                        <div class="flex justify-between items-baseline">
                            <p class="home-teddy-name">Teddy Name</p>
                            <p class="home-teddy-price">100.000d</p>
                        </div>
                        <div>
                            <span class="home-teddy-color" style="background-color: #573a2e"></span>
                            <span class="home-teddy-color" style="background-color: #936649"></span>
                            <span class="home-teddy-color" style="background-color: #ffffff"></span>
                        </div>
                        <div class="home-teddy-sizes">
                            <span class="home-teddy-size">30cm</span>
                            <span class="home-teddy-size">40cm</span>
                            <span class="home-teddy-size">50cm</span>
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
                    <div class="home-teddy">
                        <div class="home-teddy-img" style="
                             background-image: url('https://th.bing.com/th/id/OIP.vhf9DOTANdaUh30c1yhABQHaFj?w=1024&h=768&rs=1&pid=ImgDetMain');
                             "></div>
                        <div class="flex justify-between items-baseline">
                            <p class="home-teddy-name">Teddy Name</p>
                            <p class="home-teddy-price">100.000d</p>
                        </div>
                        <div>
                            <span class="home-teddy-color" style="background-color: #573a2e"></span>
                            <span class="home-teddy-color" style="background-color: #936649"></span>
                            <span class="home-teddy-color" style="background-color: #ffffff"></span>
                        </div>
                        <div class="home-teddy-sizes">
                            <span class="home-teddy-size">30cm</span>
                            <span class="home-teddy-size">40cm</span>
                            <span class="home-teddy-size">50cm</span>
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
                    <div class="home-teddy">
                        <div class="home-teddy-img" style="
                             background-image: url('https://www.kawaiies.com/cdn/shop/files/kawaiies-plushies-plush-softtoy-fluffy-sleepy-capybara-with-orange-plushie-soft-toy-381962_1024x1024.jpg?v=1713722259');
                             "></div>
                        <div class="flex justify-between items-baseline">
                            <a class="home-teddy-name">Teddy Name Teddy Name</a>
                            <p class="home-teddy-price">100.000d</p>
                        </div>
                        <div>
                            <span class="home-teddy-color" style="background-color: #573a2e"></span>
                            <span class="home-teddy-color" style="background-color: #936649"></span>
                            <span class="home-teddy-color" style="background-color: #ffffff"></span>
                        </div>
                        <div class="home-teddy-sizes">
                            <span class="home-teddy-size">30cm</span>
                            <span class="home-teddy-size">40cm</span>
                            <span class="home-teddy-size">50cm</span>
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
                    <div class="home-teddy">
                        <div class="home-teddy-img" style="
                             background-image: url('https://th.bing.com/th/id/OIP.vOn5QZwVCEyzI1MIggzD-gHaHa?rs=1&pid=ImgDetMain');
                             "></div>
                        <div class="flex justify-between items-baseline">
                            <p class="home-teddy-name">Teddy Name</p>
                            <p class="home-teddy-price">100.000d</p>
                        </div>
                        <div>
                            <span class="home-teddy-color" style="background-color: #573a2e"></span>
                            <span class="home-teddy-color" style="background-color: #936649"></span>
                            <span class="home-teddy-color" style="background-color: #ffffff"></span>
                        </div>
                        <div class="home-teddy-sizes">
                            <span class="home-teddy-size">30cm</span>
                            <span class="home-teddy-size">40cm</span>
                            <span class="home-teddy-size">50cm</span>
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
                    <div class="home-teddy">
                        <div class="home-teddy-img" style="
                             background-image: url('https://th.bing.com/th/id/OIP.vhf9DOTANdaUh30c1yhABQHaFj?w=1024&h=768&rs=1&pid=ImgDetMain');
                             "></div>
                        <div class="flex justify-between items-baseline">
                            <p class="home-teddy-name">Teddy Name</p>
                            <p class="home-teddy-price">100.000d</p>
                        </div>
                        <div>
                            <span class="home-teddy-color" style="background-color: #573a2e"></span>
                            <span class="home-teddy-color" style="background-color: #936649"></span>
                            <span class="home-teddy-color" style="background-color: #ffffff"></span>
                        </div>
                        <div class="home-teddy-sizes">
                            <span class="home-teddy-size">30cm</span>
                            <span class="home-teddy-size">40cm</span>
                            <span class="home-teddy-size">50cm</span>
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
                    <div class="home-teddy">
                        <div class="home-teddy-img" style="
                             background-image: url('https://www.kawaiies.com/cdn/shop/files/kawaiies-plushies-plush-softtoy-fluffy-sleepy-capybara-with-orange-plushie-soft-toy-381962_1024x1024.jpg?v=1713722259');
                             "></div>
                        <div class="flex justify-between items-baseline">
                            <a class="home-teddy-name">Teddy Name Teddy Name</a>
                            <p class="home-teddy-price">100.000d</p>
                        </div>
                        <div>
                            <span class="home-teddy-color" style="background-color: #573a2e"></span>
                            <span class="home-teddy-color" style="background-color: #936649"></span>
                            <span class="home-teddy-color" style="background-color: #ffffff"></span>
                        </div>
                        <div class="home-teddy-sizes">
                            <span class="home-teddy-size">30cm</span>
                            <span class="home-teddy-size">40cm</span>
                            <span class="home-teddy-size">50cm</span>
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
                    <div class="home-teddy">
                        <div class="home-teddy-img" style="
                             background-image: url('https://th.bing.com/th/id/OIP.vOn5QZwVCEyzI1MIggzD-gHaHa?rs=1&pid=ImgDetMain');
                             "></div>
                        <div class="flex justify-between items-baseline">
                            <p class="home-teddy-name">Teddy Name</p>
                            <p class="home-teddy-price">100.000d</p>
                        </div>
                        <div>
                            <span class="home-teddy-color" style="background-color: #573a2e"></span>
                            <span class="home-teddy-color" style="background-color: #936649"></span>
                            <span class="home-teddy-color" style="background-color: #ffffff"></span>
                        </div>
                        <div class="home-teddy-sizes">
                            <span class="home-teddy-size">30cm</span>
                            <span class="home-teddy-size">40cm</span>
                            <span class="home-teddy-size">50cm</span>
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
                    <div class="home-teddy">
                        <div class="home-teddy-img" style="
                             background-image: url('https://th.bing.com/th/id/OIP.vhf9DOTANdaUh30c1yhABQHaFj?w=1024&h=768&rs=1&pid=ImgDetMain');
                             "></div>
                        <div class="flex justify-between items-baseline">
                            <p class="home-teddy-name">Teddy Name</p>
                            <p class="home-teddy-price">100.000d</p>
                        </div>
                        <div>
                            <span class="home-teddy-color" style="background-color: #573a2e"></span>
                            <span class="home-teddy-color" style="background-color: #936649"></span>
                            <span class="home-teddy-color" style="background-color: #ffffff"></span>
                        </div>
                        <div class="home-teddy-sizes">
                            <span class="home-teddy-size">30cm</span>
                            <span class="home-teddy-size">40cm</span>
                            <span class="home-teddy-size">50cm</span>
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

            </div>

            <div class="type"> 
                <div class="type-left">
                    <div class="type-header">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 3c2.755 0 5.455.232 8.083.678.533.09.917.556.917 1.096v1.044a2.25 2.25 0 0 1-.659 1.591l-5.432 5.432a2.25 2.25 0 0 0-.659 1.591v2.927a2.25 2.25 0 0 1-1.244 2.013L9.75 21v-6.568a2.25 2.25 0 0 0-.659-1.591L3.659 7.409A2.25 2.25 0 0 1 3 5.818V4.774c0-.54.384-1.006.917-1.096A48.32 48.32 0 0 1 12 3Z" />
                        </svg>
                        <h2>Filter</h2>
                    </div>

                    <form class="filter">
                        <div class="flex justify-between">
                            <div style="margin-right: 10px" class="filter-item">
                                <h4>Color</h4>
                                <select id="color" name="color">
                                    <option style="color: grey" value="">-Color-</option>
                                    <option value="brown">Brown</option>
                                    <option value="white">White</option>
                                    <option value="black">Black</option>
                                </select>
                            </div>
                            <div class="filter-item">
                                <h4>Size</h4>
                                <select class="filter-size" id="size" name="size">
                                    <option style="color: grey" value="">-Size-</option>
                                    <option value="30cm">30cm</option>
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
                    <h2>Teddy bear</h2>
                    <div class="type-container">
                        <div class="home-teddy">
                            <div class="home-teddy-img" style="
                                 background-image: url('https://www.kawaiies.com/cdn/shop/files/kawaiies-plushies-plush-softtoy-fluffy-sleepy-capybara-with-orange-plushie-soft-toy-381962_1024x1024.jpg?v=1713722259');
                                 "></div>
                            <div class="flex justify-between items-baseline">
                                <a class="home-teddy-name">Teddy Name Teddy Name</a>
                                <p class="home-teddy-price">100.000d</p>
                            </div>
                            <div>
                                <span class="home-teddy-color" style="background-color: #573a2e"></span>
                                <span class="home-teddy-color" style="background-color: #936649"></span>
                                <span class="home-teddy-color" style="background-color: #ffffff"></span>
                            </div>
                            <div class="home-teddy-sizes">
                                <span class="home-teddy-size">30cm</span>
                                <span class="home-teddy-size">40cm</span>
                                <span class="home-teddy-size">50cm</span>
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
                        <div class="home-teddy">
                            <div class="home-teddy-img" style="
                                 background-image: url('https://www.kawaiies.com/cdn/shop/files/kawaiies-plushies-plush-softtoy-fluffy-sleepy-capybara-with-orange-plushie-soft-toy-381962_1024x1024.jpg?v=1713722259');
                                 "></div>
                            <div class="flex justify-between items-baseline">
                                <a class="home-teddy-name">Teddy Name Teddy Name</a>
                                <p class="home-teddy-price">100.000d</p>
                            </div>
                            <div>
                                <span class="home-teddy-color" style="background-color: #573a2e"></span>
                                <span class="home-teddy-color" style="background-color: #936649"></span>
                                <span class="home-teddy-color" style="background-color: #ffffff"></span>
                            </div>
                            <div class="home-teddy-sizes">
                                <span class="home-teddy-size">30cm</span>
                                <span class="home-teddy-size">40cm</span>
                                <span class="home-teddy-size">50cm</span>
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
                        <div class="home-teddy">
                            <div class="home-teddy-img" style="
                                 background-image: url('https://www.kawaiies.com/cdn/shop/files/kawaiies-plushies-plush-softtoy-fluffy-sleepy-capybara-with-orange-plushie-soft-toy-381962_1024x1024.jpg?v=1713722259');
                                 "></div>
                            <div class="flex justify-between items-baseline">
                                <a class="home-teddy-name">Teddy Name Teddy Name</a>
                                <p class="home-teddy-price">100.000d</p>
                            </div>
                            <div>
                                <span class="home-teddy-color" style="background-color: #573a2e"></span>
                                <span class="home-teddy-color" style="background-color: #936649"></span>
                                <span class="home-teddy-color" style="background-color: #ffffff"></span>
                            </div>
                            <div class="home-teddy-sizes">
                                <span class="home-teddy-size">30cm</span>
                                <span class="home-teddy-size">40cm</span>
                                <span class="home-teddy-size">50cm</span>
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
                        <div class="home-teddy">
                            <div class="home-teddy-img" style="
                                 background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRa3LcBDJn4S8ST9soTG4fEgqc7tredG9Q2xA&s');
                                 "></div>
                            <div class="flex justify-between items-baseline">
                                <a class="home-teddy-name">Teddy Name Teddy Name</a>
                                <p class="home-teddy-price">100.000d</p>
                            </div>
                            <div>
                                <span class="home-teddy-color" style="background-color: #573a2e"></span>
                                <span class="home-teddy-color" style="background-color: #936649"></span>
                                <span class="home-teddy-color" style="background-color: #ffffff"></span>
                            </div>
                            <div class="home-teddy-sizes">
                                <span class="home-teddy-size">30cm</span>
                                <span class="home-teddy-size">40cm</span>
                                <span class="home-teddy-size">50cm</span>
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
                        <div class="home-teddy">
                            <div class="home-teddy-img" style="
                                 background-image: url('https://www.kawaiies.com/cdn/shop/files/kawaiies-plushies-plush-softtoy-fluffy-sleepy-capybara-with-orange-plushie-soft-toy-381962_1024x1024.jpg?v=1713722259');
                                 "></div>
                            <div class="flex justify-between items-baseline">
                                <a class="home-teddy-name">Teddy Name Teddy Name</a>
                                <p class="home-teddy-price">100.000d</p>
                            </div>
                            <div>
                                <span class="home-teddy-color" style="background-color: #573a2e"></span>
                                <span class="home-teddy-color" style="background-color: #936649"></span>
                                <span class="home-teddy-color" style="background-color: #ffffff"></span>
                            </div>
                            <div class="home-teddy-sizes">
                                <span class="home-teddy-size">30cm</span>
                                <span class="home-teddy-size">40cm</span>
                                <span class="home-teddy-size">50cm</span>
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
                        <div class="home-teddy">
                            <div class="home-teddy-img" style="
                                 background-image: url('https://www.kawaiies.com/cdn/shop/files/kawaiies-plushies-plush-softtoy-fluffy-sleepy-capybara-with-orange-plushie-soft-toy-381962_1024x1024.jpg?v=1713722259');
                                 "></div>
                            <div class="flex justify-between items-baseline">
                                <a class="home-teddy-name">Teddy Name Teddy Name</a>
                                <p class="home-teddy-price">100.000d</p>
                            </div>
                            <div>
                                <span class="home-teddy-color" style="background-color: #573a2e"></span>
                                <span class="home-teddy-color" style="background-color: #936649"></span>
                                <span class="home-teddy-color" style="background-color: #ffffff"></span>
                            </div>
                            <div class="home-teddy-sizes">
                                <span class="home-teddy-size">30cm</span>
                                <span class="home-teddy-size">40cm</span>
                                <span class="home-teddy-size">50cm</span>
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
                </div>
            </div>
        </main>
    </body>
</html>
