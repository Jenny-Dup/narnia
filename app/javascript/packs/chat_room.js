document.addEventListener("turbolinks:load", () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const roomId = messagesContainer.dataset.roomId;

    // Function to append a new message
    const appendMessage = (messageHTML) => {
      messagesContainer.insertAdjacentHTML('beforeend', messageHTML);
      messagesContainer.scrollTop = messagesContainer.scrollHeight;
    };

    // Listen for form submission to send new message via AJAX
    document.getElementById('new_message').addEventListener('submit', (e) => {
      e.preventDefault();
      const form = e.target;
      const formData = new FormData(form);
      const submitButton = form.querySelector('input[type="submit"]');

      // Disable the submit button
      submitButton.setAttribute('disabled', 'disabled');

      fetch(form.action, {
        method: 'POST',
        headers: {
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
          'Accept': 'text/javascript' // Ensure we expect JS response
        },
        body: formData
      })
      .then(response => {
        if (!response.ok) throw new Error('Network response was not ok');
        return response.text();
      })
      .then(data => {
        form.reset();
        appendMessage(data);
        submitButton.removeAttribute('disabled'); // Re-enable the submit button
      })
      .catch(error => {
        console.error('Error:', error);
        submitButton.removeAttribute('disabled'); // Re-enable the submit button in case of error
      });
    });
  }
});
