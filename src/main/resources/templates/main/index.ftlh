<#import "../layout.ftlh" as main>
<#import "../pagination.ftlh" as p>
<@main.layout>

    <section class=" slider_section position-relative">
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="slider_item-box">
                        <div class="slider_item-container">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="slider_item-detail">
                                            <div>
                                                <h1>
                                                    Добро пожаловать <br/>
                                                    в EDUFOOD
                                                </h1>
                                                <p>
                                                    There are many variations of passages of Lorem
                                                    Ipsum available, but the majority have suffered
                                                    alteration in some form, by injected humour, or
                                                    randomised words which don't look even slightly
                                                    believable.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="slider_img-box">
                                            <div>
                                                <img src="images/slide-img.png" alt="" class=""/>
                                            </div>
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
    </div>

    <section class="fruit_section">
        <div class="container">
            <h2 class="custom_heading mt-5">Рестораны</h2>
            <p class="custom_heading-text">
                Вы здесь можете видеть наших ресторанов и в каждом из них вы можете сделать доставку домой!
            </p>
            <#list page.getContent() as restauran>
                <div class="row layout_padding2 m5-5">
                    <div class="col-md-8">
                        <div class="fruit_detail-box">
                            <h3>
                                ${restauran.name}
                            </h3>
                            <p class="mt-4">
                                ${restauran.description}
                            </p>
                            <div>
                                <button class="custom_dark-btn">
                                    <a href="/restaurant/${restauran.id}" class="custom_dark-btn">
                                        Перейти
                                    </a>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 d-flex justify-content-center align-items-center">
                        <div class="fruit_img-box d-flex justify-content-center align-items-center">
                            <img src="images/orange.png" alt="" class="" width="250px"/>
                        </div>
                    </div>
                </div>
            </#list>
        </div>
    </section>

    <#assign maxPage = page.content?size / pageSize>
    <@p.pagination page=pageNumber maxPage=maxPage path="/" totalElements=page.getTotalElements()>
    </@p.pagination>

</@main.layout>