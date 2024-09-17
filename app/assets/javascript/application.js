document.addEventListener('DOMContentLoaded', () => {
    // Функциональность модального окна
    const modal = document.getElementById('event-modal');
    const modalClose = document.querySelector('.modal-close');
    const modalBody = document.getElementById('modal-body');

    // Открытие модального окна при клике на карточку мероприятия
    const eventCards = document.querySelectorAll('.event-card');
    eventCards.forEach(card => {
        card.addEventListener('click', (e) => {
            e.preventDefault();
            const eventId = card.getAttribute('data-event-id');

            // Получение деталей мероприятия через AJAX
            fetch(`/events/${eventId}/modal`)
                .then(response => response.text())
                .then(html => {
                    modalBody.innerHTML = html;
                    modal.style.display = 'block';
                })
                .catch(error => {
                    console.error('Ошибка при загрузке деталей мероприятия:', error);
                });
        });
    });

    // Закрытие модального окна
    modalClose.addEventListener('click', () => {
        modal.style.display = 'none';
    });

    // Закрытие модального окна при клике вне его
    window.addEventListener('click', (e) => {
        if (e.target == modal) {
            modal.style.display = 'none';
        }
    });
});
