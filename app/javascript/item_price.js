window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  const ProfitDom = document.getElementById("profit");
  
  // 販売手数料を計算する
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
  // 販売手数料を引く
  ProfitDom.innerHTML = inputValue - addTaxDom.innerHTML;
  })
});