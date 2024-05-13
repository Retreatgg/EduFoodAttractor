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

            <div class="search-container">
                <input autocomplete="off" type="search" id="search" class="search-input" placeholder="Поиск ресторана" />
                <div class="quote_btn-container">
                    <button class="search-button " type="button">
                        Поиск
                    </button>
                </div>
            </div>

            <h2 class="custom_heading mt-5 text-center">Рестораны</h2>
            <p class="custom_heading-text text-center">
                Добро пожаловать в наши рестораны! Наслаждайтесь нашими блюдами и возможностью доставки домой.
            </p>
            <div class="row col-md-8 search-results" id="results">
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
                const mainDiv = document.createElement('div');
                mainDiv.classList.add('col-md-8')
                const div = document.createElement("div");
                div.classList.add('card', 'mb-4');

                const cardBody = document.createElement("div");
                cardBody.classList.add('card-body');

                const title = document.createElement("h5");
                title.classList.add('card-title');
                title.textContent = item.name;

                const description = document.createElement("p");
                description.classList.add('card-text');
                description.textContent = item.description;

                const linkContainer = document.createElement("div");

                const link = document.createElement("a");
                link.href = '/restaurant/' + item.id;
                link.classList.add('btn', 'btn-dark');
                link.textContent = "Посмотреть меню";

                linkContainer.appendChild(link);
                cardBody.appendChild(title);
                cardBody.appendChild(description);
                cardBody.appendChild(linkContainer);
                div.appendChild(cardBody);
                mainDiv.appendChild(div)

                return mainDiv;
            });

            listItems.forEach((li) => {
                results.appendChild(li);
            });
        };

        showList();
    </script>

    <div class="container">
        <#assign maxPage = page.content?size / pageSize>
        <@p.pagination page=pageNumber maxPage=maxPage path="/"/>
    </div>
</@main.layout>