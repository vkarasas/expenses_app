function removeAlert() {
    const alert = document.getElementById("successAlert");
    if (alert) alert.remove();
}

// Auto-remove after 10 seconds
setTimeout(removeAlert, 10000);

function onInput() {
    let quantity = 0
    let amount = 0;
    let totalAmount = 0;

    quantity = document.getElementById("quantityInput").value;
    amount = document.getElementById("amountInput").value;

    totalAmount = quantity * amount;

    document.getElementById("totalAmountInput").value = totalAmount;
}