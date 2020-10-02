function calc(){
  const itemPrice = document.getElementById("item-price");
  const value1 = itemPrice.value;
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  itemPrice.addEventListener("input", (e) =>{
    const price = value1
    const taxPrice = price * 0.1
    const profitPrice = price - taxPrice

  addTaxPrice.innerHTML = taxPrice;
  profit.innerHTML = profitPrice;
  })
};

window.addEventListener("load", calc);
