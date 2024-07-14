document.addEventListener("DOMContentLoaded", function () {
    var cartAmountElements = document.getElementsByClassName("price_format");
    for (var i = 0; i < cartAmountElements.length; i++) {
        var amount = cartAmountElements[i].innerText;
        var formattedAmount = formatAmountWithCommas(amount);
        cartAmountElements[i].innerText = formattedAmount + " đ";
    }
});

function formatAmountWithCommas(amount) {
    return parseFloat(amount).toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}

