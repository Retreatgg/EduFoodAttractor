<#import "../layout.ftlh" as main>
<#import "../pagination.ftlh" as p>
<@main.layout>
    <section class="slider_section position-relative">
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="slider_item-box">
                        <div class="slider_item-container">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="slider_item-detail">
                                            <h1 class="mt-5">
                                                Добро пожаловать в EDUFOOD
                                            </h1>
                                            <p class="mt-4">
                                                There are many variations of passages of Lorem
                                                Ipsum available, but the majority have suffered
                                                alteration in some form, by injected humour, or
                                                randomised words which don't look even slightly
                                                believable.
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="slider_img-box">
                                            <img src="images/slide-img.png" alt="" class="img-fluid"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="fruit_section bg-light">
        <div class="container">

            <div class="search-container mb-5">
                <form action="/" method="GET">
                    <input autocomplete="off" type="search" id="search" name="restaurantName"
                           class="search-input form-control" placeholder="Поиск ресторана" value="${restaurantName!}"/>
                    <div class="quote_btn-container">
                        <button class="search-button btn btn-dark" type="submit">
                            Поиск
                        </button>
                    </div>
                </form>
            </div>

            <h2 class="custom_heading mt-3 text-center">Рестораны</h2>
            <p class="custom_heading-text text-center">
                Добро пожалойте в наши рестораны! Наслаждайтесь нашими блюдами и возможностью доставки домой.
            </p>

            <#if page.getSize() lt 1>
                <h5>Увы! Ресторанов с таким названием не нашли!</h5>
            <#else>
                <div class="row row-cols-1 row-cols-md-2 g-4">
                    <#list page.getContent() as restaurant>
                        <div class="col">
                            <div class="card">
                                <img src="/images/default/restaurant${restaurant.id}.jpeg" class="card-img-top"
                                     alt="${restaurant.name}">
                                <div class="card-body flex-grow-1 d-flex flex-column justify-content-end">
                                    <h5 class="card-title">${restaurant.name}</h5>
                                    <p class="card-text">${restaurant.description}</p>
                                    <a href="/restaurant/${restaurant.id}" class="btn btn-dark mt-auto">Перейти в
                                        ресторан</a>
                                </div>
                            </div>
                        </div>
                    </#list>
                </div>
            </#if>
        </div>
        </div>
    </section>

    <div class="container">
        <#if restaurantName??>
            <@p.pagination page=pageNumber maxPage=maxPage path="/" restaurantName=restaurantName/>
        <#else>
            <@p.pagination page=pageNumber maxPage=maxPage path="/" restaurantName=""/>
        </#if>
    </div>


    <style>

        .card{
            height: 950px;
        }

    </style>
</@main.layout>