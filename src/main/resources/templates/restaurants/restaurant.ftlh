<#import "../layout.ftlh" as main>
<@main.layout>
    <style>
        h1, h2 {
            font-weight: 700; }

        .subheading {
            color: #f34949; }

        .bg-white {
            background-color: #fff; }

        a {
            color: #f34949; }

        a:focus,
        button:focus {
            outline: none;
            box-shadow: none; }

        .btn-icon {
            font-size: 30px;
            margin-right: 10px; }

        .navbar-brand-center img {
            height: 50px; }



        .hero-info li {
            padding-right: 15px;
            padding-left: 15px; }
        .

        .menus:hover img {
            transform: scale(1.1, 1.1); }

        .menu-img {
            overflow: hidden;
            height: 80px;
            width: 80px; }
        .menu-img img {
            transition: all .5s ease;
            height: 100%;
            object-fit: cover; }

        .menu-price {
            text-align: right; }

        .menus {
            padding-bottom: 15px;
            margin-bottom: 15px;
            border-bottom: 1px dashed #ccc; }
        .menus p, .menus h3 {
            margin-bottom: 0; }
        .menus .text-wrap {
            width: calc(100% - 95px);
            margin-left: 15px; }
        .menus .text-wrap h4 {
            font-weight: 300; }

        .owl-dot span {
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            outline: none;
            border-radius: 50%;
            background-color: #fff;
            background-color: rgba(255, 255, 255, 0.3);
            text-indent: -999em;
            cursor: pointer;
            position: absolute;
            box-shadow: 0 0 0 2px rgba(255, 255, 255, 0);
            -webkit-transition: box-shadow 0.3s ease, background-color 0.3s ease;
            transition: box-shadow 0.3s ease, background-color 0.3s ease; }
        .owl-dot.active > span {
            background-color: transparent;
            box-shadow: 0 0 0 2px white; }



    </style>

    <section id="gtco-welcome" class="bg-white section-padding">
        <div class="container">
            <div class="section-content mb-5 mt-5">
                <div class="row">
                    <div class="col-sm-5 img-bg d-flex shadow align-items-center justify-content-center justify-content-md-end img-2" style="background-image: url(img/hero-2.jpg);">
                        <img class="img-fluid" src="/images/default/restaurant${restaurant.id}.jpeg" alt="logo">
                    </div>
                    <div class="col-sm-7 py-5 pl-md-0 pl-4">
                        <div class="heading-section pl-lg-5 ml-md-5">
                            <h2>
                                Вас приветствует ${restaurant.name}! <br>Добро пожаловать!
                            </h2>
                        </div>
                        <div class="pl-lg-5 ml-md-5">
                            <p>${restaurant.description}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section id="gtco-menu" class="section-padding mt-5">
        <div class="container">
            <div class="section-content">
                <div class="row mb-5">
                    <div class="col-md-12">
                        <div class="heading-section text-center">
                            <h2>
                                Вот список того, что вы можете заказать у нас:
                            </h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 menu-wrap">
                        <#list dishes as dish>
                            <div class="menus d-flex align-items-center">
                                <div class="menu-img rounded-circle">
                                    <img class="img-fluid" src="/images/default/dish${dish.id}.jpg" alt="">
                                </div>
                                <div class="text-wrap">
                                    <div class="row align-items-start">
                                        <div class="col-8">
                                            <h4>${dish.name}</h4>
                                        </div>
                                        <div class="col-4">
                                            <h4 class="text-muted menu-price">${dish.price}</h4>
                                        </div>
                                    </div>
                                    <p>${dish.description}</p>
                                    <form onsubmit="addToCart(${restaurant.id}, '${restaurant.name}', ${dish.id}, '${dish.name}', '${dish.price}'); return false;">
                                        <input type="hidden" name="restaurantId" value="${restaurant.id}">
                                        <input type="hidden" name="restaurantName" value="${restaurant.name}">
                                        <input type="hidden" name="dishId" value="${dish.id}">
                                        <input type="hidden" name="dishName" value="${dish.name}">
                                        <input type="hidden" name="dishPrice" value="${dish.price}">
                                        <button type="submit" class="btn btn-primary">Добавить в корзину</button>
                                    </form>
                                </div>
                            </div>
                        </#list>
                    </div>
                </div>
            </div>
        </div>
    </section>


<#--модальное окно корзины-->
    <div class="modal fade" id="cartModal" tabindex="-1" role="dialog" aria-labelledby="cartModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="cartModalLabel">Ваша корзина</h5>
                </div>
                <div class="modal-body">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрыть</button>
                    <button type="button" class="btn btn-danger" onclick="clearCart()">Очистить корзину</button>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-dismiss="modal" data-target="#totalPriceModal">Оформить заказ</button>
                </div>
            </div>
        </div>
    </div>
<#--модальное окно корзины-->


    <!--модальное окно для общего прайса -->
    <div class="modal fade" id="totalPriceModal" tabindex="-1" role="dialog" aria-labelledby="totalPriceModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="totalPriceModalLabel">Оформление заказа</h5>
                </div>
                <div class="modal-body">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрыть</button>
                </div>
            </div>
        </div>
    </div>
    <!--модальное окно для общего прайса -->


<script>
    function addToCart(restaurantId, restaurantName, dishId, dishName, dishPrice) {
        let cartItems = JSON.parse(localStorage.getItem('cartItems')) || [];

        cartItems.push({ restaurantId: restaurantId, restaurantName: restaurantName, dishId: dishId, dishName: dishName, dishPrice: dishPrice });

        localStorage.setItem('cartItems', JSON.stringify(cartItems));
    }

    $(document).ready(function() {
        function displayCartItems(cartItems) {
            let modalBody = $('.modal-body');
            modalBody.empty();
            cartItems.forEach(function(item) {
                modalBody.append('<h5>' + item.restaurantName + '</h5>');
                modalBody.append('<p>' + item.dishName + ' - ' + item.dishPrice + '</p>');
            });
        }

        function calculateTotalPrice(cartItems) {
            let totalPrice = 0;
            cartItems.forEach(function(item) {
                totalPrice += parseFloat(item.dishPrice);
            });
            clearCart();
            return totalPrice.toFixed(2);
        }


        $('.btn.btn-primary[data-toggle="modal"][data-target="#cartModal"]').click(function() {
            let cartItems = JSON.parse(localStorage.getItem('cartItems')) || [];
            displayCartItems(cartItems);
        });

        $('.btn.btn-primary[data-dismiss="modal"][data-toggle="modal"][data-target="#totalPriceModal"]').click(function() {
            $('#cartModal').modal('hide');
            let cartItems = JSON.parse(localStorage.getItem('cartItems')) || [];
            let totalPrice = calculateTotalPrice(cartItems);
            $('#totalPriceModal .modal-body').html('<p>Общая сумма покупки: ' + totalPrice + '</p>');

            $('#totalPriceModal .btn.btn-primary').click(function() {

            });
        });

        $('#totalPriceModal .btn.btn-primary').click(function() {

        });
    });

    function clearCart() {
        localStorage.removeItem('cartItems');
        $.post('/{restaurantId}/clearCart', function() {
        });
    }

</script>
</@main.layout>
