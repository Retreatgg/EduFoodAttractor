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
            <h2 class="custom_heading mt-5 text-center">Рестораны</h2>
            <p class="custom_heading-text text-center">
                Вы здесь можете видеть наших ресторанов и в каждом из них вы можете сделать доставку домой!
            </p>
            <div class="row">
                <#list page.getContent() as restauran>
                    <div class="col-md-8">
                        <div class="card mb-4">
                            <div class="card-body">
                                <h5 class="card-title">${restauran.name}</h5>
                                <p class="card-text">${restauran.description}</p>
                                <a href="/restaurant/${restauran.id}" class="btn btn-dark">Перейти</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <img src="images/orange.png" class="card-img-top" alt="...">
                    </div>
                </#list>
            </div>
        </div>
    </section>

    <div class="container">
        <#assign maxPage = page.content?size / pageSize>
        <@p.pagination page=pageNumber maxPage=maxPage path="/"/>
    </div>
</@main.layout>