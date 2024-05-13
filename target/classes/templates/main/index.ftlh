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
                <input autocomplete="off" type="search" id="search" class="search-input form-control" placeholder="Поиск ресторана" />
                <div class="quote_btn-container">
                    <button class="search-button btn btn-dark" type="button">
                        Поиск
                    </button>
                </div>
            </div>

            <h2 class="custom_heading mt-3 text-center">Рестораны</h2>
            <p class="custom_heading-text text-center">
                Добро пожалойте в наши рестораны! Наслаждайтесь нашими блюдами и возможностью доставки домой.
            </p>
            <div class="row row-cols-1 row-cols-md-2 g-4" id="results">
            </div>
        </div>
    </section>


    <script>
        const restaurants = [
            <#list page.getContent() as restaurant>
            {
                name: '${restaurant.name?js_string}',
                id: '${restaurant.id?js_string}',
                description: '${restaurant.description?js_string}'
            },
            </#list>
        ];

        const search = document.getElementById("search");
        const results = document.getElementById("results");
        let search_term = "";

        search.addEventListener("input", (event) => {
            search_term = event.target.value.toLowerCase();
            showList();
        });

        const showList = () => {
            results.innerHTML = "";

            const filteredRestaurants = restaurants.filter((item) => {
                return item.name.toLowerCase().includes(search_term);
            });

            const listItems = filteredRestaurants.map((item) => {
                const card = document.createElement("div");
                card.classList.add('col', 'card', 'mb-4', 'd-flex', 'flex-column', 'h-100');

                const cardImage = document.createElement("img");
                cardImage.src = '/images/default/restaurant' + item.id + '.jpeg';
                cardImage.classList.add('card-img-top', 'img-fluid');
                cardImage.alt = "Логотип ресторана";

                const cardBody = document.createElement("div");
                cardBody.classList.add('card-body', 'flex-grow-1', 'd-flex', 'flex-column', 'justify-content-end');

                const cardTitle = document.createElement("h5");
                cardTitle.classList.add('card-title');
                cardTitle.textContent = item.name;

                const cardText = document.createElement("p");
                cardText.classList.add('card-text');
                cardText.textContent = item.description;

                const cardLink = document.createElement("a");
                cardLink.href = '/restaurant/' + item.id;
                cardLink.classList.add('btn', 'btn-dark', 'mt-auto');
                cardLink.textContent = 'Перейти в ресторан';

                cardBody.appendChild(cardTitle);
                cardBody.appendChild(cardText);
                cardBody.appendChild(cardLink);

                card.appendChild(cardImage);
                card.appendChild(cardBody);

                return card;
            });

            listItems.forEach((card) => {
                results.appendChild(card);
            });
        };

        showList();
    </script>

    <div class="container">
        <@p.pagination page=pageNumber maxPage=maxPage path="/"/>
    </div>
</@main.layout>