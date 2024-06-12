export function calculateTotalPrice() {
  const startDateInput = document.getElementById('reservation_start_date');
  const endDateInput = document.getElementById('reservation_end_date');
  const priceElement = document.getElementById('outfit-price');
  const totalPriceElement = document.getElementById('total-price');

  if (startDateInput && endDateInput && priceElement && totalPriceElement) {
    const updateTotalPrice = () => {
      const startDate = new Date(startDateInput.value);
      const endDate = new Date(endDateInput.value);
      const pricePerDay = parseFloat(priceElement.dataset.pricePerDay);

      if (startDate && endDate && !isNaN(startDate) && !isNaN(endDate)) {
        const timeDiff = endDate - startDate;
        const dayDiff = timeDiff / (1000 * 3600 * 24) + 1; // +1 to include the start date
        if (dayDiff > 0) {
          const totalPrice = dayDiff * pricePerDay;
          totalPriceElement.textContent = `Total Price: €${totalPrice.toFixed(2)}`;
        } else {
          totalPriceElement.textContent = 'Invalid date range';
        }
      } else {
        totalPriceElement.textContent = 'Total Price: €0.00';
      }
    };

    startDateInput.addEventListener('change', updateTotalPrice);
    endDateInput.addEventListener('change', updateTotalPrice);
  }
}
