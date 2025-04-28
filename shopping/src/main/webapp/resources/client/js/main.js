(function ($) {
    "use strict";

    // Dropdown on mouse hover
    $(document).ready(function () {
        function toggleNavbarMethod() {
            if ($(window).width() > 992) {
                $('.navbar .dropdown').on('mouseover', function () {
                    $('.dropdown-toggle', this).trigger('click');
                }).on('mouseout', function () {
                    $('.dropdown-toggle', this).trigger('click').blur();
                });
            } else {
                $('.navbar .dropdown').off('mouseover').off('mouseout');
            }
        }
        toggleNavbarMethod();
        $(window).resize(toggleNavbarMethod);
    });


    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({ scrollTop: 0 }, 300, 'easeInOutExpo');
        return false;
    });



    // Vendor carousel
    $('.vendor-carousel').owlCarousel({
        loop: true,
        margin: 29,
        nav: false,
        autoplay: true,
        smartSpeed: 1000,
        responsive: {
            0: {
                items: 2
            },
            576: {
                items: 3
            },
            768: {
                items: 4
            },
            992: {
                items: 5
            },
            1200: {
                items: 6
            }
        }
    });


    // Related carousel
    $('.related-carousel').owlCarousel({
        loop: true,
        margin: 29,
        nav: false,
        autoplay: true,
        smartSpeed: 1000,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 2
            },
            768: {
                items: 3
            },
            992: {
                items: 4
            }
        }
    });


    // Product Quantity
    $('.quantity button').on('click', function () {
        let change = 0;

        var button = $(this);
        var oldValue = button.parent().parent().find('input').val();
        if (button.hasClass('btn-plus')) {
            var newVal = parseFloat(oldValue) + 1;
            change = 1;
        } else {
            if (oldValue > 1) {
                var newVal = parseFloat(oldValue) - 1;
                change = -1;
            } else {
                newVal = 1;
            }
        }
        const input = button.parent().parent().find('input');
        input.val(newVal);

        //set form index
        const index = input.attr("data-cart-detail-index")
        const el = document.getElementById(`cartDetails${index}.quantity`);
        $(el).val(newVal);


        //get price
        const price = input.attr("data-cart-detail-price");
        const id = input.attr("data-cart-detail-id");

        const priceElement = $(`p[data-cart-detail-id='${id}']`);
        if (priceElement) {
            const newPrice = +price * newVal;
            priceElement.text(formatCurrency(newPrice.toFixed(2)) + " đ");
        }

        //update total cart price
        const totalPriceElement = $(`p[data-cart-total-price]`);

        if (totalPriceElement && totalPriceElement.length) {
            const currentTotal = totalPriceElement.first().attr("data-cart-total-price");
            let newTotal = +currentTotal;
            if (change === 0) {
                newTotal = +currentTotal;
            } else {
                newTotal = change * (+price) + (+currentTotal);
            }

            //reset change
            change = 0;

            //update
            totalPriceElement?.each(function (index, element) {
                //update text
                $(totalPriceElement[index]).text(formatCurrency(newTotal.toFixed(2)) + " đ");

                //update data-attribute
                $(totalPriceElement[index]).attr("data-cart-total-price", newTotal);
            });
        }
    });

    function formatCurrency(value) {
        // Use the 'vi-VN' locale to format the number according to Vietnamese currency format
        // and 'VND' as the currency type for Vietnamese đồng
        const formatter = new Intl.NumberFormat('vi-VN', {
            style: 'decimal',
            minimumFractionDigits: 0, // No decimal part for whole numbers
        });

        let formatted = formatter.format(value);
        // Replace dots with commas for thousands separator
        formatted = formatted.replace(/\./g, ',');
        return formatted;
    }

    // add active class to header
    const navElement = $("#navbarCollapse");
    const currentUrl = window.location.pathname;
    navElement.find('a.nav-link').each(function () {
        const link = $(this); // Get the current link in the loop
        const href = link.attr('href'); // Get the href attribute of the link

        if (href === currentUrl) {
            link.addClass('active'); // Add 'active' class if the href matches the currentUrl
        }
        else {
            link.removeClass('active'); // Remove 'active' class if the href does not matches the currentUrl
        }
    });

    $(document).ready(function () {
        // Restore state from URL when page loads
        const currentUrl = new URL(window.location.href);
        const searchParams = currentUrl.searchParams;

        // Get values from URL
        const factoryValues = searchParams.get('factory') ? searchParams.get('factory').split(',') : [];
        const priceValues = searchParams.get('price') ? searchParams.get('price').split(',') : [];
        const categoryValues = searchParams.get('categoryName') ? searchParams.get('categoryName') : '';
        const sortValue = searchParams.get('sort') || 'khong-sap-xep'; // Giá trị mặc định nếu không có

        // Khôi phục trạng thái checkbox cho factoryFilter
        // Restore state checkbox for factoryFilter
        $("#factoryFilter .custom-control-input").each(function () {
            if (factoryValues.includes($(this).val())) {
                $(this).prop('checked', true);
            }
        });

        // Restore state checkbox for priceFilter
        $("#priceFilter .custom-control-input").each(function () {
            if (priceValues.includes($(this).val())) {
                $(this).prop('checked', true);
            }
        });

        // Restore state for radio sort
        $(`input[name="radio-sort"][value="${sortValue}"]`).prop('checked', true);


        // handle filter Products
        $('#btnFilter').click(function (event) {
            event.preventDefault();

            let factoryArr = [];
            let priceArr = [];

            // factory filter
            $("#factoryFilter .custom-control-input:checked").each(function () {
                factoryArr.push($(this).val());
            });

            // price filter
            $("#priceFilter .custom-control-input:checked").each(function () {
                priceArr.push($(this).val());
            });


            // sort order
            let sortValue = $('input[name="radio-sort"]:checked').val();

            const currentUrl = new URL(window.location.href);
            const searchParams = currentUrl.searchParams;

            // Add or update query paragrams
            searchParams.set('page', '1');
            searchParams.set('sort', sortValue);

            // reset 
            searchParams.delete('factory');
            searchParams.delete('price');
            searchParams.delete('search');
            searchParams.delete('sort');
            searchParams.delete('categoryName');


            if (categoryValues) { // Thêm lại categoryName từ categoryValues
                searchParams.set('categoryName', categoryValues);
            }
            if (factoryArr.length > 0) {
                searchParams.set('factory', factoryArr.join(','));
            }
            if (priceArr.length > 0) {
                searchParams.set('price', priceArr.join(','));
            }


            // Update the URL and reload the page
            window.location.href = currentUrl.toString();

        });
    });

    // delete filter when can't not product
    $('.btnDeleteFilter').click(function (event) {

        const currentUrl = new URL(window.location.href);
        const searchParams = currentUrl.searchParams;

        // reset 
        searchParams.delete('factory');
        searchParams.delete('price');
        searchParams.delete('page');
        searchParams.delete('sort');
        searchParams.delete('search');
        searchParams.delete('categoryName');

        // Update the URL and reload the page
        window.location.href = currentUrl.toString();
    });

    // from homepage page and detail page
    $('.btnAddToCart').click(function (event) {
        event.preventDefault();

        if (!isLogin()) {
            $.toast({
                heading: 'Lỗi thao tác',
                text: 'Bạn cần đăng nhập tà khoản',
                position: 'top-right',
                icon: 'error'
            })
            return;
        }

        const productId = $(this).attr('data-product-id');
        const token = $("meta[name='_csrf']").attr("content");
        const header = $("meta[name='_csrf_header']").attr("content");
        const quantity = $("#cartDetails0\\.quantity").val();
        console.debug;
        console.log(productId);
        console.log(quantity);
        $.ajax({
            url: `${window.location.origin}/api/add-product-to-cart`,
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            type: "POST",
            data: JSON.stringify({ quantity: quantity, productId: productId }),
            contentType: "application/json",


            success: function (response) {
                const sum = +response;
                // update cart
                $("#sumCart").text(sum)
                // show message
                $.toast({
                    heading: 'Giỏ hàng',
                    text: 'Thêm sản phẩm vào giỏ hàng thành công',
                    position: 'top-right',
                    icon: 'success',
                })
            },
            error: function (response) {
                alert("có lỗi xảy ra, check code đi mẹ")
                console.log("error: ", response);
            }
        });
    });


    function isLogin() {
        const navElement = $("#navbarCollapse");
        const childLogin = navElement.find('a.a-login'); // Sửa newVal thành navElement
        if (childLogin.length > 0) {
            return false;
        }
        return true;
    }


})(jQuery);

