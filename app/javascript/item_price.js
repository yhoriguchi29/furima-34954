window.addEventListener('load', () => {

  const formatter = new Intl.NumberFormat('ja-JP');
  
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
  
  const addTaxDom = document.getElementById("add-tax-price")
  addTaxDom.innerHTML = formatter.format(Math.floor(inputValue * 0.1))
    const taxDomValue = addTaxDom.value

  const netPrice = document.getElementById("profit")
  netPrice.innerHTML = formatter.format(Math.floor(inputValue * 0.9))
    const netPriceValue = netPrice.value
  })
})