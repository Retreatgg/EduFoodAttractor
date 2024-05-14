<#macro pagination page maxPage path restaurantName>
    <#assign prevPage = page - 1>
    <#assign nextPage = page + 1>

    <nav aria-label="Page navigation example mt-4">
        <ul class="pagination justify-content-center">
            <#if page lt 1>
                <li class="page-item disabled">
                    <a class="page-link" href="${path}?page=0&restaurantName=${restaurantName}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            <#else>
                <li class="page-item">
                    <a class="page-link" href="${path}?page=${prevPage}&restaurantName=${restaurantName}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </#if>
            <li class="page-item"><a class="page-link" href="${path}?page=${page}&restaurantName=${restaurantName}">${page + 1}</a></li>
            <#if page gte maxPage - 1>
                <li class="page-item disabled">
                    <a class="page-link" href="${path}?page=${maxPage}&restaurantName=${restaurantName}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            <#else>
                <li class="page-item">
                    <a class="page-link" href="${path}?page=${nextPage}&restaurantName=${restaurantName}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </#if>
        </ul>
    </nav>
</#macro>
